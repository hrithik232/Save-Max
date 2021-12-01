import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:moor/moor.dart';
import 'package:moor/src/utils/start_with_value_transformer.dart';
import 'package:pedantic/pedantic.dart';

import '../cancellation_zone.dart';

const _listEquality = ListEquality<Object?>();

// This is an internal moor library that's never exported to users.
// ignore_for_file: public_member_api_docs

/// Representation of a select statement that knows from which tables the
/// statement is reading its data and how to execute the query.
@internal
class QueryStreamFetcher {
  /// Table updates that will affect this stream.
  ///
  /// If any of these tables changes, the stream must fetch its data again.
  final TableUpdateQuery readsFrom;

  /// Key that can be used to check whether two fetchers will yield the same
  /// result when operating on the same data.
  final StreamKey? key;

  /// Function that asynchronously fetches the latest set of data.
  final Future<List<Map<String, Object?>>> Function() fetchData;

  QueryStreamFetcher(
      {required this.readsFrom, this.key, required this.fetchData});
}

/// Key that uniquely identifies a select statement. If two keys created from
/// two select statements are equal, the statements are equal as well.
///
/// As two equal statements always yield the same result when operating on the
/// same data, this can make streams more efficient as we can return the same
/// stream for two equivalent queries.
@internal
class StreamKey {
  final String sql;
  final List<dynamic> variables;

  StreamKey(this.sql, this.variables);

  @override
  int get hashCode {
    return $mrjf($mrjc(sql.hashCode, _listEquality.hash(variables)));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is StreamKey &&
            other.sql == sql &&
            _listEquality.equals(other.variables, variables));
  }
}

/// Keeps track of active streams created from [SimpleSelectStatement]s and
/// updates them when needed.
@internal
class StreamQueryStore {
  final Map<StreamKey, QueryStream> _activeKeyStreams = {};
  final HashSet<StreamKey?> _keysPendingRemoval = HashSet<StreamKey?>();

  bool _isShuttingDown = false;

  // we track pending timers since Flutter throws an exception when timers
  // remain after a test run.
  final Set<Completer> _pendingTimers = {};

  // Why is this stream synchronous? We want to dispatch table updates before
  // the future from the query completes. This allows streams to invalidate
  // their cached data before the user can send another query.
  // There shouldn't be a problem as this stream is not exposed in any user-
  // facing api.
  final StreamController<Set<TableUpdate>> _tableUpdates =
      StreamController.broadcast(sync: true);

  StreamQueryStore();

  /// Creates a new stream from the select statement.
  Stream<List<Map<String, Object?>>> registerStream(
      QueryStreamFetcher fetcher) {
    final key = fetcher.key;

    if (key != null) {
      final cached = _activeKeyStreams[key];
      if (cached != null) {
        return cached.stream;
      }
    }

    // no cached instance found, create a new stream and register it so later
    // requests with the same key can be cached.
    final stream = QueryStream(fetcher, this);
    // todo this adds the stream to a map, where it will only be removed when
    // somebody listens to it and later calls .cancel(). Failing to do so will
    // cause a memory leak. Is there any way we can work around it? Perhaps a
    // weak reference with an Expando could help.
    markAsOpened(stream);

    return stream.stream;
  }

  Stream<Set<TableUpdate>> updatesForSync(TableUpdateQuery query) {
    return _tableUpdates.stream
        .map((e) => e.where(query.matches).toSet())
        .where((e) => e.isNotEmpty);
  }

  /// Handles updates on a given table by re-executing all queries that read
  /// from that table.
  void handleTableUpdates(Set<TableUpdate> updates) {
    if (_isShuttingDown) return;
    _tableUpdates.add(updates);
  }

  void markAsClosed(QueryStream stream, Function() whenRemoved) {
    if (_isShuttingDown) return;

    final key = stream._fetcher.key;
    _keysPendingRemoval.add(key);

    // sync because it's only triggered after the timer
    final completer = Completer<void>.sync();
    _pendingTimers.add(completer);

    // Hey there! If you're sent here because your Flutter tests fail, please
    // call and await Database.close() in your Flutter widget tests!
    // Moor uses timers internally so that after you stopped listening to a
    // stream, it can keep its cache just a bit longer. When you listen to
    // streams a lot, this helps reduce duplicate statements, especially with
    // Flutter's StreamBuilder.
    Timer.run(() {
      completer.complete();
      _pendingTimers.remove(completer);

      // if no other subscriber was found during this event iteration, remove
      // the stream from the cache.
      if (_keysPendingRemoval.contains(key)) {
        _keysPendingRemoval.remove(key);
        _activeKeyStreams.remove(key);
        whenRemoved();
      }
    });
  }

  void markAsOpened(QueryStream stream) {
    final key = stream._fetcher.key;

    if (key != null) {
      _keysPendingRemoval.remove(key);
      _activeKeyStreams[key] = stream;
    }
  }

  Future<void> close() async {
    _isShuttingDown = true;

    for (final stream in _activeKeyStreams.values) {
      // Note: StreamController.close waits until the done event has been
      // received by a subscriber. If there is a paused StreamSubscription on
      // a query stream, this would pause forever. In particular, this is
      // causing deadlocks in tests.
      // https://github.com/dart-lang/test/issues/1183#issuecomment-588357154
      unawaited(stream._controller.close());
    }
    // awaiting this is fine - the stream is never exposed to users and we don't
    // pause any subscriptions on it.
    await _tableUpdates.close();

    while (_pendingTimers.isNotEmpty) {
      await _pendingTimers.first.future;
    }

    _activeKeyStreams.clear();
  }
}

class QueryStream {
  final QueryStreamFetcher _fetcher;
  final StreamQueryStore _store;

  late final StreamController<List<Map<String, Object?>>> _controller =
      StreamController.broadcast(
    onListen: _onListen,
    onCancel: _onCancel,
  );
  StreamSubscription? _tablesChangedSubscription;

  List<Map<String, Object?>>? _lastData;
  final List<CancellationToken> _runningOperations = [];

  Stream<List<Map<String, Object?>>> get stream {
    return _controller.stream.transform(StartWithValueTransformer(_cachedData));
  }

  bool get hasKey => _fetcher.key != null;

  QueryStream(this._fetcher, this._store);

  /// Called when we have a new listener, makes the stream query behave similar
  /// to an `BehaviorSubject` from rxdart.
  List<Map<String, Object?>>? _cachedData() => _lastData;

  void _onListen() {
    _store.markAsOpened(this);

    // fetch new data whenever any table referenced in this stream updates.
    // It could be that we have an outstanding subscription when the
    // stream was closed but another listener attached quickly enough. In that
    // case we don't have to re-send the query
    if (_tablesChangedSubscription == null) {
      // first listener added, fetch query
      fetchAndEmitData();

      _tablesChangedSubscription =
          _store.updatesForSync(_fetcher.readsFrom).listen((_) {
        // table has changed, invalidate cache
        _lastData = null;
        fetchAndEmitData();
      });
    }
  }

  void _onCancel() {
    _store.markAsClosed(this, () {
      // last listener gone, dispose
      _tablesChangedSubscription?.cancel();

      // we don't listen for table updates anymore, and we're guaranteed to
      // re-fetch data after a new listener comes in. We can't know if the table
      // was updated in the meantime, but let's delete the cached data just in
      // case
      _lastData = null;
      _tablesChangedSubscription = null;

      for (final op in _runningOperations) {
        op.cancel();
      }
    });
  }

  Future<void> fetchAndEmitData() async {
    final operation = runCancellable(_fetcher.fetchData);
    _runningOperations.add(operation);

    try {
      final data = await operation.resultOrNullIfCancelled;
      if (data == null) return;

      _lastData = data;
      if (!_controller.isClosed) {
        _controller.add(data);
      }
    } catch (e, s) {
      if (!_controller.isClosed) {
        _controller.addError(e, s);
      }
    } finally {
      _runningOperations.remove(operation);
    }
  }

  void close() {
    _controller.close();
  }
}

// Note: These classes are here because we want them to be public, but not
// exposed without an src import.

class AnyUpdateQuery extends TableUpdateQuery {
  const AnyUpdateQuery();

  @override
  bool matches(TableUpdate update) => true;
}

class MultipleUpdateQuery extends TableUpdateQuery {
  final List<TableUpdateQuery> queries;

  const MultipleUpdateQuery(this.queries);

  @override
  bool matches(TableUpdate update) => queries.any((q) => q.matches(update));
}

class SpecificUpdateQuery extends TableUpdateQuery {
  final UpdateKind? limitUpdateKind;
  final String table;

  const SpecificUpdateQuery(this.table, {this.limitUpdateKind});

  @override
  bool matches(TableUpdate update) {
    if (update.table != table) return false;

    return update.kind == null ||
        limitUpdateKind == null ||
        update.kind == limitUpdateKind;
  }

  @override
  int get hashCode => $mrjf($mrjc(limitUpdateKind.hashCode, table.hashCode));

  @override
  bool operator ==(Object other) {
    return other is SpecificUpdateQuery &&
        other.limitUpdateKind == limitUpdateKind &&
        other.table == table;
  }
}
