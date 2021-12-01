part of 'types.dart';

const _intType = ResolvedType(type: BasicType.int);
const _realType = ResolvedType(type: BasicType.real);
const _textType = ResolvedType(type: BasicType.text);

const _expectInt = ExactTypeExpectation.laxly(_intType);
const _expectNum = RoughTypeExpectation.numeric();
const _expectString = ExactTypeExpectation.laxly(_textType);

class TypeResolver extends RecursiveVisitor<TypeExpectation, void> {
  final TypeInferenceSession session;

  TypeResolver(this.session);

  void run(AstNode root) {
    visit(root, const NoTypeExpectation());

    // annotate Columns as well. They implement Typeable, but aren't an ast
    // node, which means this visitor doesn't find them
    root.acceptWithoutArg(_ResultColumnVisitor(this));

    session._finish();
  }

  @override
  void visitSelectStatement(SelectStatement e, TypeExpectation arg) {
    _handleWhereClause(e);

    var currentColumnIndex = 0;
    final columnExpectations = arg is SelectTypeExpectation
        ? arg.columnExpectations
        : const <TypeExpectation>[];

    for (final child in e.childNodes) {
      if (child == e.where) continue; // handled above

      if (child is ResultColumn) {
        if (child is ExpressionResultColumn) {
          final expectation = currentColumnIndex < columnExpectations.length
              ? columnExpectations[currentColumnIndex]
              : const NoTypeExpectation();
          visit(child, expectation);

          currentColumnIndex++;
        } else if (child is StarResultColumn) {
          currentColumnIndex += child.scope.availableColumns.length;
        }
      } else {
        visit(child, arg);
      }
    }
  }

  @override
  void visitInsertStatement(InsertStatement e, TypeExpectation arg) {
    if (e.withClause != null) visit(e.withClause, arg);
    visitList(e.targetColumns, const NoTypeExpectation());

    final targets = e.resolvedTargetColumns ?? const [];
    targets.forEach(_handleColumn);

    final expectations = targets.map((r) {
      if (session.graph.knowsType(r)) {
        return ExactTypeExpectation(session.typeOf(r));
      }
      return const NoTypeExpectation();
    }).toList();

    e.source.when(
      isSelect: (select) {
        visit(select.stmt, SelectTypeExpectation(expectations));
      },
      isValues: (values) {
        // todo: It would be nice to remove this special case. Can we generalize
        // the SelectTypeExpectation so that it works for tuples and just visit
        // e.source?
        for (final tuple in values.values) {
          for (var i = 0; i < tuple.expressions.length; i++) {
            final expectation = i < expectations.length
                ? expectations[i]
                : const NoTypeExpectation();
            visit(tuple.expressions[i], expectation);
          }
        }
      },
    );

    visitNullable(e.upsert, const NoTypeExpectation());
  }

  @override
  void visitCrudStatement(CrudStatement stmt, TypeExpectation arg) {
    if (stmt is StatementWithWhere) {
      final typedStmt = stmt as StatementWithWhere;
      _handleWhereClause(typedStmt);
      visitExcept(stmt, typedStmt.where, arg);
    } else {
      visitChildren(stmt, arg);
    }
  }

  @override
  void visitCreateIndexStatement(CreateIndexStatement e, TypeExpectation arg) {
    _handleWhereClause(e);
    visitExcept(e, e.where, arg);
  }

  @override
  void visitJoin(Join e, TypeExpectation arg) {
    final constraint = e.constraint;
    if (constraint is OnConstraint) {
      // ON <expr>, <expr> should be boolean
      visit(constraint.expression,
          const ExactTypeExpectation.laxly(ResolvedType.bool()));
      visitExcept(e, constraint.expression, arg);
    } else {
      visitChildren(e, arg);
    }
  }

  @override
  void visitSetComponent(SetComponent e, TypeExpectation arg) {
    visit(e.column, const NoTypeExpectation());
    _lazyCopy(e.expression, e.column);
    visit(e.expression, const NoTypeExpectation());
  }

  @override
  void visitLimit(Limit e, TypeExpectation arg) {
    visit(e.count, _expectInt);
    visitNullable(e.offset, _expectInt);
  }

  @override
  void visitFrameSpec(FrameSpec e, TypeExpectation arg) {
    // handle something like "RANGE BETWEEN ? PRECEDING AND ? FOLLOWING
    if (e.start.isExpressionOffset) {
      visit(e.start.offset, _expectInt);
    }
    if (e.end.isExpressionOffset) {
      visit(e.end.offset, _expectInt);
    }
  }

  @override
  void visitLiteral(Literal e, TypeExpectation arg) {
    ResolvedType type;
    var nullable = false;

    if (e is NullLiteral) {
      type = const ResolvedType(type: BasicType.nullType, nullable: true);
      nullable = true;
    } else if (e is StringLiteral) {
      type = e.isBinary ? const ResolvedType(type: BasicType.blob) : _textType;
    } else if (e is BooleanLiteral) {
      type = const ResolvedType.bool();
    } else if (e is NumericLiteral) {
      type = e.isInt ? _intType : _realType;
    } else if (e is TimeConstantLiteral) {
      type = _textType;
    }

    session._hintNullability(e, nullable);
    session._checkAndResolve(e, type, arg);
  }

  @override
  void visitVariable(Variable e, TypeExpectation arg) {
    _inferAsVariable(e, arg);
  }

  @override
  void visitDartPlaceholder(DartPlaceholder e, TypeExpectation arg) {
    if (e is DartExpressionPlaceholder) {
      _inferAsVariable(e, arg);
    } else {
      super.visitDartPlaceholder(e, arg);
    }
  }

  void _inferAsVariable(Expression e, TypeExpectation arg) {
    ResolvedType resolved;
    if (e is Variable) {
      resolved = session.context.stmtOptions.specifiedTypeOf(e);
    }
    resolved ??= _inferFromContext(arg);

    if (resolved != null) {
      session._checkAndResolve(e, resolved, arg);
    } else if (arg is RoughTypeExpectation) {
      session._addRelation(DefaultType(e, arg.defaultType()));
    }

    visitChildren(e, arg);
  }

  @override
  void visitUnaryExpression(UnaryExpression e, TypeExpectation arg) {
    final operatorType = e.operator.type;

    if (operatorType == TokenType.plus) {
      // plus is a no-op, so copy type from child
      session._addRelation(CopyTypeFrom(e, e.inner));
      visit(e.inner, arg);
    } else if (operatorType == TokenType.not) {
      // unary not expression - boolean, but nullability depends on child node.
      session._checkAndResolve(e, const ResolvedType.bool(nullable: null), arg);
      session._addRelation(NullableIfSomeOtherIs(e, [e.inner]));
      visit(e.inner, const ExactTypeExpectation.laxly(ResolvedType.bool()));
    } else if (operatorType == TokenType.minus) {
      // unary minus - can be int or real depending on child node
      session._addRelation(CopyAndCast(e, e.inner, CastMode.numeric));
      visit(e.inner, const RoughTypeExpectation.numeric());
    } else if (operatorType == TokenType.tilde) {
      // bitwise negation - definitely int, but nullability depends on child
      session._checkAndResolve(
          e, const ResolvedType(type: BasicType.int, nullable: null), arg);
      session._addRelation(NullableIfSomeOtherIs(e, [e.inner]));

      visit(e.inner, const NoTypeExpectation());
    } else {
      throw StateError(
          'Unary operator $operatorType not recognized by types2. At $e');
    }
  }

  @override
  void visitTuple(Tuple e, TypeExpectation arg) {
    // make children non-arrays
    for (final child in e.childNodes) {
      session._addRelation(CopyTypeFrom(child, e, array: false));
    }
  }

  @override
  void visitBetweenExpression(BetweenExpression e, TypeExpectation arg) {
    visitChildren(e, _expectNum);

    session
      .._addRelation(NullableIfSomeOtherIs(e, e.childNodes))
      .._addRelation(HaveSameType(e.lower, e.upper))
      .._addRelation(HaveSameType(e.check, e.lower));
  }

  @override
  void visitBinaryExpression(BinaryExpression e, TypeExpectation arg) {
    switch (e.operator.type) {
      case TokenType.and:
      case TokenType.or:
        session._checkAndResolve(e, const ResolvedType.bool(), arg);
        session._addRelation(NullableIfSomeOtherIs(e, [e.left, e.right]));

        // logic expressions, so children must be boolean
        visitChildren(e, const ExactTypeExpectation.laxly(ResolvedType.bool()));
        break;
      case TokenType.equal:
      case TokenType.exclamationEqual:
      case TokenType.lessMore:
      case TokenType.less:
      case TokenType.lessEqual:
      case TokenType.more:
      case TokenType.moreEqual:
        // comparison. Returns bool, copying nullability from children.
        session._checkAndResolve(e, const ResolvedType.bool(), arg);
        session._addRelation(NullableIfSomeOtherIs(e, [e.left, e.right]));
        // Not technically a requirement, but assume lhs and rhs have the same
        // type.
        session._addRelation(HaveSameType(e.left, e.right));
        visitChildren(e, const NoTypeExpectation());
        break;
      case TokenType.plus:
      case TokenType.minus:
      case TokenType.star:
      case TokenType.slash:
        session._addRelation(CopyEncapsulating(e, [e.left, e.right]));
        visitChildren(e, const RoughTypeExpectation.numeric());
        break;
      // all of those only really make sense for integers
      case TokenType.shiftLeft:
      case TokenType.shiftRight:
      case TokenType.pipe:
      case TokenType.ampersand:
      case TokenType.percent:
        const type = ResolvedType(type: BasicType.int);
        session._checkAndResolve(e, type, arg);
        session._addRelation(NullableIfSomeOtherIs(e, [e.left, e.right]));
        visitChildren(e, const ExactTypeExpectation.laxly(type));
        break;
      case TokenType.doublePipe:
        // string concatenation.
        const stringType = ResolvedType(type: BasicType.text);
        session._checkAndResolve(e, stringType, arg);
        session._addRelation(NullableIfSomeOtherIs(e, [e.left, e.right]));
        const childExpectation = ExactTypeExpectation.laxly(stringType);
        visit(e.left, childExpectation);
        visit(e.right, childExpectation);
        break;
      default:
        throw StateError('Binary operator ${e.operator.type} not recognized '
            'by types2. At $e');
    }
  }

  @override
  void visitIsExpression(IsExpression e, TypeExpectation arg) {
    session._checkAndResolve(e, const ResolvedType.bool(), arg);
    session._hintNullability(e, false);
    visitChildren(e, const NoTypeExpectation());
  }

  @override
  void visitIsNullExpression(IsNullExpression e, TypeExpectation arg) {
    session._checkAndResolve(e, const ResolvedType.bool(), arg);
    session._hintNullability(e, false);
    visitChildren(e, const NoTypeExpectation());
  }

  @override
  void visitInExpression(InExpression e, TypeExpectation arg) {
    session._checkAndResolve(e, const ResolvedType.bool(), arg);
    session._addRelation(NullableIfSomeOtherIs(e, e.childNodes));

    session._addRelation(CopyTypeFrom(e.inside, e.left, array: true));

    visitChildren(e, const NoTypeExpectation());
  }

  @override
  void visitCaseExpression(CaseExpression e, TypeExpectation arg) {
    session._addRelation(CopyEncapsulating(e, [
      for (final when in e.whens) when.then,
      if (e.elseExpr != null) e.elseExpr,
    ]));

    if (e.base != null) {
      session._addRelation(
        CopyEncapsulating(e.base, [for (final when in e.whens) when.when]),
      );
    }

    visitNullable(e.base, const NoTypeExpectation());
    visitExcept(e, e.base, arg);
  }

  @override
  void visitWhen(WhenComponent e, TypeExpectation arg) {
    final parent = e.parent;
    if (parent is CaseExpression && parent.base != null) {
      // case expressions with base -> condition is compared to base
      session._addRelation(CopyTypeFrom(e.when, parent.base));
      visit(e.when, const NoTypeExpectation());
    } else {
      // case expression without base -> the conditions are booleans
      visit(e.when, const ExactTypeExpectation(ResolvedType.bool()));
    }

    visit(e.then, arg);
  }

  @override
  void visitCastExpression(CastExpression e, TypeExpectation arg) {
    final type = session.context.schemaSupport.resolveColumnType(e.typeName);
    session._checkAndResolve(e, type, arg);
    session._addRelation(NullableIfSomeOtherIs(e, [e.operand]));
    visit(e.operand, const NoTypeExpectation());
  }

  @override
  void visitStringComparison(
      StringComparisonExpression e, TypeExpectation arg) {
    session._checkAndResolve(e, const ResolvedType(type: BasicType.text), arg);
    session._addRelation(NullableIfSomeOtherIs(
      e,
      [
        e.left,
        e.right,
        if (e.escape != null) e.escape,
      ],
    ));

    visit(e.left, _expectString);
    visit(e.right, _expectString);
    visitNullable(e.escape, _expectString);
  }

  @override
  void visitParentheses(Parentheses e, TypeExpectation arg) {
    session._addRelation(CopyTypeFrom(e, e.expression));
    visit(e.expression, arg);
  }

  @override
  void visitReference(Reference e, TypeExpectation arg) {
    final resolved = e.resolvedColumn;
    if (resolved == null) return;

    _handleColumn(resolved);
    _lazyCopy(e, resolved);
  }

  @override
  void visitExpressionInvocation(ExpressionInvocation e, TypeExpectation arg) {
    final type = _resolveInvocation(e);
    if (type != null) {
      session._checkAndResolve(e, type, arg);
    }

    final visited = _resolveFunctionArguments(e);
    for (final child in e.childNodes) {
      if (!visited.contains(child)) {
        visit(child, const NoTypeExpectation());
      }
    }
  }

  ResolvedType _resolveInvocation(ExpressionInvocation e) {
    final params = e.expandParameters();
    void nullableIfChildIs() {
      session._addRelation(NullableIfSomeOtherIs(e, params));
    }

    final lowercaseName = e.name.toLowerCase();
    switch (lowercaseName) {
      case 'round':
        nullableIfChildIs();
        //if there is only one params, it rounds to int. Otherwise real
        if (params.length == 1) {
          return _intType;
        } else {
          return _realType;
        }
        // ignore: dead_code
        throw AssertionError(); // required so that this switch compiles
      case 'sum':
        session._addRelation(CopyAndCast(e, params.first, CastMode.numeric));
        session._addRelation(DefaultType(e, _realType));
        nullableIfChildIs();
        return null;
      case 'lower':
      case 'ltrim':
      case 'printf':
      case 'replace':
      case 'rtrim':
      case 'substr':
      case 'trim':
      case 'upper':
      case 'group_concat':
        nullableIfChildIs();
        return _textType;
      case 'date':
      case 'time':
      case 'datetime':
      case 'julianday':
      case 'strftime':
      case 'char':
      case 'hex':
      case 'quote':
      case 'soundex':
      case 'sqlite_compileoption_set':
      case 'sqlite_version':
      case 'typeof':
        return _textType;
      case 'changes':
      case 'last_insert_rowid':
      case 'random':
      case 'sqlite_compileoption_used':
      case 'total_changes':
      case 'count':
      case 'row_number':
      case 'rank':
      case 'dense_rank':
      case 'ntile':
        return _intType;
      case 'instr':
      case 'length':
      case 'unicode':
        nullableIfChildIs();
        return _intType;
      case 'randomblob':
      case 'zeroblob':
        return const ResolvedType(type: BasicType.blob);
      case 'total':
      case 'avg':
      case 'percent_rank':
      case 'cume_dist':
        return _realType;
      case 'abs':
      case 'likelihood':
      case 'likely':
      case 'unlikely':
        session._addRelation(CopyTypeFrom(e, params.first));
        return null;
      case 'coalesce':
      case 'ifnull':
        session._addRelation(CopyEncapsulating(e, params));
        return null;
      case 'nullif':
        session._hintNullability(e, true);
        session._addRelation(CopyTypeFrom(e, params.first));
        return null;
      case 'first_value':
      case 'last_value':
      case 'lag':
      case 'lead':
      case 'nth_value':
        session._addRelation(CopyTypeFrom(e, params.first));
        return null;
      case 'max':
      case 'min':
        session._hintNullability(e, true);
        session._addRelation(CopyEncapsulating(e, params));
        return null;
    }

    final addedFunctions = session.options.addedFunctions;
    if (addedFunctions.containsKey(lowercaseName)) {
      return addedFunctions[lowercaseName]
          .inferReturnType(session.context, e, params)
          ?.type;
    }

    session.context.reportError(AnalysisError(
      type: AnalysisErrorType.unknownFunction,
      message: 'Function ${e.name} could not be found',
    ));
    return null;
  }

  Set<AstNode> _resolveFunctionArguments(SqlInvocation e) {
    final params = e.expandParameters();
    final visited = <AstNode>{};
    final name = e.name.toLowerCase();

    if (name == 'nth_value' && params.length >= 2 && params[1] is Expression) {
      // the second argument of nth_value is always an integer
      final secondParam = params[1] as Expression;
      visit(secondParam, _expectInt);
      visited.add(secondParam);
    }

    return visited;
  }

  @override
  void visitUpsertClause(UpsertClause e, TypeExpectation arg) {
    _handleWhereClause(e);
    visitExcept(e, e.where, arg);
  }

  @override
  void visitDoUpdate(DoUpdate e, TypeExpectation arg) {
    _handleWhereClause(e);
    visitExcept(e, e.where, arg);
  }

  void _handleColumn(Column column) {
    if (session.graph.knowsType(column)) return;

    if (column is TableColumn) {
      session._markTypeResolved(column, column.type);
    } else if (column is ExpressionColumn) {
      _lazyCopy(column, column.expression);
    } else if (column is DelegatedColumn && column.innerColumn != null) {
      _handleColumn(column.innerColumn);
      _lazyCopy(column, column.innerColumn);
    }
  }

  void _lazyCopy(Typeable to, Typeable from) {
    if (session.graph.knowsType(from)) {
      session._markTypeResolved(to, session.typeOf(from));
    } else {
      session._addRelation(CopyTypeFrom(to, from));
    }
  }

  void _handleWhereClause(HasWhereClause e) {
    if (e.where != null) {
      // assume that a where statement is a boolean expression. Sqlite
      // internally casts (https://www.sqlite.org/lang_expr.html#booleanexpr),
      // so be lax
      visit(e.where, const ExactTypeExpectation.laxly(ResolvedType.bool()));
    }
  }

  ResolvedType _inferFromContext(TypeExpectation expectation) {
    if (expectation is ExactTypeExpectation) {
      return expectation.type;
    }
    return null;
  }
}

class _ResultColumnVisitor extends RecursiveVisitor<void, void> {
  final TypeResolver resolver;

  _ResultColumnVisitor(this.resolver);

  @override
  void visitBaseSelectStatement(BaseSelectStatement stmt, void arg) {
    if (stmt.resolvedColumns != null) {
      stmt.resolvedColumns.forEach(resolver._handleColumn);
    }
  }
}
