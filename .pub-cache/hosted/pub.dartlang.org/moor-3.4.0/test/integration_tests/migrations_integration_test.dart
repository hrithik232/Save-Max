@TestOn('vm')
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart' hide isNull;
import 'package:test/test.dart';

import '../data/tables/todos.dart';

void main() {
  test('change column types', () async {
    // Create todos table with category as text (it's an int? in Dart).
    final executor = VmDatabase.memory(setup: (db) {
      db.execute('''
        CREATE TABLE todos (
          id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          content TEXT NOT NULL,
          target_date INTEGER NOT NULL,
          category TEXT NOT NULL,
          UNIQUE(title, category)
        );
      ''');

      db.execute('CREATE INDEX my_index ON todos (content);');

      db.execute('INSERT INTO todos (title, content, target_date, category) '
          "VALUES ('title', 'content', 0, '12')");

      db.execute('PRAGMA foreign_keys = ON');
    });

    final db = TodoDb(executor);
    db.migration = MigrationStrategy(
      onCreate: (m) async {
        await m.alterTable(
          TableMigration(
            db.todosTable,
            columnTransformer: {
              db.todosTable.category: db.todosTable.category.cast<int>(),
            },
          ),
        );
      },
    );

    final createStmt = await db
        .customSelect("SELECT sql FROM sqlite_master WHERE name = 'todos'")
        .map((row) => row.readString('sql'))
        .getSingle();

    expect(createStmt, contains('category INT'));

    final item = await db.select(db.todosTable).getSingle();
    expect(item.category, 12);

    // We enabled foreign keys, so they should still be enabled now.
    final foreignKeysResult =
        await db.customSelect('PRAGMA foreign_keys').getSingle();
    expect(foreignKeysResult.readBool('foreign_keys'), isTrue);
  });

  test('rename columns', () async {
    // Create todos table with category as category_old
    final executor = VmDatabase.memory(setup: (db) {
      db.execute('''
        CREATE TABLE todos (
          id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          content TEXT NOT NULL,
          target_date INTEGER NOT NULL,
          category_old INTEGER NULL
        );
      ''');

      db.execute('INSERT INTO todos (title, content, target_date) '
          "VALUES ('title', 'content', 0)");
    });

    final db = TodoDb(executor);
    db.migration = MigrationStrategy(
      onCreate: (m) async {
        await m.alterTable(
          TableMigration(
            db.todosTable,
            columnTransformer: {
              db.todosTable.category: const CustomExpression('category_old'),
            },
          ),
        );
      },
    );

    final createStmt = await db
        .customSelect("SELECT sql FROM sqlite_master WHERE name = 'todos'")
        .map((row) => row.readString('sql'))
        .getSingle();

    expect(
      createStmt,
      allOf(contains('category INT'), isNot(contains('category_old'))),
    );

    final item = await db.select(db.todosTable).getSingle();
    expect(item.category, isNull);
  });

  test('add columns with default value', () async {
    final executor = VmDatabase.memory(setup: (db) {
      // Create todos table without content column
      db.execute('''
        CREATE TABLE todos (
          id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          target_date INTEGER NOT NULL,
          category INT
        );
      ''');

      db.execute('INSERT INTO todos (title, target_date, category) VALUES '
          "('Title', 0, 0)");
    });

    final db = TodoDb(executor);
    db.migration = MigrationStrategy(
      onCreate: (m) async {
        await db.transaction(() async {
          await m.alterTable(
            TableMigration(
              db.todosTable,
              newColumns: [db.todosTable.content],
              columnTransformer: {
                db.todosTable.content: const Constant<String>('content'),
              },
            ),
          );

          await db
              .customStatement("DELETE FROM todos WHERE content != 'content';");
        });
      },
    );

    final entry = await db.select(db.todosTable).getSingle();
    expect(entry.content, 'content');
  });
}
