part of '../query_builder.dart';

/// Base class for generated classes. [TableDsl] is the type specified by the
/// user that extends [Table], [D] is the type of the data class
/// generated from the table.
mixin TableInfo<TableDsl extends Table, D extends DataClass> on Table
    implements DatabaseSchemaEntity {
  /// Type system sugar. Implementations are likely to inherit from both
  /// [TableInfo] and [TableDsl] and can thus just return their instance.
  TableDsl get asDslTable;

  /// The primary key of this table. Can be null or empty if no custom primary
  /// key has been specified.
  ///
  /// Additional to the [Table.primaryKey] columns declared by an user, this
  /// also contains auto-increment integers, which are primary key by default.
  Set<GeneratedColumn> get $primaryKey => null;

  // ensure the primaryKey getter is consistent with $primaryKey, which can
  // contain additional columns.
  @override
  Set<Column> get primaryKey => $primaryKey;

  /// The table name in the sql table. This can be an alias for the actual table
  /// name. See [actualTableName] for a table name that is not aliased.
  String get $tableName;

  /// The name of the table in the database. Unless [$tableName], this can not
  /// be aliased.
  String get actualTableName;

  @override
  String get entityName => actualTableName;

  /// The table name, optionally suffixed with the alias if one exists. This
  /// can be used in select statements, as it returns something like "users u"
  /// for a table called users that has been aliased as "u".
  String get tableWithAlias {
    if ($tableName == actualTableName) {
      return actualTableName;
    } else {
      return '$actualTableName ${$tableName}';
    }
  }

  /// All columns defined in this table.
  List<GeneratedColumn> get $columns;

  Map<String, GeneratedColumn> _columnsByName;

  /// Gets all [$columns] in this table, indexed by their (non-escaped) name.
  Map<String, GeneratedColumn> get columnsByName {
    return _columnsByName ??= {
      for (final column in $columns) column.$name: column
    };
  }

  /// Validates that the given entity can be inserted into this table, meaning
  /// that it respects all constraints (nullability, text length, etc.).
  VerificationContext validateIntegrity(covariant UpdateCompanion<D> instance,
      {bool isInserting = false}) {
    // default behavior when users chose to not verify the integrity (build time
    // option)
    return const VerificationContext.notEnabled();
  }

  /// Maps the given update companion to a [Map] that can be inserted into sql.
  /// The keys should represent the column name in sql, the values the
  /// corresponding values of the field. All fields of the [instance] which are
  /// present will be written, absent fields will be omitted.
  /// Note that column names aren't escaped in the [Map.keys].
  Map<String, Variable> entityToSql(covariant UpdateCompanion<D> instance);

  /// Maps the given row returned by the database into the fitting data class.
  D map(Map<String, dynamic> data, {String tablePrefix});

  /// Like [map], but from a [row] instead of the low-level map.
  D mapFromRow(QueryRow row, {String tablePrefix}) {
    return map(row.data, tablePrefix: tablePrefix);
  }

  /// Converts a [companion] to the real model class, [D].
  ///
  /// Values that are [Value.absent] in the companion will be set to `null`.
  D mapFromCompanion(UpdateCompanion<D> companion) {
    final rawValues =
        entityToSql(companion).map((key, value) => MapEntry(key, value.value));

    return map(rawValues);
  }

  TableInfo<TableDsl, D> createAlias(String alias);

  @override
  bool operator ==(dynamic other) {
    // tables are singleton instances except for aliases
    if (other is TableInfo) {
      return other.runtimeType == runtimeType && other.$tableName == $tableName;
    }
    return false;
  }

  @override
  int get hashCode => $mrjf($mrjc(runtimeType.hashCode, $tableName.hashCode));
}

/// Additional interface for tables in a moor file that have been created with
/// an `CREATE VIRTUAL TABLE STATEMENT`.
mixin VirtualTableInfo<TableDsl extends Table, D extends DataClass>
    on TableInfo<TableDsl, D> {
  /// Returns the module name and the arguments that were used in the statement
  /// that created this table. In that sense, `CREATE VIRTUAL TABLE <name>
  /// USING <moduleAndArgs>;` can be used to create this table in sql.
  String get moduleAndArgs;
}
