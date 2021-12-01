part of 'query_builder.dart';

/// Signature of a function that will be invoked when a database is created.
typedef OnCreate = Future<void> Function(Migrator m);

/// Signature of a function that will be invoked when a database is upgraded
/// or downgraded.
/// In version upgrades: from < to
/// In version downgrades: from > to
typedef OnUpgrade = Future<void> Function(Migrator m, int from, int to);

/// Signature of a function that's called before a database is marked opened by
/// moor, but after migrations took place. This is a suitable callback to to
/// populate initial data or issue `PRAGMA` statements that you want to use.
typedef OnBeforeOpen = Future<void> Function(OpeningDetails details);

Future<void> _defaultOnCreate(Migrator m) => m.createAll();
Future<void> _defaultOnUpdate(Migrator m, int from, int to) async =>
    throw Exception("You've bumped the schema version for your moor database "
        "but didn't provide a strategy for schema updates. Please do that by "
        'adapting the migrations getter in your database class.');

/// Handles database migrations by delegating work to [OnCreate] and [OnUpgrade]
/// methods.
class MigrationStrategy {
  /// Executes when the database is opened for the first time.
  final OnCreate onCreate;

  /// Executes when the database has been opened previously, but the last access
  /// happened at a different [GeneratedDatabase.schemaVersion].
  /// Schema version upgrades and downgrades will both be run here.
  final OnUpgrade onUpgrade;

  /// Executes after the database is ready to be used (ie. it has been opened
  /// and all migrations ran), but before any other queries will be sent. This
  /// makes it a suitable place to populate data after the database has been
  /// created or set sqlite `PRAGMAS` that you need.
  final OnBeforeOpen /*?*/ beforeOpen;

  /// Construct a migration strategy from the provided [onCreate] and
  /// [onUpgrade] methods.
  MigrationStrategy({
    this.onCreate = _defaultOnCreate,
    this.onUpgrade = _defaultOnUpdate,
    this.beforeOpen,
  });
}

/// Runs migrations declared by a [MigrationStrategy].
class Migrator {
  final GeneratedDatabase _db;

  /// Used internally by moor when opening the database.
  Migrator(this._db);

  /// Creates all tables specified for the database, if they don't exist
  @Deprecated('Use createAll() instead')
  Future<void> createAllTables() async {
    for (final table in _db.allTables) {
      await createTable(table);
    }
  }

  /// Creates all tables, triggers, views, indexes and everything else defined
  /// in the database, if they don't exist.
  Future<void> createAll() async {
    for (final entity in _db.allSchemaEntities) {
      if (entity is TableInfo) {
        await createTable(entity);
      } else if (entity is Trigger) {
        await createTrigger(entity);
      } else if (entity is Index) {
        await createIndex(entity);
      } else if (entity is OnCreateQuery) {
        await _issueCustomQuery(entity.sql, const []);
      } else {
        throw AssertionError('Unknown entity: $entity');
      }
    }
  }

  GenerationContext _createContext() {
    return GenerationContext.fromDb(_db);
  }

  /// Creates the given table if it doesn't exist
  Future<void> createTable(TableInfo table) async {
    final context = _createContext();

    if (table is VirtualTableInfo) {
      _writeCreateVirtual(table, context);
    } else {
      _writeCreateTable(table, context);
    }

    return _issueCustomQuery(context.sql, context.boundVariables);
  }

  void _writeCreateTable(TableInfo table, GenerationContext context) {
    context.buffer.write('CREATE TABLE IF NOT EXISTS ${table.$tableName} (');

    var hasAutoIncrement = false;
    for (var i = 0; i < table.$columns.length; i++) {
      final column = table.$columns[i];

      if (column is GeneratedIntColumn && column.hasAutoIncrement) {
        hasAutoIncrement = true;
      }

      column.writeColumnDefinition(context);

      if (i < table.$columns.length - 1) context.buffer.write(', ');
    }

    final dslTable = table.asDslTable;

    // we're in a bit of a hacky situation where we don't write the primary
    // as table constraint if it has already been written on a primary key
    // column, even though that column appears in table.$primaryKey because we
    // need to know all primary keys for the update(table).replace(row) API
    final hasPrimaryKey = table.$primaryKey?.isNotEmpty ?? false;
    final dontWritePk = dslTable.dontWriteConstraints || hasAutoIncrement;
    if (hasPrimaryKey && !dontWritePk) {
      context.buffer.write(', PRIMARY KEY (');
      final pkList = table.$primaryKey.toList(growable: false);
      for (var i = 0; i < pkList.length; i++) {
        final column = pkList[i];

        context.buffer.write(escapeIfNeeded(column.$name));

        if (i != pkList.length - 1) context.buffer.write(', ');
      }
      context.buffer.write(')');
    }

    final constraints = dslTable.customConstraints ?? [];

    for (var i = 0; i < constraints.length; i++) {
      context.buffer..write(', ')..write(constraints[i]);
    }

    context.buffer.write(')');

    // == true because of nullability
    if (dslTable.withoutRowId == true) {
      context.buffer.write(' WITHOUT ROWID');
    }

    context.buffer.write(';');
  }

  void _writeCreateVirtual(VirtualTableInfo table, GenerationContext context) {
    context.buffer
      ..write('CREATE VIRTUAL TABLE IF NOT EXISTS ')
      ..write(table.$tableName)
      ..write(' USING ')
      ..write(table.moduleAndArgs)
      ..write(';');
  }

  /// Executes the `CREATE TRIGGER` statement that created the [trigger].
  Future<void> createTrigger(Trigger trigger) {
    return _issueCustomQuery(trigger.createTriggerStmt, const []);
  }

  /// Executes a `CREATE INDEX` statement to create the [index].
  Future<void> createIndex(Index index) {
    return _issueCustomQuery(index.createIndexStmt, const []);
  }

  /// Drops a table, trigger or index.
  Future<void> drop(DatabaseSchemaEntity entity) async {
    final escapedName = escapeIfNeeded(entity.entityName);

    String kind;

    if (entity is TableInfo) {
      kind = 'TABLE';
    } else if (entity is Trigger) {
      kind = 'TRIGGER';
    } else if (entity is Index) {
      kind = 'INDEX';
    } else {
      // Entity that can't be dropped.
      return;
    }

    await _issueCustomQuery('DROP $kind IF EXISTS $escapedName;');
  }

  /// Deletes the table with the given name. Note that this function does not
  /// escape the [name] parameter.
  Future<void> deleteTable(String name) async {
    return _issueCustomQuery('DROP TABLE IF EXISTS $name;');
  }

  /// Adds the given column to the specified table.
  Future<void> addColumn(TableInfo table, GeneratedColumn column) async {
    final context = _createContext();

    context.buffer.write('ALTER TABLE ${table.$tableName} ADD COLUMN ');
    column.writeColumnDefinition(context);
    context.buffer.write(';');

    return _issueCustomQuery(context.sql);
  }

  /// Executes the custom query.
  @Deprecated('Use customStatement in the database class')
  Future<void> issueCustomQuery(String sql, [List<dynamic> args]) {
    return _issueCustomQuery(sql, args);
  }

  Future<void> _issueCustomQuery(String sql, [List<dynamic> args]) {
    return _db.customStatement(sql, args);
  }
}

/// Provides information about whether migrations ran before opening the
/// database.
class OpeningDetails {
  /// The schema version before the database has been opened, or `null` if the
  /// database has just been created.
  final int versionBefore;

  /// The schema version after running migrations.
  final int versionNow;

  /// Whether the database has been created during this session.
  bool get wasCreated => versionBefore == null;

  /// Whether a schema upgrade was performed while opening the database.
  bool get hadUpgrade => !wasCreated && versionBefore != versionNow;

  /// Used internally by moor when opening a database.
  const OpeningDetails(this.versionBefore, this.versionNow);
}

/// Extension providing the [destructiveFallback] strategy.
extension DestructiveMigrationExtension on GeneratedDatabase {
  /// Provides a destructive [MigrationStrategy] that will delete and then
  /// re-create all tables, triggers and indices.
  ///
  /// To use this behavior, override the `migration` getter in your database:
  ///
  /// ```dart
  /// @UseMoor(...)
  /// class MyDatabase extends _$MyDatabase {
  ///   @override
  ///   MigrationStrategy get migration => destructiveFallback;
  /// }
  /// ```
  MigrationStrategy get destructiveFallback {
    return MigrationStrategy(
      onCreate: _defaultOnCreate,
      onUpgrade: (m, from, to) async {
        // allSchemaEntities are sorted topologically references between them.
        // Reverse order for deletion in order to not break anything.
        final reversedEntities = m._db.allSchemaEntities.toList().reversed;

        for (final entity in reversedEntities) {
          await m.drop(entity);
        }

        // Re-create them now
        await m.createAll();
      },
    );
  }
}
