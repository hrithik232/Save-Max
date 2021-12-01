import 'dart:async';

import 'package:js/js.dart';

import 'app.dart';
import 'interop/storage_interop.dart' as storage_interop;
import 'js.dart';
import 'utils.dart';

export 'interop/storage_interop.dart' show StringFormat;

/// Represents the current state of a running upload.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage#.TaskState>.
// ignore: constant_identifier_names
enum TaskState { RUNNING, PAUSED, SUCCESS, CANCELED, ERROR }

/// A service for uploading and downloading large objects to and from the
/// Google Cloud Storage.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.Storage>
class Storage extends JsObjectWrapper<storage_interop.StorageJsImpl> {
  static final _expando = Expando<Storage>();

  /// App for this instance of storage service.
  App get app => App.getInstance(jsObject.app);

  /// Returns the maximum time to retry operations other than uploads
  /// or downloads (in milliseconds).
  int get maxOperationRetryTime => jsObject.maxOperationRetryTime;

  /// Returns the maximum time to retry uploads (in milliseconds).
  int get maxUploadRetryTime => jsObject.maxUploadRetryTime;

  /// Creates a new Storage from a [jsObject].
  static Storage getInstance(storage_interop.StorageJsImpl jsObject) {
    if (jsObject == null) {
      return null;
    }
    return _expando[jsObject] ??= Storage._fromJsObject(jsObject);
  }

  Storage._fromJsObject(storage_interop.StorageJsImpl jsObject)
      : super.fromJsObject(jsObject);

  /// Returns a [StorageReference] for the given [path] in the default bucket.
  StorageReference ref([String path]) =>
      StorageReference.getInstance(jsObject.ref(path));

  /// Returns a [StorageReference] for the given absolute [url].
  StorageReference refFromURL(String url) =>
      StorageReference.getInstance(jsObject.refFromURL(url));

  /// Sets the maximum operation retry time to a value of [time].
  void setMaxOperationRetryTime(int time) =>
      jsObject.setMaxOperationRetryTime(time);

  /// Sets the maximum upload retry time to a value of [time].
  void setMaxUploadRetryTime(int time) => jsObject.setMaxUploadRetryTime(time);
}

/// StorageReference is a reference to a Google Cloud Storage object.
/// It is possible to upload, download, and delete objects, as well as
/// get or set the object metadata.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.Reference>
class StorageReference
    extends JsObjectWrapper<storage_interop.ReferenceJsImpl> {
  static final _expando = Expando<StorageReference>();

  /// The name of the bucket.
  String get bucket => jsObject.bucket;

  /// The full path.
  String get fullPath => jsObject.fullPath;

  /// The short name. Which is the last component of the full path.
  String get name => jsObject.name;

  /// The reference to the parent location of this reference.
  /// It is `null` in case of root StorageReference.
  StorageReference get parent => StorageReference.getInstance(jsObject.parent);

  /// The reference to the root of this storage reference's bucket.
  StorageReference get root => StorageReference.getInstance(jsObject.root);

  /// The [Storage] service associated with this reference.
  Storage get storage => Storage.getInstance(jsObject.storage);

  /// Creates a new StorageReference from a [jsObject].
  static StorageReference getInstance(
      storage_interop.ReferenceJsImpl jsObject) {
    if (jsObject == null) {
      return null;
    }
    return _expando[jsObject] ??= StorageReference._fromJsObject(jsObject);
  }

  StorageReference._fromJsObject(storage_interop.ReferenceJsImpl jsObject)
      : super.fromJsObject(jsObject);

  /// Returns a child StorageReference to a relative [path]
  /// from the actual reference.
  StorageReference child(String path) =>
      StorageReference.getInstance(jsObject.child(path));

  /// Deletes the object at the actual location.
  Future delete() => handleThenable(jsObject.delete());

  /// Returns a long lived download URL for this reference.
  Future<Uri> getDownloadURL() async {
    var uriString = await handleThenable(jsObject.getDownloadURL());
    return Uri.parse(uriString);
  }

  /// Returns a [FullMetadata] from this reference at actual location.
  Future<FullMetadata> getMetadata() =>
      handleThenable(jsObject.getMetadata()).then(FullMetadata.getInstance);

  /// List items (files) and prefixes (folders) under this storage reference.
  /// List API is only available for Firebase Storage Rules Version 2.
  ///
  /// GCS is a key-blob store. Firebase Storage imposes the semantic of '/' delimited
  /// folder structure. Refer to GCS's List API if you want to learn more.
  ///
  /// To adhere to Firebase Rules's Semantics, Firebase Storage does not
  /// support objects whose paths end with "/' or contain two consecutive '/"s.
  /// Firebase Storage List API will filter these unsupported objects.
  /// [list()] may fail if there are too many unsupported objects in the bucket.
  Future<ListResult> list(ListOptions options) =>
      handleThenable(jsObject.list(options?.jsObject))
          .then(ListResult.getInstance);

  /// List all items (files) and prefixes (folders) under this storage reference.
  /// List API is only available for Firebase Rules Version 2.
  ///
  /// This is a helper method for calling [list()] repeatedly until there are no
  /// more results. The default pagination size is 1000.
  ///
  /// Note: The results may not be consistent if objects are changed while this
  /// operation is running.
  ///
  /// Warning: [listAll] may potentially consume too many resources if there are
  /// too many results.
  Future<ListResult> listAll() =>
      handleThenable(jsObject.listAll()).then(ListResult.getInstance);

  /// Uploads data [blob] to the actual location with optional [metadata].
  /// Returns the [UploadTask] which can be used to monitor and manage
  /// the upload.
  UploadTask put(blob, [UploadMetadata metadata]) {
    storage_interop.UploadTaskJsImpl taskImpl;
    if (metadata != null) {
      taskImpl = jsObject.put(blob, metadata.jsObject);
    } else {
      taskImpl = jsObject.put(blob);
    }
    return UploadTask.getInstance(taskImpl);
  }

  /// Uploads String [data] to the actual location with optional String [format]
  /// and [metadata].
  ///
  /// See allowed [format] values in [storage_interop.StringFormat] class.
  ///
  /// Returns the [UploadTask] which can be used to monitor and manage
  /// the upload.
  UploadTask putString(String data, [String format, UploadMetadata metadata]) {
    storage_interop.UploadTaskJsImpl taskImpl;
    if (metadata != null) {
      taskImpl = jsObject.putString(data, format, metadata.jsObject);
    } else if (format != null) {
      taskImpl = jsObject.putString(data, format);
    } else {
      taskImpl = jsObject.putString(data);
    }
    return UploadTask.getInstance(taskImpl);
  }

  /// Returns the String representation of the current storage reference.
  @override
  String toString() => jsObject.toString();

  /// Updates metadata from this reference at actual location with
  /// the new [metadata].
  Future<FullMetadata> updateMetadata(SettableMetadata metadata) =>
      handleThenable(jsObject.updateMetadata(metadata.jsObject))
          .then(FullMetadata.getInstance);
}

/// The full set of object metadata, including read-only properties.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.FullMetadata>
class FullMetadata
    extends _UploadMetadataBase<storage_interop.FullMetadataJsImpl> {
  static final _expando = Expando<FullMetadata>();

  /// The bucket the actual object is contained in.
  String get bucket => jsObject.bucket;

  /// The full path.
  String get fullPath => jsObject.fullPath;

  /// The generation.
  String get generation => jsObject.generation;

  /// The metageneration.
  String get metageneration => jsObject.metageneration;

  /// The short name. Which is the last component of the full path.
  String get name => jsObject.name;

  /// The size in bytes.
  int get size => jsObject.size;

  /// Returns the time it was created as a [DateTime].
  DateTime get timeCreated => DateTime.parse(jsObject.timeCreated);

  /// Returns the time it was last updated as a [DateTime].
  DateTime get updated => DateTime.parse(jsObject.updated);

  /// Creates a new FullMetadata from a [jsObject].
  static FullMetadata getInstance(jsObject) {
    if (jsObject == null) {
      return null;
    }
    return _expando[jsObject] ??= FullMetadata._fromJsObject(jsObject);
  }

  FullMetadata._fromJsObject(jsObject) : super.fromJsObject(jsObject);
}

/// Object metadata that can be set at upload.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.UploadMetadata>.
class UploadMetadata
    extends _UploadMetadataBase<storage_interop.UploadMetadataJsImpl> {
  /// Creates a new UploadMetadata with optional metadata parameters.
  factory UploadMetadata(
          {String md5Hash,
          String cacheControl,
          String contentDisposition,
          String contentEncoding,
          String contentLanguage,
          String contentType,
          Map<String, String> customMetadata}) =>
      UploadMetadata.fromJsObject(storage_interop.UploadMetadataJsImpl(
          md5Hash: md5Hash,
          cacheControl: cacheControl,
          contentDisposition: contentDisposition,
          contentEncoding: contentEncoding,
          contentLanguage: contentLanguage,
          contentType: contentType,
          customMetadata:
              (customMetadata != null) ? jsify(customMetadata) : null));

  /// Creates a new UploadMetadata from a [jsObject].
  UploadMetadata.fromJsObject(storage_interop.UploadMetadataJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

// TODO(kevmoo) - figure out if a settable md5Hash makes any sense
// See https://stackoverflow.com/q/44959703/39827
abstract class _UploadMetadataBase<
        T extends storage_interop.UploadMetadataJsImpl>
    extends _SettableMetadataBase<T> {
  /// The Base64-encoded MD5 hash for the object being uploaded.
  String get md5Hash => jsObject.md5Hash;
  set md5Hash(String s) {
    jsObject.md5Hash = s;
  }

  _UploadMetadataBase.fromJsObject(T jsObject) : super.fromJsObject(jsObject);
}

/// Represents the process of uploading an object, and allows to monitor
/// and manage the upload.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.UploadTask>.
class UploadTask extends JsObjectWrapper<storage_interop.UploadTaskJsImpl> {
  static final _expando = Expando<UploadTask>();

  Future<UploadTaskSnapshot> _future;

  /// Returns the UploadTaskSnapshot when the upload successfully completes.
  Future<UploadTaskSnapshot> get future {
    return _future ??=
        handleThenable(jsObject).then(UploadTaskSnapshot.getInstance);
  }

  /// Returns the upload task snapshot of the current task state.
  UploadTaskSnapshot get snapshot =>
      UploadTaskSnapshot.getInstance(jsObject.snapshot);

  /// Creates a new UploadTask from a [jsObject].
  static UploadTask getInstance(storage_interop.UploadTaskJsImpl jsObject) {
    if (jsObject == null) {
      return null;
    }
    return _expando[jsObject] ??= UploadTask._fromJsObject(jsObject);
  }

  UploadTask._fromJsObject(storage_interop.UploadTaskJsImpl jsObject)
      : super.fromJsObject(jsObject);

  /// Cancels a running task. Has no effect on a complete or failed task.
  /// Returns [:true:] if it had an effect.
  bool cancel() => jsObject.cancel();

  ZoneCallback _onStateChangedUnsubscribe;
  StreamController<UploadTaskSnapshot> _changeController;

  /// Stream for upload task state changed event.
  Stream<UploadTaskSnapshot> get onStateChanged {
    if (_changeController == null) {
      var nextWrapper =
          allowInterop((storage_interop.UploadTaskSnapshotJsImpl data) {
        _changeController.add(UploadTaskSnapshot.getInstance(data));
      });

      var errorWrapper = allowInterop((e) => _changeController.addError(e));
      var onCompletion = allowInterop(() {
        // Needing a block here (instead of an inline => function) seems to be a
        // dart-lang/sdk quirk/feature.
        // See https://github.com/dart-lang/sdk/issues/43781
        _changeController.close();
      });

      void startListen() {
        _onStateChangedUnsubscribe = jsObject.on(
            storage_interop.TaskEvent.STATE_CHANGED,
            nextWrapper,
            errorWrapper,
            onCompletion);
      }

      void stopListen() {
        _onStateChangedUnsubscribe();
      }

      _changeController = StreamController<UploadTaskSnapshot>.broadcast(
          onListen: startListen, onCancel: stopListen, sync: true);
    }
    return _changeController.stream;
  }

  /// Pauses the running task. Has no effect on a paused or failed task.
  /// Returns [:true:] if it had an effect.
  bool pause() => jsObject.pause();

  /// Resumes the paused task. Has no effect on a running or failed task.
  /// Returns [:true:] if it had an effect.
  bool resume() => jsObject.resume();
}

/// Holds data about the current state of the upload task.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.UploadTaskSnapshot>.
class UploadTaskSnapshot
    extends JsObjectWrapper<storage_interop.UploadTaskSnapshotJsImpl> {
  static final _expando = Expando<UploadTaskSnapshot>();

  /// The number of bytes that have been successfully transferred.
  int get bytesTransferred => jsObject.bytesTransferred;

  /// The metadata. Before the upload completes, it contains the metadata sent
  /// to the server. After the upload completes, it contains the metadata sent
  /// back from the server.
  FullMetadata get metadata => FullMetadata.getInstance(jsObject.metadata);

  /// The StorageReference that spawned the current snapshot's upload task.
  StorageReference get ref => StorageReference.getInstance(jsObject.ref);

  /// The actual task state.
  TaskState get state {
    switch (jsObject.state) {
      case 'running':
        return TaskState.RUNNING;
      case 'paused':
        return TaskState.PAUSED;
      case 'success':
        return TaskState.SUCCESS;
      case 'canceled':
        return TaskState.CANCELED;
      case 'error':
        return TaskState.ERROR;
      default:
        throw UnsupportedError(
            "Unknown state '${jsObject.state}' please file a bug.");
    }
  }

  /// The UploadTask for this snapshot.
  UploadTask get task => UploadTask.getInstance(jsObject.task);

  /// The total number of bytes to be uploaded.
  int get totalBytes => jsObject.totalBytes;

  /// Creates a new UploadTaskSnapshot from a [jsObject].
  static UploadTaskSnapshot getInstance(
      storage_interop.UploadTaskSnapshotJsImpl jsObject) {
    if (jsObject == null) {
      return null;
    }
    return _expando[jsObject] ??= UploadTaskSnapshot._fromJsObject(jsObject);
  }

  UploadTaskSnapshot._fromJsObject(
      storage_interop.UploadTaskSnapshotJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

/// Object metadata that can be set at any time.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.storage.SettableMetadata>.
class SettableMetadata
    extends _SettableMetadataBase<storage_interop.SettableMetadataJsImpl> {
  /// Creates a new SettableMetadata with optional metadata parameters.
  factory SettableMetadata(
          {String cacheControl,
          String contentDisposition,
          String contentEncoding,
          String contentLanguage,
          String contentType,
          Map customMetadata}) =>
      SettableMetadata.fromJsObject(storage_interop.SettableMetadataJsImpl(
          cacheControl: cacheControl,
          contentDisposition: contentDisposition,
          contentEncoding: contentEncoding,
          contentLanguage: contentLanguage,
          contentType: contentType,
          customMetadata:
              (customMetadata != null) ? jsify(customMetadata) : null));

  /// Creates a new SettableMetadata from a [jsObject].
  SettableMetadata.fromJsObject(storage_interop.SettableMetadataJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

abstract class _SettableMetadataBase<
        T extends storage_interop.SettableMetadataJsImpl>
    extends JsObjectWrapper<T> {
  /// Served as the 'Cache-Control' header on object download.
  String get cacheControl => jsObject.cacheControl;
  set cacheControl(String s) {
    jsObject.cacheControl = s;
  }

  /// Served as the 'Content-Disposition' header on object download.
  String get contentDisposition => jsObject.contentDisposition;
  set contentDisposition(String s) {
    jsObject.contentDisposition = s;
  }

  /// Served as the 'Content-Encoding' header on object download.
  String get contentEncoding => jsObject.contentEncoding;
  set contentEncoding(String s) {
    jsObject.contentEncoding = s;
  }

  /// Served as the 'Content-Language' header on object download.
  String get contentLanguage => jsObject.contentLanguage;
  set contentLanguage(String s) {
    jsObject.contentLanguage = s;
  }

  /// Served as the 'Content-Type' header on object download.
  String get contentType => jsObject.contentType;
  set contentType(String s) {
    jsObject.contentType = s;
  }

  /// Additional user-defined custom metadata.
  Map<String, String> get customMetadata =>
      (dartify(jsObject.customMetadata) as Map)?.cast<String, String>();
  set customMetadata(Map<String, String> m) {
    jsObject.customMetadata = jsify(m);
  }

  _SettableMetadataBase.fromJsObject(T jsObject) : super.fromJsObject(jsObject);
}

/// The options [StorageReference.list] accepts.
class ListOptions extends JsObjectWrapper<storage_interop.ListOptionsJsImpl> {
  /// If set, limits the total number of prefixes and items to return.
  /// The default and maximum maxResults is 1000.
  int get maxResults => jsObject.maxResults;
  set maxResults(int n) => jsObject.maxResults = n;

  /// The [ListResult.nextPageToken] from a previous call to
  /// [StorageReference.list]. If provided, listing is resumed from the
  /// previous position.
  String get pageToken => jsObject.pageToken;
  set pageToken(String t) => jsObject.pageToken = t;

  factory ListOptions({int maxResults, String pageToken}) =>
      ListOptions._fromJsObject(storage_interop.ListOptionsJsImpl(
          maxResults: maxResults, pageToken: pageToken));

  ListOptions._fromJsObject(storage_interop.ListOptionsJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

/// Result returned by [StorageReference.list].
class ListResult extends JsObjectWrapper<storage_interop.ListResultJsImpl> {
  static final _expando = Expando<ListResult>();

  /// Objects in this directory. You can call [getMetadata()] and
  /// [getDownloadUrl()] on them.
  List<StorageReference> get items => jsObject.items
      .map((dynamic data) => StorageReference._fromJsObject(data))
      .toList();

  /// If set, there might be more results for this list. Use this
  /// token to resume the list.
  String get nextPageToken => jsObject.nextPageToken;

  /// References to prefixes (sub-folders). You can call [list()] on
  /// them to get its contents.

  /// Folders are implicit based on '/' in the object paths. For example,
  /// if a bucket has two objects '/a/b/1' and '/a/b/2', [list('/a')] will
  /// return '/a/b' as a prefix.
  List<StorageReference> get prefixes => jsObject.prefixes
      .map((dynamic data) => StorageReference._fromJsObject(data))
      .toList();

  /// Creates a new ListResult from a [jsObject].
  static ListResult getInstance(storage_interop.ListResultJsImpl jsObject) {
    if (jsObject == null) {
      return null;
    }
    return _expando[jsObject] ??= ListResult._fromJsObject(jsObject);
  }

  ListResult._fromJsObject(storage_interop.ListResultJsImpl jsObject)
      : super.fromJsObject(jsObject);
}
