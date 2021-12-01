import 'package:sqlparser/sqlparser.dart';

class Fts5Extension implements Extension {
  const Fts5Extension();

  @override
  void register(SqlEngine engine) {
    engine.registerModule(_Fts5Module());
    engine.registerFunctionHandler(const _Fts5Functions());
  }
}

/// FTS5 module for `CREATE VIRTUAL TABLE USING fts5` support
class _Fts5Module extends Module {
  _Fts5Module() : super('fts5');

  @override
  Table parseTable(CreateVirtualTableStatement stmt) {
    // arguments with an equals sign are parameters passed to the fts5 module.
    // they're not part of the schema.
    final columnNames =
        stmt.argumentContent.where((arg) => !arg.contains('=')).map((c) {
      // actual syntax is <name> <options...>
      return c.trim().split(' ').first;
    });

    return _Fts5Table(
      name: stmt.tableName,
      columns: [
        for (var arg in columnNames)
          TableColumn(arg, const ResolvedType(type: BasicType.text)),
      ],
      definition: stmt,
    );
  }
}

class _Fts5Table extends Table {
  _Fts5Table(
      {required String name,
      required List<TableColumn> columns,
      CreateVirtualTableStatement? definition})
      : super(
          name: name,
          resolvedColumns: [
            ...columns,
            _Fts5RankColumn(),
            _Fts5TableColumn(name),
          ],
          definition: definition,
          isVirtual: true,
        );
}

/// Provides type inference and lints for
class _Fts5Functions with ArgumentCountLinter implements FunctionHandler {
  const _Fts5Functions();

  @override
  Set<String> get functionNames => const {'bm25', 'highlight', 'snippet'};

  @override
  ResolveResult inferArgumentType(
      AnalysisContext context, SqlInvocation call, Expression argument) {
    int? argumentIndex;
    if (call.parameters is ExprFunctionParameters) {
      argumentIndex = (call.parameters as ExprFunctionParameters)
          .parameters
          .indexOf(argument);
    }
    if (argumentIndex == null || argumentIndex < 0) {
      // couldn't find expression in arguments, so we don't know the type
      return const ResolveResult.unknown();
    }

    switch (call.name) {
      case 'bm25':
        // bm25(fts_table)
        return const ResolveResult.unknown();
      case 'highlight':
        // highlight(fts_table, column_index, text_before, text_after)
        if (argumentIndex == 1) {
          return const ResolveResult(ResolvedType(type: BasicType.int));
        } else if (argumentIndex == 2 || argumentIndex == 3) {
          return const ResolveResult(ResolvedType(type: BasicType.text));
        }
        break;
      case 'snippet':
        // snippet(fts_table, column_index, phrase_before, phrase_after,
        //         text_before, max_tokens)
        if (argumentIndex == 1 || argumentIndex == 5) {
          return const ResolveResult(ResolvedType(type: BasicType.int));
        } else if (argumentIndex >= 2 || argumentIndex <= 4) {
          return const ResolveResult(ResolvedType(type: BasicType.text));
        }
        break;
    }
    return const ResolveResult.unknown();
  }

  @override
  ResolveResult inferReturnType(AnalysisContext context, SqlInvocation call,
      List<Typeable> expandedArgs) {
    switch (call.name) {
      case 'bm25':
        return const ResolveResult(ResolvedType(type: BasicType.real));
      case 'highlight':
        return const ResolveResult(ResolvedType(type: BasicType.text));
      case 'snippet':
        return const ResolveResult(ResolvedType(type: BasicType.text));
    }
    return const ResolveResult.unknown();
  }

  @override
  int? argumentCountFor(String function) {
    return const {
      'bm25': 1,
      'highlight': 4,
      'snippet': 6,
    }[function];
  }

  @override
  void reportErrors(SqlInvocation call, AnalysisContext context) {
    // it doesn't make sense to call fts5 functions with a star parameter
    if (call.parameters is StarFunctionParameter) {
      context.reportError(AnalysisError(
        relevantNode: call,
        message: '${call.name} should not be called with a star parameter',
        type: AnalysisErrorType.other,
      ));
      return;
    }

    final args = (call.parameters as ExprFunctionParameters).parameters;
    final expectedArgCount = argumentCountFor(call.name.toLowerCase());

    if (expectedArgCount != args.length) {
      reportArgumentCountMismatch(call, context, expectedArgCount, args.length);
      return;
    }

    Column? firstResolved;
    if (args.first is Reference) {
      firstResolved = (args.first as Reference).resolvedColumn;
    }

    // the first argument to all functions must be a fts5 table name
    if (firstResolved == null || firstResolved is! _Fts5TableColumn) {
      context.reportError(AnalysisError(
        relevantNode: args.first,
        message: 'Expected an fts5 table name here',
        type: AnalysisErrorType.other,
      ));
    }
  }
}

/// The rank column, which we introduce to support queries like
/// ```
/// SELECT * FROM my_fts_table WHERE my_fts_table MATCH 'foo' ORDER BY rank;
/// ```
class _Fts5RankColumn extends TableColumn {
  @override
  bool get includedInResults => false;

  _Fts5RankColumn()
      : super('rank', const ResolvedType(type: BasicType.real, nullable: true));
}

/// A column that has the same name as the fts5 it's from. We introduce this
/// column to support constructs like
/// ```
/// CREATE VIRTUAL TABLE foo USING fts5(bar, baz);
/// query: SELECT * FROM foo WHERE foo MATCH 'something';
/// ```
/// The easiest way to support that is to just make "foo" a column on that
/// table.
class _Fts5TableColumn extends TableColumn {
  @override
  bool get includedInResults => false;

  _Fts5TableColumn(String name)
      : super(name, const ResolvedType(type: BasicType.text));
}
