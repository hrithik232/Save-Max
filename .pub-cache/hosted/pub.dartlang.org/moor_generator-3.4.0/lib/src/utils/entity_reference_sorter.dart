import 'package:moor_generator/moor_generator.dart';

/// Topologically sorts a list of [MoorSchemaEntity]s by their
/// [MoorSchemaEntity.references] relationship: Tables appearing first in the
/// output have to be created first so the table creation script doesn't crash
/// because of tables not existing.
///
/// If there is a circular reference between [MoorTable]s, an error will
/// be added that contains the name of the tables in question. Self-references
/// in tables are allowed.
List<MoorSchemaEntity> sortEntitiesTopologically(
    Iterable<MoorSchemaEntity> tables) {
  final run = _SortRun();

  for (final entity in tables) {
    if (!run.didVisitAlready(entity)) {
      run.previous[entity] = null;
      _visit(entity, run);
    }
  }

  return run.result;
}

void _visit(MoorSchemaEntity entity, _SortRun run) {
  for (final reference in entity.references) {
    assert(reference != null, '$entity had a null reference');

    if (run.result.contains(reference) || reference == entity) {
      // When the target entity has already been added there's nothing to do.
      // We also ignore self-references
    } else if (run.previous.containsKey(reference)) {
      // that's a circular reference, report
      run.throwCircularException(entity, reference);
    } else {
      run.previous[reference] = entity;
      _visit(reference, run);
    }
  }

  // now that everything this table references is written, add the table itself
  run.result.add(entity);
}

class _SortRun {
  /// Keeps track of how entities were discovered.
  ///
  /// If a pair (a, b) exists in [previous], then b was the first entity to
  /// reference a. We also insert (a, null) when iterating over nodes.
  ///
  /// This means that, when an entity references another entity that is present
  /// in `previous.keys`, that's a circular reference.
  final Map<MoorSchemaEntity, MoorSchemaEntity> previous = {};

  /// Entities that have already been fully handled, in topological order.
  ///
  /// If an entity is in [result], all of it's references are in [result] as
  /// well and it's safe to reference it.
  final List<MoorSchemaEntity> result = [];

  /// Throws a [CircularReferenceException] because the [last] table depends on
  /// [first], which (transitively) depends on [last] as well. The path in the
  /// thrown exception will go from [first] to [last].
  void throwCircularException(MoorSchemaEntity last, MoorSchemaEntity first) {
    final constructedPath = <MoorSchemaEntity>[];
    for (var current = last; current != first; current = previous[current]) {
      constructedPath.insert(0, current);
    }
    constructedPath.insert(0, first);

    throw CircularReferenceException._(constructedPath);
  }

  bool didVisitAlready(MoorSchemaEntity table) {
    return previous[table] != null || result.contains(table);
  }
}

/// Thrown by [sortEntitiesTopologically] when the graph formed by
/// [MoorSchemaEntity.references] is not acyclic except for self-references.
class CircularReferenceException implements Exception {
  /// The list of entities forming a circular reference, so that the first
  /// entity in this list references the second one and so on. The last entity
  /// in this list references the first one, thus forming a cycle.
  final List<MoorSchemaEntity> affected;

  CircularReferenceException._(this.affected);
}
