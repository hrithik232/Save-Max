/// Contains utils to run moor databases in a background isolate. This API is
/// not supported on the web.
library isolate;

import 'dart:isolate';

import 'package:async/async.dart';
import 'package:stream_channel/isolate_channel.dart';
import 'package:stream_channel/stream_channel.dart';

import 'moor.dart';
import 'remote.dart';

/// Signature of a function that opens a database connection.
typedef DatabaseOpener = DatabaseConnection Function();

/// Defines utilities to run moor in a background isolate. In the operation mode
/// created by these utilities, there's a single background isolate doing all
/// the work. Any other isolate can use the [connect] method to obtain an
/// instance of a [GeneratedDatabase] class that will delegate its work onto a
/// background isolate. Auto-updating queries, and transactions work across
/// isolates, and the user facing api is exactly the same.
///
/// Please note that, while running moor in a background isolate can reduce
/// latency in foreground isolates (thus reducing UI lags), the overall
/// performance is going to be much worse as data has to be serialized and
/// deserialized to be sent over isolates.
/// Also, be aware that this api is not available on the web.
///
/// See also:
/// - [Isolate], for general information on multi threading in Dart.
/// - The [detailed documentation](https://moor.simonbinder.eu/docs/advanced-features/isolates),
///   which provides example codes on how to use this api.
class MoorIsolate {
  /// The underlying port used to establish a connection with this
  /// [MoorIsolate].
  ///
  /// This [SendPort] can safely be sent over isolates. The receiving isolate
  /// can reconstruct a [MoorIsolate] by using [MoorIsolate.fromConnectPort].
  final SendPort connectPort;

  /// Creates a [MoorIsolate] talking to another isolate by using the
  /// [connectPort].
  MoorIsolate.fromConnectPort(this.connectPort);

  StreamChannel _open() {
    final receive = ReceivePort('moor client receive');
    connectPort.send(receive.sendPort);

    final controller =
        StreamChannelController(allowForeignErrors: false, sync: true);
    receive.listen((message) {
      if (message is SendPort) {
        controller.local.stream
            .map(_prepareForTransport)
            .listen(message.send, onDone: receive.close);
      } else {
        controller.local.sink.add(_decodeAfterTransport(message));
      }
    });

    return controller.foreign;
  }

  /// Connects to this [MoorIsolate] from another isolate. All operations on the
  /// returned [DatabaseConnection] will be executed on a background isolate.
  /// Setting the [isolateDebugLog] is only helpful when debugging moor itself.
  // todo: breaking: Make synchronous
  Future<DatabaseConnection> connect({bool isolateDebugLog = false}) async {
    return remote(_open(), debugLog: isolateDebugLog);
  }

  /// Stops the background isolate and disconnects all [DatabaseConnection]s
  /// created.
  /// If you only want to disconnect a database connection created via
  /// [connect], use [GeneratedDatabase.close] instead.
  Future<void> shutdownAll() {
    return shutdown(_open());
  }

  /// Creates a new [MoorIsolate] on a background thread.
  ///
  /// The [opener] function will be used to open the [DatabaseConnection] used
  /// by the isolate. Most implementations are likely to use
  /// [DatabaseConnection.fromExecutor] instead of providing stream queries and
  /// the type system manually.
  ///
  /// Because [opener] will be called on another isolate with its own memory,
  /// it must either be a top-level member or a static class method.
  ///
  /// To close the isolate later, use [shutdownAll].
  static Future<MoorIsolate> spawn(DatabaseOpener opener) async {
    final receiveServer = ReceivePort();
    final keyFuture = receiveServer.first;

    await Isolate.spawn(_startMoorIsolate, [receiveServer.sendPort, opener]);
    final key = await keyFuture as SendPort;
    return MoorIsolate.fromConnectPort(key);
  }

  /// Creates a [MoorIsolate] in the [Isolate.current] isolate. The returned
  /// [MoorIsolate] is an object than can be sent across isolates - any other
  /// isolate can then use [MoorIsolate.connect] to obtain a special database
  /// connection which operations are all executed on this isolate.
  ///
  /// When [killIsolateWhenDone] is enabled (it defaults to `false`) and
  /// [shutdownAll] is called on the returned [MoorIsolate], the isolate used
  /// to call [inCurrent] will be killed.
  factory MoorIsolate.inCurrent(DatabaseOpener opener,
      {bool killIsolateWhenDone = false}) {
    final server = _RunningMoorServer(Isolate.current, opener(),
        killIsolateWhenDone: killIsolateWhenDone);
    return MoorIsolate.fromConnectPort(server.portToOpenConnection);
  }
}

/// Creates a [_RunningMoorServer] and sends a [SendPort] that can be used to
/// establish connections.
///
/// Te [args] list must contain two elements. The first one is the [SendPort]
/// that [_startMoorIsolate] will use to send the new [SendPort] used to
/// establish further connections. The second element is a [DatabaseOpener]
/// used to open the underlying database connection.
void _startMoorIsolate(List args) {
  final sendPort = args[0] as SendPort;
  final opener = args[1] as DatabaseOpener;

  final server = _RunningMoorServer(Isolate.current, opener());
  sendPort.send(server.portToOpenConnection);
}

class _RunningMoorServer {
  final Isolate self;
  final bool killIsolateWhenDone;

  final MoorServer server;
  final ReceivePort connectPort = ReceivePort('moor connect');
  int _counter = 0;

  SendPort get portToOpenConnection => connectPort.sendPort;

  _RunningMoorServer(this.self, DatabaseConnection connection,
      {this.killIsolateWhenDone = true})
      : server = MoorServer(connection, allowRemoteShutdown: true) {
    final subscription = connectPort.listen((message) {
      if (message is SendPort) {
        final receiveForConnection = ReceivePort('moor channel #${_counter++}');
        message.send(receiveForConnection.sendPort);
        final channel = IsolateChannel(receiveForConnection, message)
            .changeStream((source) => source.map(_decodeAfterTransport))
            .transformSink(
              StreamSinkTransformer.fromHandlers(
                  handleData: (data, sink) =>
                      sink.add(_prepareForTransport(data))),
            );

        server.serve(channel);
      }
    });

    server.done.then((_) {
      subscription.cancel();
      connectPort.close();
      if (killIsolateWhenDone) self.kill();
    });
  }
}

Object? _prepareForTransport(Object? source) {
  if (source is! List) return source;

  if (source is Uint8List) {
    return TransferableTypedData.fromList([source]);
  }

  return source.map(_prepareForTransport).toList();
}

Object? _decodeAfterTransport(Object? source) {
  if (source is TransferableTypedData) {
    return source.materialize().asUint8List();
  } else if (source is List) {
    return source.map(_decodeAfterTransport).toList();
  } else {
    return source;
  }
}
