import 'package:moor_generator/src/model/sql_query.dart';
import 'package:moor_generator/writer.dart';

/// Writes a class holding the result of an sql query into Dart.
class ResultSetWriter {
  final SqlSelectQuery query;
  final Scope scope;

  ResultSetWriter(this.query, this.scope);

  void write() {
    final className = query.resultClassName;
    final columnNames =
        query.resultSet.columns.map(query.resultSet.dartNameFor).toList();
    final into = scope.leaf();

    into.write('class $className {\n');
    // write fields
    for (final column in query.resultSet.columns) {
      final name = query.resultSet.dartNameFor(column);
      final runtimeType = column.dartType;
      into.write('final $runtimeType $name\n;');
    }

    // write the constructor
    into.write('$className({');
    for (final column in columnNames) {
      into.write('this.$column,');
    }
    into.write('});\n');

    // if requested, override hashCode and equals
    if (scope.writer.options.overrideHashAndEqualsInResultSets) {
      into.write('@override int get hashCode => ');
      const HashCodeWriter().writeHashCode(columnNames, into);
      into.write(';\n');

      overrideEquals(columnNames, className, into);
    }

    into.write('}\n');
  }
}
