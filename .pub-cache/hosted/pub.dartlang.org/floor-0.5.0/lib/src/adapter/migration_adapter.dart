import 'package:floor/src/migration.dart';
import 'package:sqflite/sqflite.dart';

abstract class MigrationAdapter {
  /// Runs the given [migrations] for migrating the database schema and data.
  static void runMigrations(
    final Database migrationDatabase,
    final int startVersion,
    final int endVersion,
    final List<Migration> migrations,
  ) {
    final relevantMigrations = migrations
        .where((migration) => migration.startVersion >= startVersion)
        .toList()
          ..sort((first, second) =>
              first.startVersion.compareTo(second.startVersion));

    if (relevantMigrations.isEmpty ||
        relevantMigrations.last.endVersion != endVersion) {
      throw StateError(
        'There is no migration supplied to update the database to the current version.'
            ' Aborting the migration.',
      );
    }

    for (final migration in relevantMigrations) {
      migration.migrate(migrationDatabase);
    }
  }
}
