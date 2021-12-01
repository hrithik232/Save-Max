import 'dart:async';
import 'dart:isolate';

import 'package:pedantic/pedantic.dart';

/// An isolate communication setup where there's a single "server" isolate that
/// communicates with a varying amount of "client" isolates.
///
/// Each communication is bi-directional, meaning that both the server and the
/// client can send requests to each other and expect responses for that.
class IsolateCommunication {
  /// The [SendPort] used to send messages to the peer.
  final SendPort sendPort;

  /// The input stream of this channel. This could be a [ReceivePort].
  final Stream<dynamic> input;
  StreamSubscription _inputSubscription;

  // note that there are two IsolateCommunication instances in each connection,
  // and each of them has an independent _currentRequestId field!
  int _currentRequestId = 0;
  final Completer<void> _closeCompleter = Completer();
  final Map<int, Completer> _pendingRequests = {};
  final StreamController<Request> _incomingRequests = StreamController();

  final bool _debugLog;

  IsolateCommunication._(this.sendPort, this.input, [this._debugLog = false]) {
    _inputSubscription = input.listen(_handleMessage);
  }

  /// Returns a future that resolves when this communication channel was closed,
  /// either via a call to [close] from this isolate or from the other isolate.
  Future<void> get closed => _closeCompleter.future;

  /// Whether this channel is closed at the moment.
  bool get isClosed => _closeCompleter.isCompleted;

  /// A stream of requests coming from the other peer.
  Stream<Request> get incomingRequests => _incomingRequests.stream;

  /// Establishes an [IsolateCommunication] by connecting to the [Server] which
  /// emitted the [key].
  static Future<IsolateCommunication> connectAsClient(ServerKey key,
      [bool debugLog = false]) async {
    final clientReceive = ReceivePort();
    final stream = clientReceive.asBroadcastStream();

    key.openConnectionPort
        .send(_ClientConnectionRequest(clientReceive.sendPort));

    final response = await stream.first as _ServerConnectionResponse;

    final communication =
        IsolateCommunication._(response.sendPort, stream, debugLog);

    unawaited(communication.closed.then((_) => clientReceive.close()));

    return communication;
  }

  /// Closes the connection to the server.
  void close() {
    if (isClosed) return;

    _send(_ConnectionClose());
    _closeLocally();
  }

  void _closeLocally() {
    _inputSubscription?.cancel();
    _closeCompleter.complete();

    for (final pending in _pendingRequests.values) {
      pending.completeError(const ConnectionClosedException());
    }
    _pendingRequests.clear();
  }

  void _handleMessage(dynamic msg) {
    if (_debugLog) {
      print('[IN]: $msg');
    }

    if (msg is _ConnectionClose) {
      _closeLocally();
    } else if (msg is _Response) {
      final completer = _pendingRequests[msg.requestId];

      if (completer != null) {
        if (msg is _ErrorResponse) {
          final trace = msg.stackTrace != null
              ? StackTrace.fromString(msg.stackTrace)
              : null;

          completer.completeError(msg.error, trace);
        } else {
          completer.complete(msg.response);
        }

        _pendingRequests.remove(msg.requestId);
      }
    } else if (msg is Request) {
      _incomingRequests.add(msg);
    }
  }

  /// Sends a request and waits for the peer to reply with a value that is
  /// assumed to be of type [T].
  Future<T> request<T>(dynamic request) {
    final id = _currentRequestId++;
    final completer = Completer<T>();

    _pendingRequests[id] = completer;
    _send(Request._(id, request));
    return completer.future;
  }

  void _send(dynamic msg) {
    if (isClosed) {
      throw StateError('Tried to send $msg over isolate channel, but the '
          'connection was closed!');
    }

    if (_debugLog) {
      print('[OUT]: $msg');
    }
    sendPort.send(msg);
  }

  /// Sends a response for a handled [Request].
  void respond(Request request, dynamic response) {
    _send(_Response(request.id, response));
  }

  /// Sends an erroneous response for a [Request].
  void respondError(Request request, dynamic error, [StackTrace trace]) {
    // sending a message while closed with throw, so don't even try.
    if (isClosed) return;

    _send(_ErrorResponse(request.id, error, trace.toString()));
  }

  /// Utility that listens to [incomingRequests] and invokes the [handler] on
  /// each request, sending the result back to the originating client. If
  /// [handler] throws, the error will be re-directed to the client. If
  /// [handler] returns a [Future], it will be awaited.
  void setRequestHandler(dynamic Function(Request) handler) {
    incomingRequests.listen((request) {
      try {
        final result = handler(request);

        if (result is Future) {
          result.then((value) => respond(request, value));
        } else {
          respond(request, result);
        }
      } catch (e, s) {
        respondError(request, e, s);
      }
    });
  }
}

/// A key generated by the server than can be sent across isolates. A client can
/// connect to a server by its key.
class ServerKey {
  /// The [SendPort] used by clients to establish an [IsolateCommunication] with
  /// this server.
  final SendPort openConnectionPort;

  ServerKey._(this.openConnectionPort);
}

/// Contains logic to implement the server isolate as described in
/// [IsolateCommunication]. Note that an instance of this class should not be
/// sent across isolates, use the []
class Server {
  final ReceivePort _openConnectionPort = ReceivePort();
  final StreamController<IsolateCommunication> _opened = StreamController();

  ServerKey _key;

  /// Returns all communication channels currently opened to this server.
  final List<IsolateCommunication> currentChannels = [];

  /// An identifier of this [Server] allowing a client to
  /// [IsolateCommunication.connectAsClient].
  ServerKey get key => _key;

  /// A stream of established [IsolateCommunication] channels after they were
  /// opened by the client. This is not a broadcast stream.
  Stream<IsolateCommunication> get openedConnections => _opened.stream;

  /// Opens a server in the current isolate.
  Server() {
    _key = ServerKey._(_openConnectionPort.sendPort);

    _openConnectionPort.listen(_handleMessageOnConnectionPort);
  }

  /// Closes this server instance and disposes associated resources.
  void close() {
    _openConnectionPort.close();
    _opened.close();

    for (final connected in currentChannels) {
      connected.close();
    }
  }

  void _handleMessageOnConnectionPort(dynamic message) {
    if (message is _ClientConnectionRequest) {
      final receiveFromClient = ReceivePort();
      final communication =
          IsolateCommunication._(message.sendPort, receiveFromClient);

      currentChannels.add(communication);
      _opened.add(communication);

      final response = _ServerConnectionResponse(receiveFromClient.sendPort);
      message.sendPort.send(response);

      communication.closed.whenComplete(() {
        currentChannels.remove(communication);
        receiveFromClient.close();
      });
    }
  }
}

/// Sent from a client to a [ServerKey.openConnectionPort] in order to
/// establish a connection.
class _ClientConnectionRequest {
  /// The [SendPort] to use by a [Server] to send messages to the client
  /// sending the connection request.
  final SendPort sendPort;

  _ClientConnectionRequest(this.sendPort);
}

/// Reply from a [Server] to a [_ClientConnectionRequest] to indicate that the
/// connection has been established.
class _ServerConnectionResponse {
  /// The [SendPort] used by the client to send further messages to the
  /// [Server].
  final SendPort sendPort;

  _ServerConnectionResponse(this.sendPort);
}

/// Sent from any peer to close the connection.
class _ConnectionClose {}

/// A request sent over an isolate connection. It is expected that the other
/// peer eventually answers with a matching response.
class Request {
  /// The id of this request, generated by the sender.
  final int id;

  /// The payload associated with this request
  final dynamic payload;

  Request._(this.id, this.payload);

  @override
  String toString() {
    return 'request (id = $id): $payload';
  }
}

class _Response {
  final int requestId;
  final dynamic response;

  _Response(this.requestId, this.response);

  @override
  String toString() {
    return 'response (id = $requestId): $response';
  }
}

class _ErrorResponse extends _Response {
  final String stackTrace;

  dynamic get error => response;

  _ErrorResponse(int requestId, dynamic error, [this.stackTrace])
      : super(requestId, error);

  @override
  String toString() {
    return 'error response (id = $requestId): $error at $stackTrace';
  }
}

/// Exception thrown when there are outstanding pending requests at the time the
/// isolate connection was cancelled.
class ConnectionClosedException implements Exception {
  /// Constant constructor.
  const ConnectionClosedException();
}
