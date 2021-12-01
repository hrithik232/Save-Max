// ignore_for_file: require_trailing_commas
// DO NOT MOVE THIS FILE
//
// Other firebase packages may import `package:firebase_core/src/internals.dart`.
// Moving it would break the imports
//
// This file exports utilities shared between firebase packages, without making
// them public.

import '../firebase_core.dart';
import 'interop_shimmer.dart'
    if (dart.library.js) 'package:firebase_core_web/firebase_core_web_interop.dart'
    as core_interop;

extension ObjectX<T> on T? {
  R? guard<R>(R Function(T value) cb) {
    if (this is T) return cb(this as T);
    return null;
  }

  R? safeCast<R>() {
    if (this is R) return this as R;
    return null;
  }
}

FirebaseException _firebaseExceptionFromCoreFirebaseError(
  core_interop.FirebaseError firebaseError, {
  required String plugin,
  required String Function(String) codeParser,
  required String Function(String code, String message)? messageParser,
}) {
  final code = codeParser(firebaseError.code);

  final message = messageParser != null
      ? messageParser(code, firebaseError.message)
      : firebaseError.message.replaceFirst('(${firebaseError.code})', '');

  return FirebaseException(
    plugin: plugin,
    message: message,
    code: code,
  );
}

/// Checks whether a thrown object needs to be mapped using [_mapException] or
/// should be left untouched.
///
/// It is critical to split [_testException] and [_mapException] so that
/// exceptions that should not be transformed preserve their stracktrace.
///
/// See also https://github.com/dart-lang/sdk/issues/30741
bool _testException(Object? exception) {
  return exception is core_interop.FirebaseError;
}

/// Transforms internal errors in something more readable for end-users.
Object _mapException(
  Object? exception, {
  required String plugin,
  required String Function(String) codeParser,
  required String Function(String code, String message)? messageParser,
}) {
  assert(_testException(exception));

  if (exception is core_interop.FirebaseError) {
    return _firebaseExceptionFromCoreFirebaseError(
      exception,
      plugin: plugin,
      codeParser: codeParser,
      messageParser: messageParser,
    );
  }

  throw StateError('unrecognized error $exception');
}

/// Will return a [FirebaseException] from a thrown web error.
/// Any other errors will be propagated as normal.
R guard<R>(
  R Function() cb, {
  required String plugin,
  required String Function(String) codeParser,
  String Function(String code, String message)? messageParser,
}) {
  try {
    final value = cb();

    if (value is Future) {
      return value.catchError(
        (err) => throw _mapException(
          err,
          plugin: plugin,
          codeParser: codeParser,
          messageParser: messageParser,
        ),
        test: _testException,
      ) as R;
    } else if (value is Stream) {
      return value.handleError(
        (err) => throw _mapException(
          err,
          plugin: plugin,
          codeParser: codeParser,
          messageParser: messageParser,
        ),
        test: _testException,
      ) as R;
    }

    return value;
  } catch (error) {
    if (!_testException(error)) {
      // Make sure to preserve the stacktrace
      rethrow;
    }

    throw _mapException(
      error,
      plugin: plugin,
      codeParser: codeParser,
      messageParser: messageParser,
    );
  }
}
