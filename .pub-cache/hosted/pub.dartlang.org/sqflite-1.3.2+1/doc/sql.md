# SQL

As sqflite does not do any parsing of SQL commands, its usage is similar to 
the usage on the native iOS and Android platform so you can refer to their 
respective documentation as well as the generic sqlite documentation:
- Android: https://developer.android.com/training/data-storage/sqlite
- iOS (FMDB): https://github.com/ccgus/fmdb
- sqlite: https://www.sqlite.org/index.html

The API is relatively close to the Android one. For performance and compatibility reason, 
cursors are not supported at this time.

It is impossible here to make a full documentation of SQL. Only basic information is given
and common pitfalls.

## Basic usage

### execute

`execute` is for commands without return values.

```dart
// Create a table
await db.execute('CREATE TABLE my_table (id INTEGER PRIMARY KEY AUTO INCREMENT, name TEXT, type TEXT)');
```

### insert

`insert` is for inserting data into a table. It returns the internal id of the record (an integer).

```dart
int recordId = await db.insert('my_table', {'name': 'my_name', 'type': 'my_type'});
```

See [Conflict algorithm](conflict_algorithm.md) for conflict handling.

### query

`query` is for reading a table content. It returns a list of map.

```dart
var list = await db.query('my_table', columns: ['name', 'type']);
```

### delete

`delete` is for deleting content in a table. It returns the number of rows deleted.

```dart
var count = await db.delete('my_table', where: 'name = ?', whereArgs: ['cat']);
```

### update

`update` is for updating content in a table. It returns the number of rows updated.

```dart
var count = await db.update('my_table', {'name': 'new cat name'}, where: 'name = ?', whereArgs: ['cat']);
```

See [Conflict algorithm](conflict_algorithm.md) for conflict handling.

### transaction

`transaction` handle the 'all or nothing' scenario. If one command fails, all other commands are reverted.

```dart
await db.transaction((txn) async {
  await db.insert('my_table', {'name': 'my_name'});
  await db.delete('my_table', where: 'name = ?', whereArgs: ['cat']);
});
```

## Parameters

When providing a raw SQL statement, you should not attempt to "sanitize" any values. Instead, you
should use the standard SQLite binding syntax:

```dart
// good
int recordId = await db.rawInsert('INSERT INTO my_table(name, year) VALUES (?, ?)', ['my_name', 2019]);
// bad
int recordId = await db.rawInsert("INSERT INTO my_table(name, year) VALUES ('my_name', 2019)");
```

The `?` character is recognized by SQLite as a placeholder for a value to be inserted.

The number of `?` characters must match the number of arguments. Arguments types must be in the list of 
[supported types](supported_types.md).

Particulary, lists (expect for blob content) are not supported. A common mistake is to expect to use `IN (?)` and give a list
of values. This does not work. Instead you should list each argument one by one:

```dart
var list = await db.rawQuery('SELECT * FROM my_table WHERE name IN (?, ?, ?)', ['cat', 'dog', 'fish']);
```

### Parameter position

You can use `?NNN` to specify a parameter position:

```dart
expect(
  await db.rawQuery(
    'SELECT ?1 as item1, ?2 as item2, ?1 + ?2 as sum', [3, 4]),
    [{'item1': 3, 'item2': 4, 'sum': 7}]);
```

Be aware that Android binds argument as String. While it works in most cases (in where args), in the example above, the result
 will be `[{'item1': '3', 'item2': '4', 'sum': 7}]);`. We might consider inlining num in the future.


## NULL value

`NULL` is a special value. When testing for null in a query you should not do `'WHERE my_col = ?', [null]` but use 
instead `WHERE my_col IS NULL`.

```dart
var list = await db.query('my_table', columns: ['name'], where: 'type IS NULL');
```

# Examples

## Using `LIKE`

Look for items with `name` starting with 'Ta':

```dart
var list = await db.query('my_table', columns: ['name'], where: 'name LIKE ?', whereArgs: ['Ta%']);
```

Look for items with `name` containing with 'free':

```dart
var list = await db.query('my_table', columns: ['name'], where: 'name LIKE ?', whereArgs: ['%free%']);
```

## SQLite schema information

SQLite has a [`sqlite_master`](https://www.sqlite.org/faq.html#q7) table that store schema information:

### Check if a table exists

```dart
Future<bool> tableExists(DatabaseExecutor db, String table) async {
  var count = firstIntValue(await db.query('sqlite_master',
      columns: ['COUNT(*)'],
      where: 'type = ? AND name = ?',
      whereArgs: ['table', table]));
  return count > 0;
}
```

### List table names

```dart
Future<List<String>> getTableNames(DatabaseExecutor db) async {
  var tableNames = (await db
          .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
      .map((row) => row['name'] as String)
      .toList(growable: false)
        ..sort();
  return tableNames;
}
```