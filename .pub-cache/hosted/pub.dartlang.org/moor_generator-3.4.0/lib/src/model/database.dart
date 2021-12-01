import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:meta/meta.dart';
import 'package:moor_generator/moor_generator.dart';
import 'package:moor_generator/src/analyzer/runner/file_graph.dart';
import 'package:moor_generator/src/model/sql_query.dart';

import 'declarations/declaration.dart';
import 'table.dart';

/// Abstract class for database and dao elements.
abstract class BaseMoorAccessor implements HasDeclaration {
  @override
  final DatabaseOrDaoDeclaration declaration;

  /// The [ClassElement] that was annotated with `UseMoor` or `UseDao`.
  ClassElement get fromClass => declaration.fromClass;

  /// All tables that have been declared on this accessor directly.
  ///
  /// This contains the `tables` field from a `UseMoor` or `UseDao` annotation,
  /// but not tables that are declared in imported moor files. Use [tables] for
  /// that.
  final List<MoorTable> declaredTables;

  /// The `includes` field from the `UseMoor` or `UseDao` annotation.
  final List<String> declaredIncludes;

  /// All queries declared directly in the `UseMoor` or `UseDao` annotation.
  final List<DeclaredQuery> declaredQueries;

  /// All entities for this database accessor. This contains [declaredTables]
  /// and all tables, triggers and other entities available through includes.
  List<MoorSchemaEntity> entities = [];

  /// All tables for this database accessor. This contains the [declaredTables]
  /// and all tables that are reachable through includes.
  Iterable<MoorTable> get tables => entities.whereType();

  /// All resolved queries.
  ///
  /// This includes the resolve result for queries that were declared in the
  /// same annotation, and queries that were in declared files.
  List<SqlQuery> queries = [];

  /// Resolved imports from this file.
  List<FoundFile> imports = [];

  BaseMoorAccessor._(this.declaration, this.declaredTables,
      this.declaredIncludes, this.declaredQueries);
}

/// A database, declared via a `UseMoor` annotation on a Dart class.
class Database extends BaseMoorAccessor {
  final List<DartType> daos;

  Database({
    this.daos = const [],
    DatabaseOrDaoDeclaration declaration,
    List<MoorTable> declaredTables,
    List<String> declaredIncludes,
    List<DeclaredQuery> declaredQueries,
  }) : super._(declaration, declaredTables, declaredIncludes, declaredQueries);
}

/// A dao, declared via an `UseDao` annotation on a Dart class.
class Dao extends BaseMoorAccessor {
  /// The database class this dao belongs to.
  final DartType dbClass;

  Dao({
    @required this.dbClass,
    DatabaseOrDaoDeclaration declaration,
    List<MoorTable> declaredTables,
    List<String> declaredIncludes,
    List<DeclaredQuery> declaredQueries,
  }) : super._(declaration, declaredTables, declaredIncludes, declaredQueries);
}
