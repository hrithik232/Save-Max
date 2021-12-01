import 'package:moor_generator/moor_generator.dart';
import 'package:moor_generator/src/model/sql_query.dart';
import 'package:moor_generator/src/utils/type_converter_hint.dart';
import 'package:sqlparser/sqlparser.dart';

/// Converts tables and types between the moor_generator and the sqlparser
/// library.
class TypeMapper {
  final Map<Table, MoorTable> _engineTablesToSpecified = {};

  /// Convert a [MoorTable] from moor into something that can be understood
  /// by the sqlparser library.
  Table extractStructure(MoorTable table) {
    if (table.parserTable != null) {
      final parserTbl = table.parserTable;
      _engineTablesToSpecified[parserTbl] = table;
      return parserTbl;
    }

    final columns = <TableColumn>[];
    for (final specified in table.columns) {
      final hint = specified.typeConverter != null
          ? TypeConverterHint(specified.typeConverter)
          : null;
      final type = resolveForColumnType(specified.type, overrideHint: hint)
          .withNullable(specified.nullable);

      final column = TableColumn(specified.name.name, type);
      column.setMeta<MoorColumn>(specified);

      columns.add(column);
    }

    final engineTable = Table(name: table.sqlName, resolvedColumns: columns);
    engineTable.setMeta<MoorTable>(table);
    _engineTablesToSpecified[engineTable] = table;
    return engineTable;
  }

  ResolvedType resolveForColumnType(ColumnType type, {TypeHint overrideHint}) {
    switch (type) {
      case ColumnType.integer:
        return ResolvedType(type: BasicType.int, hint: overrideHint);
      case ColumnType.text:
        return ResolvedType(type: BasicType.text, hint: overrideHint);
      case ColumnType.boolean:
        return ResolvedType(
            type: BasicType.int, hint: overrideHint ?? const IsBoolean());
      case ColumnType.datetime:
        return ResolvedType(
            type: BasicType.int, hint: overrideHint ?? const IsDateTime());
      case ColumnType.blob:
        return ResolvedType(type: BasicType.blob, hint: overrideHint);
      case ColumnType.real:
        return ResolvedType(type: BasicType.real, hint: overrideHint);
    }
    throw StateError('cant happen');
  }

  ColumnType resolvedToMoor(ResolvedType type) {
    if (type == null) {
      return ColumnType.text;
    }

    switch (type.type) {
      case BasicType.nullType:
        return ColumnType.text;
      case BasicType.int:
        if (type.hint is IsBoolean) {
          return ColumnType.boolean;
        } else if (type.hint is IsDateTime) {
          return ColumnType.datetime;
        }
        return ColumnType.integer;
      case BasicType.real:
        return ColumnType.real;
      case BasicType.text:
        return ColumnType.text;
      case BasicType.blob:
        return ColumnType.blob;
    }
    throw StateError('Unexpected type: $type');
  }

  /// Extracts variables and Dart templates from the [ctx]. Variables are
  /// sorted by their ascending index. Placeholders are sorted by the position
  /// they have in the query. When comparing variables and placeholders, the
  /// variable comes first if the first variable with the same index appears
  /// before the placeholder.
  ///
  /// Additionally, the following assumptions can be made if this method returns
  /// without throwing:
  ///  - array variables don't have an explicit index
  ///  - if an explicitly indexed variable appears AFTER an array variable or
  ///    a Dart placeholder, its indexed is LOWER than that element. This means
  ///    that elements can be expanded into multiple variables without breaking
  ///    variables that appear after them.
  List<FoundElement> extractElements(AnalysisContext ctx) {
    // this contains variable references. For instance, SELECT :a = :a would
    // contain two entries, both referring to the same variable. To do that,
    // we use the fact that each variable has a unique index.
    final variables = ctx.root.allDescendants.whereType<Variable>().toList();
    final placeholders =
        ctx.root.allDescendants.whereType<DartPlaceholder>().toList();

    final merged = _mergeVarsAndPlaceholders(variables, placeholders);

    final foundElements = <FoundElement>[];
    // we don't allow variables with an explicit index after an array. For
    // instance: SELECT * FROM t WHERE id IN ? OR id = ?2. The reason this is
    // not allowed is that we expand the first arg into multiple vars at runtime
    // which would break the index. The initial high values can be arbitrary.
    // We've chosen 999 because most sqlite binaries don't allow more variables.
    var maxIndex = 999;
    var currentIndex = 0;

    for (final used in merged) {
      if (used is Variable) {
        if (used.resolvedIndex == currentIndex) {
          continue; // already handled, we only report a single variable / index
        }

        currentIndex = used.resolvedIndex;
        final name = (used is ColonNamedVariable) ? used.name : null;
        final explicitIndex =
            (used is NumberedVariable) ? used.explicitIndex : null;
        final internalType = ctx.typeOf(used);
        final type = resolvedToMoor(internalType.type);
        final isArray = internalType.type?.isArray ?? false;

        if (explicitIndex != null && currentIndex >= maxIndex) {
          throw ArgumentError(
              'Cannot have a variable with an index lower than that of an '
              'array appearing after an array!');
        }

        foundElements
            .add(FoundVariable(currentIndex, name, type, used, isArray));

        // arrays cannot be indexed explicitly because they're expanded into
        // multiple variables when executed
        if (isArray && explicitIndex != null) {
          throw ArgumentError(
              'Cannot use an array variable with an explicit index');
        }
        if (isArray) {
          maxIndex = used.resolvedIndex;
        }
      } else if (used is DartPlaceholder) {
        // we don't what index this placeholder has, so we can't allow _any_
        // explicitly indexed variables coming after this
        maxIndex = 0;
        foundElements.add(_extractPlaceholder(ctx, used));
      }
    }
    return foundElements;
  }

  /// Merges [vars] and [placeholders] into a list that satisfies the order
  /// described in [extractElements].
  List<dynamic /* Variable|DartPlaceholder */ > _mergeVarsAndPlaceholders(
      List<Variable> vars, List<DartPlaceholder> placeholders) {
    final groupVarsByIndex = <int, List<Variable>>{};
    for (final variable in vars) {
      groupVarsByIndex
          .putIfAbsent(variable.resolvedIndex, () => [])
          .add(variable);
    }
    // sort each group by index
    for (final group in groupVarsByIndex.values) {
      group.sort((a, b) => a.resolvedIndex.compareTo(b.resolvedIndex));
    }

    int Function(dynamic, dynamic) comparer;
    comparer = (dynamic a, dynamic b) {
      if (a is Variable && b is Variable) {
        // variables are sorted by their index
        return a.resolvedIndex.compareTo(b.resolvedIndex);
      } else if (a is DartPlaceholder && b is DartPlaceholder) {
        // placeholders by their position
        return AnalysisContext.compareNodesByOrder(a, b);
      } else {
        // ok, one of them is a variable, the other one is a placeholder. Let's
        // assume a is the variable. If not, we just switch results.
        if (a is Variable) {
          final placeholderB = b as DartPlaceholder;
          final firstWithSameIndex = groupVarsByIndex[a.resolvedIndex].first;

          return firstWithSameIndex.firstPosition
              .compareTo(placeholderB.firstPosition);
        } else {
          return -comparer(b, a);
        }
      }
    };

    final list = vars.cast<dynamic>().followedBy(placeholders).toList();
    return list..sort(comparer);
  }

  FoundDartPlaceholder _extractPlaceholder(
      AnalysisContext context, DartPlaceholder placeholder) {
    ColumnType columnType;
    final name = placeholder.name;

    final type = placeholder.when(
      isExpression: (e) {
        final foundType = context.typeOf(e);
        if (foundType.type != null) {
          columnType = resolvedToMoor(foundType.type);
        }
        return DartPlaceholderType.expression;
      },
      isLimit: (_) => DartPlaceholderType.limit,
      isOrderBy: (_) => DartPlaceholderType.orderBy,
      isOrderingTerm: (_) => DartPlaceholderType.orderByTerm,
    );

    return FoundDartPlaceholder(type, columnType, name)..astNode = placeholder;
  }

  MoorTable tableToMoor(Table table) {
    return _engineTablesToSpecified[table];
  }
}
