part of 'runtime_api.dart';

/// A database connection managed by moor. Contains three components:
/// - a [SqlTypeSystem], which is responsible to map between Dart types and
///   values understood by the database engine.
/// - a [QueryExecutor], which runs sql commands
/// - a [StreamQueryStore], which dispatches table changes to listening queries,
///   on which the auto-updating queries are based.
class DatabaseConnection {
  /// The type system to use with this database. The type system is responsible
  /// for mapping Dart objects into sql expressions and vice-versa.
  final SqlTypeSystem typeSystem;

  /// The executor to use when queries are executed.
  final QueryExecutor executor;

  /// Manages active streams from select statements.
  final StreamQueryStore streamQueries;

  /// Constructs a raw database connection from the three components.
  DatabaseConnection(this.typeSystem, this.executor, this.streamQueries);

  /// Constructs a [DatabaseConnection] from the [QueryExecutor] by using the
  /// default type system and a new [StreamQueryStore].
  DatabaseConnection.fromExecutor(this.executor)
      : typeSystem = SqlTypeSystem.defaultInstance,
        streamQueries = StreamQueryStore();

  /// Returns a database connection that is identical to this one, except that
  /// it uses the provided [executor].
  DatabaseConnection withExecutor(QueryExecutor executor) {
    return DatabaseConnection(typeSystem, executor, streamQueries);
  }
}

/// Manages a [DatabaseConnection] to send queries to the database.
abstract class DatabaseConnectionUser {
  /// The database connection used by this [DatabaseConnectionUser].
  @protected
  final DatabaseConnection connection;

  /// The type system to use with this database. The type system is responsible
  /// for mapping Dart objects into sql expressions and vice-versa.
  SqlTypeSystem get typeSystem => connection.typeSystem;

  /// The executor to use when queries are executed.
  QueryExecutor get executor => connection.executor;

  /// Manages active streams from select statements.
  @visibleForTesting
  @protected
  StreamQueryStore get streamQueries => connection.streamQueries;

  /// Constructs a database connection user, which is responsible to store query
  /// streams, wrap the underlying executor and perform type mapping.
  DatabaseConnectionUser(SqlTypeSystem typeSystem, QueryExecutor executor,
      {StreamQueryStore streamQueries})
      : connection = DatabaseConnection(
            typeSystem, executor, streamQueries ?? StreamQueryStore());

  /// Creates another [DatabaseConnectionUser] by referencing the implementation
  /// from the [other] user.
  DatabaseConnectionUser.delegate(DatabaseConnectionUser other,
      {SqlTypeSystem typeSystem,
      QueryExecutor executor,
      StreamQueryStore streamQueries})
      : connection = DatabaseConnection(
          typeSystem ?? other.connection.typeSystem,
          executor ?? other.connection.executor,
          streamQueries ?? other.connection.streamQueries,
        );

  /// Constructs a [DatabaseConnectionUser] that will use the provided
  /// [DatabaseConnection].
  DatabaseConnectionUser.fromConnection(this.connection);

  /// Creates and auto-updating stream from the given select statement. This
  /// method should not be used directly.
  Stream<T> createStream<T>(QueryStreamFetcher<T> stmt) =>
      streamQueries.registerStream(stmt);

  /// Creates a copy of the table with an alias so that it can be used in the
  /// same query more than once.
  ///
  /// Example which uses the same table (here: points) more than once to
  /// differentiate between the start and end point of a route:
  /// ```
  /// var source = alias(points, 'source');
  /// var destination = alias(points, 'dest');
  ///
  /// select(routes).join([
  ///   innerJoin(source, routes.startPoint.equalsExp(source.id)),
  ///   innerJoin(destination, routes.startPoint.equalsExp(destination.id)),
  /// ]);
  /// ```
  T alias<T extends Table, D extends DataClass>(
      TableInfo<T, D> table, String alias) {
    return table.createAlias(alias).asDslTable;
  }
}
