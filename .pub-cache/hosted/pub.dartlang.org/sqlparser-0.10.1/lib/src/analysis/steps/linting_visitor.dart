part of '../analysis.dart';

/// Visitor that runs after all other steps ran and reports more complex lints
/// on an sql statement.
class LintingVisitor extends RecursiveVisitor<void, void> {
  final EngineOptions options;
  final AnalysisContext context;

  LintingVisitor(this.options, this.context);

  @override
  void visitCreateViewStatement(CreateViewStatement e, void arg) {
    final resolvedColumns = e.query.resolvedColumns;
    if (e.columns == null || resolvedColumns == null) {
      return super.visitCreateViewStatement(e, arg);
    }

    final amountOfNames = e.columns.length;
    final amountOfColumns = resolvedColumns.length;

    if (amountOfNames != amountOfColumns) {
      context.reportError(AnalysisError(
        type: AnalysisErrorType.viewColumnNamesMismatch,
        relevantNode: e,
        message: 'This view declares $amountOfNames column names, but the '
            'inner select statement returns $amountOfColumns',
      ));
    }

    visitChildren(e, arg);
  }

  @override
  void visitInvocation(SqlInvocation e, void arg) {
    final lowercaseCall = e.name.toLowerCase();
    if (options.addedFunctions.containsKey(lowercaseCall)) {
      options.addedFunctions[lowercaseCall].reportErrors(e, context);
    }

    visitChildren(e, arg);
  }

  @override
  void visitTuple(Tuple e, void arg) {
    if (!e.usedAsRowValue) return;

    bool isRowValue(Expression expr) => expr is Tuple || expr is SubQuery;

    var parent = e.parent;
    var isAllowed = false;

    if (parent is WhenComponent && e == parent.when) {
      // look at the surrounding case expression
      parent = parent.parent;
    }

    if (parent is BinaryExpression) {
      // Source: https://www.sqlite.org/rowvalue.html#syntax
      const allowedTokens = [
        TokenType.less,
        TokenType.lessEqual,
        TokenType.more,
        TokenType.moreEqual,
        TokenType.equal,
        TokenType.doubleEqual,
        TokenType.lessMore,
        TokenType.$is,
      ];

      if (allowedTokens.contains(parent.operator.type)) {
        isAllowed = true;
      }
    } else if (parent is BetweenExpression) {
      // Allowed if all value are row values or subqueries
      isAllowed = !parent.childNodes.any((e) => !isRowValue(e));
    } else if (parent is CaseExpression) {
      // Allowed if we have something to compare against and all comparisons
      // are row values
      if (parent.base == null) {
        isAllowed = false;
      } else {
        final comparisons = <Expression>[
          parent.base,
          for (final branch in parent.whens) branch.when
        ];

        isAllowed = !comparisons.any((e) => !isRowValue(e));
      }
    } else if (parent is InExpression) {
      // In expressions are tricky. The rhs can always be a row value, but the
      // lhs can only be a row value if the rhs is a subquery
      isAllowed = e == parent.inside || parent.inside is SubQuery;
    }

    if (!isAllowed) {
      context.reportError(AnalysisError(
        type: AnalysisErrorType.rowValueMisuse,
        relevantNode: e,
        message: 'Row values can only be used as expressions in comparisons',
      ));
    }
  }

  @override
  void visitValuesSelectStatement(ValuesSelectStatement e, void arg) {
    final expectedColumns = e.resolvedColumns.length;

    for (final tuple in e.values) {
      final elementsInTuple = tuple.expressions.length;

      if (elementsInTuple != expectedColumns) {
        context.reportError(AnalysisError(
          type: AnalysisErrorType.valuesSelectCountMismatch,
          relevantNode: tuple,
          message: 'The surrounding VALUES clause has $expectedColumns '
              'columns, but this tuple only has $elementsInTuple',
        ));
      }
    }

    visitChildren(e, arg);
  }
}
