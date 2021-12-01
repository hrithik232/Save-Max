import 'package:build/build.dart';
import 'package:moor_generator/src/analyzer/runner/steps.dart';
import 'package:moor_generator/src/analyzer/session.dart';
import 'package:test/test.dart';

import '../../utils/test_backend.dart';

void main() {
  const content = '''
import 'package:my_package/some_file.dart';
import 'relative_file.moor';
  
CREATE TABLE users(
  id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
  name VARCHAR NOT NULL CHECK(LENGTH(name) BETWEEN 5 AND 30),
  field BOOLEAN,
  another DATETIME,
  different_json INT JSON KEY myJsonKey
);

usersWithLongName: SELECT * FROM users WHERE LENGTH(name) > 25
  ''';

  test('parses standalone .moor files', () async {
    final asset = AssetId.parse('foo|bar.moor');
    final backend = TestBackend({asset: content});
    final session = MoorSession(backend);
    final task = session.startTask(backend.startTask(asset.uri));
    final file = session.registerFile(asset.uri);

    final parseStep = ParseMoorStep(task, file, content);
    final result = await parseStep.parseFile();

    expect(parseStep.errors.errors, isEmpty);

    final table = result.declaredTables.single;
    expect(table.sqlName, 'users');
    expect(table.columns.map((c) => c.name.name),
        ['id', 'name', 'field', 'another', 'different_json']);
    expect(table.columns.map((c) => c.dartGetterName),
        ['id', 'name', 'field', 'another', 'differentJson']);
    expect(table.columns.map((c) => c.dartTypeName),
        ['int', 'String', 'bool', 'DateTime', 'int']);
    expect(table.columns.map((c) => c.getJsonKey()),
        ['id', 'name', 'field', 'another', 'myJsonKey']);

    backend.finish();
  });
}
