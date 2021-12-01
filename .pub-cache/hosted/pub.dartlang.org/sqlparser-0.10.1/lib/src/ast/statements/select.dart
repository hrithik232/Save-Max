part of '../ast.dart';

abstract class BaseSelectStatement extends CrudStatement with ResultSet {
  /// The resolved list of columns returned by this select statements. Not
  /// available from the parse tree, will be set later by the analyzer.
  @override
  List<Column> resolvedColumns;

  BaseSelectStatement._(WithClause withClause) : super._(withClause);
}

/// Marker interface for classes that are a [BaseSelectStatement] but aren't a
/// [CompoundSelectStatement].
abstract class SelectStatementNoCompound implements BaseSelectStatement {}

class SelectStatement extends BaseSelectStatement
    implements StatementWithWhere, SelectStatementNoCompound {
  final bool distinct;
  final List<ResultColumn> columns;
  Queryable /*?*/ from;

  @override
  Expression where;
  GroupBy groupBy;
  final List<NamedWindowDeclaration> windowDeclarations;

  OrderByBase orderBy;
  LimitBase limit;

  SelectStatement(
      {WithClause withClause,
      this.distinct = false,
      @required this.columns,
      this.from,
      this.where,
      this.groupBy,
      this.windowDeclarations = const [],
      this.orderBy,
      this.limit})
      : super._(withClause);

  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitSelectStatement(this, arg);
  }

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {
    withClause = transformer.transformNullableChild(withClause, this, arg);
    transformer.transformChildren(columns, this, arg);
    from = transformer.transformNullableChild(from, this, arg);
    where = transformer.transformNullableChild(where, this, arg);
    groupBy = transformer.transformNullableChild(groupBy, this, arg);
//    transformer.transformChildren(windowDeclarations, this, arg);
    limit = transformer.transformNullableChild(limit, this, arg);
    orderBy = transformer.transformNullableChild(orderBy, this, arg);
  }

  @override
  Iterable<AstNode> get childNodes {
    return [
      if (withClause != null) withClause,
      ...columns,
      if (from != null) from,
      if (where != null) where,
      if (groupBy != null) groupBy,
      for (var windowDecl in windowDeclarations) windowDecl.definition,
      if (limit != null) limit,
      if (orderBy != null) orderBy,
    ];
  }

  @override
  bool contentEquals(SelectStatement other) {
    return other.distinct == distinct;
  }
}

class CompoundSelectStatement extends BaseSelectStatement {
  SelectStatementNoCompound base;
  final List<CompoundSelectPart> additional;

  // the grammar under https://www.sqlite.org/syntax/compound-select-stmt.html
  // defines an order by and limit clause on this node, but we parse them as
  // part of the last compound select statement in [additional]

  CompoundSelectStatement({
    WithClause withClause,
    @required this.base,
    this.additional = const [],
  }) : super._(withClause);

  @override
  Iterable<AstNode> get childNodes {
    return [if (withClause != null) withClause, base, ...additional];
  }

  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitCompoundSelectStatement(this, arg);
  }

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {
    withClause = transformer.transformNullableChild(withClause, this, arg);
    base = transformer.transformChild(base, this, arg);
    transformer.transformChildren(additional, this, arg);
  }

  @override
  bool contentEquals(CompoundSelectStatement other) {
    // this class doesn't contain anything but child nodes
    return true;
  }
}

/// A select statement of the form `VALUES (expr-list), ..., (expr-list-N)`.
class ValuesSelectStatement extends BaseSelectStatement
    implements SelectStatementNoCompound {
  final List<Tuple> values;

  ValuesSelectStatement(this.values, {WithClause withClause})
      : super._(withClause);

  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitValuesSelectStatement(this, arg);
  }

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {
    transformer.transformChildren(values, this, arg);
  }

  @override
  Iterable<AstNode> get childNodes => values;

  @override
  bool contentEquals(ValuesSelectStatement other) => true;
}

abstract class ResultColumn extends AstNode {
  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitResultColumn(this, arg);
  }
}

/// A result column that either yields all columns or all columns from a table
/// by using "*" or "table.*".
class StarResultColumn extends ResultColumn {
  final String tableName;

  StarResultColumn([this.tableName]);

  @override
  Iterable<AstNode> get childNodes => const [];

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {}

  @override
  bool contentEquals(StarResultColumn other) {
    return other.tableName == tableName;
  }
}

class ExpressionResultColumn extends ResultColumn
    implements Renamable, Referencable {
  Expression expression;
  @override
  final String as;

  ExpressionResultColumn({@required this.expression, this.as});

  @override
  bool get visibleToChildren => false;

  @override
  Iterable<AstNode> get childNodes => [expression];

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {
    expression = transformer.transformChild(expression, this, arg);
  }

  @override
  bool contentEquals(ExpressionResultColumn other) {
    return other.as == as;
  }
}

class GroupBy extends AstNode {
  /// The list of expressions that form the partition
  final List<Expression> by;
  Expression having;

  GroupBy({@required this.by, this.having});

  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitGroupBy(this, arg);
  }

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {
    transformer.transformChildren(by, this, arg);
    transformer.transformChild(having, this, arg);
  }

  @override
  Iterable<AstNode> get childNodes => [...by, if (having != null) having];

  @override
  bool contentEquals(GroupBy other) {
    return true; // Defined via child nodes
  }
}

enum CompoundSelectMode {
  union,
  unionAll,
  intersect,
  except,
}

class CompoundSelectPart extends AstNode {
  final CompoundSelectMode mode;
  SelectStatementNoCompound select;

  /// The first token of this statement, so either union, intersect or except.
  Token firstModeToken;

  /// The "ALL" token, if this is a "UNION ALL" part
  Token allToken;

  CompoundSelectPart({@required this.mode, @required this.select});

  @override
  Iterable<AstNode> get childNodes => [select];

  @override
  R accept<A, R>(AstVisitor<A, R> visitor, A arg) {
    return visitor.visitCompoundSelectPart(this, arg);
  }

  @override
  void transformChildren<A>(Transformer<A> transformer, A arg) {
    select = transformer.transformChild(select, this, arg);
  }

  @override
  bool contentEquals(CompoundSelectPart other) => mode == other.mode;
}
