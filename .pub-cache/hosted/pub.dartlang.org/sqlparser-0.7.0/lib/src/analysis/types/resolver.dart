part of '../analysis.dart';

const _comparisonOperators = [
  TokenType.equal,
  TokenType.doubleEqual,
  TokenType.exclamationEqual,
  TokenType.lessMore,
  TokenType.and,
  TokenType.or,
  TokenType.less,
  TokenType.lessEqual,
  TokenType.more,
  TokenType.moreEqual,
];

class TypeResolver {
  final Map<Typeable, ResolveResult> _results = {};
  final AnalysisContext context;
  final EngineOptions options;

  TypeResolver(this.context, this.options);

  ResolveResult _cache<T extends Typeable>(
      ResolveResult Function(T param) resolver, T typeable) {
    if (_results.containsKey(typeable)) {
      return _results[typeable];
    }

    final calculated = resolver(typeable);
    if (calculated.type != null) {
      _results[typeable] = calculated;
    }
    return calculated;
  }

  /// Manually writes the [result] for the [Typeable] [t].
  void markResult(Typeable t, ResolveResult result) {
    _results.putIfAbsent(t, () => result);
  }

  bool _canResolve(Typeable t) {
    if (t is Column) return true;
    // neither a column nor an expression. Can't resolve that
    if (t is! Expression) return false;

    final expr = t as Expression;
    // if this expression contains a variable we didn't resolve yet, we can't
    // be sure that we can resolve the entire expression.
    final containsVariable = expr.selfAndDescendants.any((node) =>
        (node is Variable || node is DartExpressionPlaceholder) &&
        !_results.containsKey(node));

    return !containsVariable;
  }

  bool needsToBeInferred(Typeable t) {
    return t is Variable || t is DartExpressionPlaceholder;
  }

  ResolveResult resolveOrInfer(Typeable t) {
    if (t is Column) {
      return resolveColumn(t);
    } else if (needsToBeInferred(t)) {
      return inferType(t as Expression);
    } else if (t is Expression) {
      return resolveExpression(t);
    }

    throw StateError('Unknown typeable $t');
  }

  ResolveResult justResolve(Typeable t) {
    if (t is Column) {
      return resolveColumn(t);
    } else if (t is Expression) {
      return resolveExpression(t);
    }

    throw StateError('Unknown typeable $t');
  }

  ResolveResult resolveColumn(Column column) {
    return _cache((column) {
      if (column is TableColumn) {
        // todo probably needs to be nullable when coming from a join?
        return ResolveResult(column.type);
      } else if (column is ExpressionColumn) {
        return resolveOrInfer(column.expression);
      } else if (column is DelegatedColumn) {
        return resolveColumn(column.innerColumn);
      }

      throw StateError('Unknown column $column');
    }, column);
  }

  ResolveResult resolveExpression(Expression expr) {
    return _cache((expr) {
      if (expr is Literal) {
        return resolveLiteral(expr);
      } else if (expr is UnaryExpression) {
        return resolveExpression(expr.inner);
      } else if (expr is Parentheses) {
        return resolveExpression(expr.expression);
      } else if (expr is Variable || expr is Tuple) {
        // todo we can probably resolve tuples by looking at their content
        return const ResolveResult.needsContext();
      } else if (expr is Reference) {
        final resolved = expr.resolved;
        if (resolved != null) {
          return resolveColumn(expr.resolved as Column);
        } else {
          return const ResolveResult.unknown();
        }
      } else if (expr is ExpressionInvocation) {
        return resolveFunctionCall(expr);
      } else if (expr is IsExpression ||
          expr is IsNullExpression ||
          expr is InExpression ||
          expr is StringComparisonExpression ||
          expr is BetweenExpression ||
          expr is ExistsExpression) {
        return const ResolveResult(ResolvedType.bool());
      } else if (expr is BinaryExpression) {
        final operator = expr.operator.type;
        if (_comparisonOperators.contains(operator)) {
          return const ResolveResult(ResolvedType.bool());
        } else {
          return _encapsulate(expr.childNodes.cast(),
              [BasicType.int, BasicType.real, BasicType.text, BasicType.blob]);
        }
      } else if (expr is CaseExpression) {
        return resolveExpression(expr.whens.first.then);
      } else if (expr is CastExpression) {
        final type = context.schemaSupport.resolveColumnType(expr.typeName);
        return ResolveResult(type);
      } else if (expr is SubQuery) {
        final columns = expr.select.resultSet.resolvedColumns;
        if (columns.length != 1) {
          // select queries _must_ have exactly one column
          return const ResolveResult.unknown();
        } else {
          return justResolve(columns.single);
        }
      }

      return const ResolveResult.unknown();
    }, expr);
  }

  ResolveResult resolveLiteral(Literal l) {
    return _cache((l) {
      if (l is StringLiteral) {
        return ResolveResult(
            ResolvedType(type: l.isBinary ? BasicType.blob : BasicType.text));
      } else if (l is BooleanLiteral) {
        return const ResolveResult(ResolvedType.bool());
      } else if (l is NumericLiteral) {
        return ResolveResult(
            ResolvedType(type: l.isInt ? BasicType.int : BasicType.real));
      } else if (l is NullLiteral) {
        return const ResolveResult(
            ResolvedType(type: BasicType.nullType, nullable: true));
      } else if (l is TimeConstantLiteral) {
        return const ResolveResult(ResolvedType(type: BasicType.text));
      }

      throw StateError('Unknown literal $l');
    }, l);
  }

  ResolveResult resolveFunctionCall(ExpressionInvocation call) {
    return _cache((ExpressionInvocation call) {
      final parameters = call.expandParameters();
      final firstNullable =
          // ignore: avoid_bool_literals_in_conditional_expressions
          parameters.isEmpty ? false : justResolve(parameters.first).nullable;
      final anyNullable = parameters.map(justResolve).any((r) => r.nullable);

      final lowercaseName = call.name.toLowerCase();
      switch (lowercaseName) {
        case 'round':
          // if there is only one param, returns an int. otherwise real
          if (parameters.length == 1) {
            return ResolveResult(
                ResolvedType(type: BasicType.int, nullable: firstNullable));
          } else {
            return ResolveResult(
                ResolvedType(type: BasicType.real, nullable: anyNullable));
          }
          break;
        case 'sum':
          final firstType = justResolve(parameters.first);
          if (firstType.type?.type == BasicType.int) {
            return firstType;
          } else {
            return ResolveResult(ResolvedType(
                type: BasicType.real, nullable: firstType.nullable));
          }
          break; // can't happen, though
        case 'lower':
        case 'ltrim':
        case 'printf':
        case 'replace':
        case 'rtrim':
        case 'substr':
        case 'trim':
        case 'upper':
        case 'group_concat':
          return ResolveResult(
              ResolvedType(type: BasicType.text, nullable: firstNullable));
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
          return const ResolveResult(ResolvedType(type: BasicType.text));
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
          return const ResolveResult(ResolvedType(type: BasicType.int));
        case 'instr':
        case 'length':
        case 'unicode':
          return ResolveResult(
              ResolvedType(type: BasicType.int, nullable: anyNullable));
        case 'randomblob':
        case 'zeroblob':
          return const ResolveResult(ResolvedType(type: BasicType.blob));
        case 'total':
        case 'avg':
        case 'percent_rank':
        case 'cume_dist':
          return const ResolveResult(ResolvedType(type: BasicType.real));
        case 'abs':
        case 'likelihood':
        case 'likely':
        case 'unlikely':
          return justResolve(parameters.first);
        case 'coalesce':
        case 'ifnull':
          return _encapsulate(parameters,
              [BasicType.int, BasicType.real, BasicType.text, BasicType.blob]);
        case 'nullif':
          return justResolve(parameters.first).withNullable(true);
        case 'first_value':
        case 'last_value':
        case 'lag':
        case 'lead':
        case 'nth_value':
          return justResolve(parameters.first);
        case 'max':
          return _encapsulate(parameters, [
            BasicType.int,
            BasicType.real,
            BasicType.text,
            BasicType.blob
          ]).withNullable(true);
        case 'min':
          return _encapsulate(parameters, [
            BasicType.blob,
            BasicType.text,
            BasicType.int,
            BasicType.real
          ]).withNullable(true);
      }

      if (options.addedFunctions.containsKey(lowercaseName)) {
        return options.addedFunctions[lowercaseName]
            .inferReturnType(context, call, parameters);
      }

      throw StateError('Unknown function: ${call.name}');
    }, call);
  }

  ResolveResult _resolveFunctionArgument(
      SqlInvocation parent, Expression argument) {
    return _cache<Expression>((argument) {
      final functionName = parent.name.toLowerCase();
      final args = parent.expandParameters();

      // the second argument of nth_value is always an integer
      if (functionName == 'nth_value' &&
          args.length > 1 &&
          argument == args[1]) {
        return const ResolveResult(ResolvedType(type: BasicType.int));
      }

      if (options.addedFunctions.containsKey(functionName)) {
        return options.addedFunctions[functionName]
            .inferArgumentType(context, parent, argument);
      }

      return const ResolveResult.unknown();
    }, argument);
  }

  ResolveResult inferType(Expression e) {
    return _cache<Expression>((e) {
      var parent = e.parent;
      if (e is Variable) {
        final specifiedType = context.stmtOptions.specifiedTypeOf(e);
        if (specifiedType != null) {
          return ResolveResult(specifiedType);
        }
      }

      if (parent is FunctionParameters) {
        // analyze the function, the parameters are meaningless
        parent = parent.parent;
      }

      if (parent is Expression) {
        final result = _argumentType(parent, e);
        // while more context is needed, look at the parent
        final inferredType = result.needsContext ? inferType(parent) : result;

        // If this appears in a tuple, e.g. test IN (?). The "(?)" will be an
        // array. Of course, the individual entry is not, so reset that state.
        if (parent is Tuple) {
          return inferredType.mapResult((r) => r.toArray(false));
        }
        return inferredType;
      } else if (parent is Limit) {
        return const ResolveResult(ResolvedType(type: BasicType.int));
      } else if (parent is SetComponent) {
        return resolveColumn(parent.column.resolved as Column);
      } else if (parent is FrameSpec) {
        // appears as part of a bounded window definition:
        // RANGE BETWEEN <expr> PRECEDING AND <expr> FOLLOWING
        return const ResolveResult(ResolvedType(type: BasicType.int));
      } else if (parent is HasWhereClause && e == parent.where) {
        return const ResolveResult(ResolvedType.bool());
      }

      return const ResolveResult.unknown();
    }, e);
  }

  ResolveResult _argumentType(Expression parent, Expression argument) {
    if (parent is IsExpression ||
        parent is InExpression ||
        parent is BinaryExpression ||
        parent is BetweenExpression ||
        parent is CaseExpression) {
      final relevant = parent.childNodes.lastWhere((node) {
        return node != argument &&
            node is Typeable &&
            _canResolve(node as Typeable);
      }, orElse: () => null);

      if (relevant == null) {
        return const ResolveResult.unknown();
      }

      final resolved = justResolve(relevant as Typeable);
      // if we have "a x IN argument" expression, the argument will be an array
      if (parent is InExpression && argument == parent.inside) {
        return resolved.mapResult((r) => r.toArray(true));
      }

      return resolved;
    } else if (parent is StringComparisonExpression) {
      if (argument == parent.escape) {
        return const ResolveResult(ResolvedType(type: BasicType.text));
      } else {
        final otherNode = parent.childNodes
            .firstWhere((node) => node is Expression && node != argument);
        return resolveExpression(otherNode as Expression);
      }
    } else if (parent is Parentheses ||
        parent is Tuple ||
        parent is UnaryExpression) {
      return const ResolveResult.needsContext();
    } else if (parent is ExpressionInvocation) {
      // if we have a special case for the mix of function and argument, use
      // that. Otherwise, just assume that the argument has the same type as the
      // return type of the function
      final directlyResolved = _resolveFunctionArgument(parent, argument);
      if (!directlyResolved.unknown) {
        return directlyResolved;
      }
      return resolveFunctionCall(parent);
    }

    throw StateError('Cannot infer argument type: $parent');
  }

  /// Returns the type of an expression in [expressions] that has the highest
  /// order in [types].
  ResolveResult _encapsulate(
      Iterable<Typeable> expressions, List<BasicType> types) {
    final argTypes = expressions
        .map((expr) => justResolve(expr).type)
        .where((t) => t != null);
    final type = types.lastWhere((t) => argTypes.any((arg) => arg.type == t),
        orElse: () => null);
    if (type == null) return const ResolveResult.unknown();

    final notNull = argTypes.any((t) => !t.nullable);

    return ResolveResult(ResolvedType(type: type, nullable: !notNull));
  }
}

/// Result of resolving a type. This can either have the resolved [type] set,
/// or it can inform the called that it [needsContext] to resolve the type
/// properly. Failure to resolve the type will have the [unknown] flag set.
///
/// When you see a [ResolveResult] that is unknown or needs context in the
/// final AST returned by [SqlEngine.analyze], assume that the type cannot be
/// determined.
class ResolveResult {
  /// The resolved type.
  final ResolvedType type;

  /// Whether more context is needed to resolve the type. Used internally by the
  /// analyzer.
  final bool needsContext;

  /// Whether type resolution failed.
  final bool unknown;

  const ResolveResult(this.type)
      : needsContext = false,
        unknown = false;
  const ResolveResult.needsContext()
      : type = null,
        needsContext = true,
        unknown = false;
  const ResolveResult.unknown()
      : type = null,
        needsContext = false,
        unknown = true;

  bool get nullable => type?.nullable ?? true;

  ResolveResult mapResult(ResolvedType Function(ResolvedType) map) {
    if (type != null) {
      return ResolveResult(map(type));
    } else if (needsContext != null) {
      return const ResolveResult.needsContext();
    } else {
      return const ResolveResult.unknown();
    }
  }

  /// Copies the result with the [nullable] information, if there is one. If
  /// there isn't, the failure state will be copied into the new
  /// [ResolveResult].
  ResolveResult withNullable(bool nullable) {
    return mapResult((r) => r.withNullable(nullable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        other is ResolveResult &&
            other.type == type &&
            other.needsContext == needsContext &&
            other.unknown == unknown;
  }

  @override
  int get hashCode => type.hashCode + needsContext.hashCode + unknown.hashCode;

  @override
  String toString() {
    if (type != null) {
      return 'ResolveResult: $type';
    } else {
      return 'ResolveResult(needsContext: $needsContext, unknown: $unknown)';
    }
  }
}
