import 'package:moor_generator/moor_generator.dart';
import 'package:moor_generator/src/analyzer/errors.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:moor_generator/src/analyzer/runner/steps.dart';
import 'package:moor_generator/src/analyzer/sql_queries/type_mapping.dart';
import 'package:moor_generator/src/model/declarations/declaration.dart';
import 'package:moor_generator/src/model/used_type_converter.dart';
import 'package:moor_generator/src/utils/names.dart';
import 'package:moor_generator/src/utils/string_escaper.dart';
import 'package:moor_generator/src/utils/type_converter_hint.dart';
import 'package:recase/recase.dart';
import 'package:sqlparser/sqlparser.dart';

class CreateTableReader {
  /// The AST of this `CREATE TABLE` statement.
  final TableInducingStatement stmt;
  final Step step;

  CreateTableReader(this.stmt, this.step);

  Future<MoorTable> extractTable(TypeMapper mapper) async {
    Table table;
    try {
      table = SchemaFromCreateTable(moorExtensions: true).read(stmt);
    } catch (e) {
      step.reportError(ErrorInMoorFile(
        span: stmt.tableNameToken.span,
        message: 'Could not extract schema information for this table: $e',
      ));
    }

    final foundColumns = <String, MoorColumn>{};
    final primaryKey = <MoorColumn>{};

    for (final column in table.resultColumns) {
      var isPrimaryKey = false;
      final features = <ColumnFeature>[];
      final sqlName = column.name;
      final dartName = ReCase(sqlName).camelCase;
      final constraintWriter = StringBuffer();
      final moorType = mapper.resolvedToMoor(column.type);
      UsedTypeConverter converter;
      String defaultValue;
      String overriddenJsonKey;

      // columns from virtual tables don't necessarily have a definition, so we
      // can't read the constraints.
      final constraints = column.hasDefinition
          ? column.constraints
          : const Iterable<ColumnConstraint>.empty();
      for (final constraint in constraints) {
        if (constraint is PrimaryKeyColumn) {
          isPrimaryKey = true;
          features.add(const PrimaryKey());
          if (constraint.autoIncrement) {
            features.add(AutoIncrement());
          }
        }
        if (constraint is Default) {
          final dartType = dartTypeNames[moorType];
          final sqlType = sqlTypes[moorType];
          final expressionName = 'const CustomExpression<$dartType, $sqlType>';
          final sqlDefault = constraint.expression.span.text;
          defaultValue = '$expressionName(${asDartLiteral(sqlDefault)})';
        }

        if (constraint is MappedBy) {
          converter = await _readTypeConverter(moorType, constraint);
          // don't write MAPPED BY constraints when creating the table, they're
          // a convenience feature by the compiler
          continue;
        }
        if (constraint is JsonKey) {
          overriddenJsonKey = constraint.jsonKey;
          // those are moor-specific as well, don't write them
          continue;
        }

        if (constraintWriter.isNotEmpty) {
          constraintWriter.write(' ');
        }
        constraintWriter.write(constraint.span.text);
      }

      // if the column definition isn't set - which can happen for CREATE
      // VIRTUAL TABLE statements - use the entire statement as declaration.
      final declaration =
          MoorColumnDeclaration(column.definition ?? stmt, step.file);

      if (converter != null) {
        column.applyTypeHint(TypeConverterHint(converter));
      }

      final parsed = MoorColumn(
        type: moorType,
        nullable: column.type.nullable,
        dartGetterName: dartName,
        name: ColumnName.implicitly(sqlName),
        features: features,
        customConstraints: constraintWriter.toString(),
        defaultArgument: defaultValue,
        typeConverter: converter,
        overriddenJsonName: overriddenJsonKey,
        declaration: declaration,
      );

      foundColumns[column.name] = parsed;
      if (isPrimaryKey) {
        primaryKey.add(parsed);
      }
    }

    final tableName = table.name;
    final dartTableName = ReCase(tableName).pascalCase;
    final dataClassName = stmt.overriddenDataClassName ??
        dataClassNameForClassName(dartTableName);

    final constraints = table.tableConstraints.map((c) => c.span.text).toList();

    for (final keyConstraint in table.tableConstraints.whereType<KeyClause>()) {
      if (keyConstraint.isPrimaryKey) {
        primaryKey.addAll(keyConstraint.indexedColumns
            .map((r) => foundColumns[r.columnName])
            .where((c) => c != null));
      }
    }

    return MoorTable(
      fromClass: null,
      columns: foundColumns.values.toList(),
      sqlName: table.name,
      dartTypeName: dataClassName,
      overriddenName: dartTableName,
      primaryKey: primaryKey,
      overrideWithoutRowId: table.withoutRowId ? true : null,
      overrideTableConstraints: constraints.isNotEmpty ? constraints : null,
      // we take care of writing the primary key ourselves
      overrideDontWriteConstraints: true,
      declaration: MoorTableDeclaration(stmt, step.file),
    )..parserTable = table;
  }

  Future<UsedTypeConverter> _readTypeConverter(
      ColumnType sqlType, MappedBy mapper) async {
    final code = mapper.mapper.dartCode;
    final type = await step.task.backend.resolveTypeOf(step.file.uri, code);

    // todo report lint for any of those cases or when resolveTypeOf throws
    if (type is! InterfaceType) {
      return null;
    }

    final interfaceType = type as InterfaceType;
    // TypeConverter declares a "D mapToDart(S fromDb);". We need to know D
    final typeInDart = interfaceType.getMethod('mapToDart').returnType;

    return UsedTypeConverter(
        expression: code, mappedType: typeInDart, sqlType: sqlType);
  }
}
