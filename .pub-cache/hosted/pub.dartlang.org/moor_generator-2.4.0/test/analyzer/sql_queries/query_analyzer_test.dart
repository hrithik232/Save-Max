import 'package:moor_generator/moor_generator.dart';
import 'package:moor_generator/src/analyzer/runner/results.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('respects explicit type arguments', () async {
    final state = TestState.withContent({
      'foo|lib/main.moor': ''' 
bar(?1 AS TEXT, :foo AS BOOLEAN): SELECT ?, :foo;
      ''',
    });

    await state.runTask('package:foo/main.moor');
    final file = state.file('package:foo/main.moor');

    expect(file.errors.errors, isEmpty);
    final content = file.currentResult as ParsedMoorFile;

    final query = content.resolvedQueries.single;
    expect(query, const TypeMatcher<SqlSelectQuery>());

    final resultSet = (query as SqlSelectQuery).resultSet;
    expect(resultSet.matchingTable, isNull);
    expect(resultSet.columns.map((c) => c.name), ['?', ':foo']);
    expect(resultSet.columns.map((c) => c.type),
        [ColumnType.text, ColumnType.boolean]);
  });
}
