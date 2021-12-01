// IToastNotification.dart

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../api-ms-win-core-winrt-l1-1-0.dart';
import '../api-ms-win-core-winrt-string-l1-1-0.dart';
import '../combase.dart';
import '../constants.dart';
import '../exceptions.dart';
import '../macros.dart';
import '../ole32.dart';
import '../structs.dart';
import '../structs.g.dart';
import '../utils.dart';
import '../winrt/winrt_constants.dart';
import '../winrt/winrt_helpers.dart';

import 'IInspectable.dart';
import 'IToastNotificationFactory.dart';

const _className = 'Windows.UI.Notifications.ToastNotification';

typedef _get_Content_Native = Int32 Function(
    Pointer obj, Pointer<Pointer> value);
typedef _get_Content_Dart = int Function(Pointer obj, Pointer<Pointer> value);

typedef _put_ExpirationTime_Native = Int32 Function(Pointer obj, Uint32 value);
typedef _put_ExpirationTime_Dart = int Function(Pointer obj, int value);

typedef _get_ExpirationTime_Native = Int32 Function(
    Pointer obj, Pointer<Uint32> value);
typedef _get_ExpirationTime_Dart = int Function(
    Pointer obj, Pointer<Uint32> value);

typedef _add_Dismissed_Native = Int32 Function(
    Pointer obj, Pointer handler, Pointer<Uint32> result);
typedef _add_Dismissed_Dart = int Function(
    Pointer obj, Pointer handler, Pointer<Uint32> result);

typedef _remove_Dismissed_Native = Int32 Function(Pointer obj, Uint32 token);
typedef _remove_Dismissed_Dart = int Function(Pointer obj, int token);

typedef _add_Activated_Native = Int32 Function(
    Pointer obj, Pointer handler, Pointer<Uint32> result);
typedef _add_Activated_Dart = int Function(
    Pointer obj, Pointer handler, Pointer<Uint32> result);

typedef _remove_Activated_Native = Int32 Function(Pointer obj, Uint32 token);
typedef _remove_Activated_Dart = int Function(Pointer obj, int token);

typedef _add_Failed_Native = Int32 Function(
    Pointer obj, Pointer handler, Pointer<Uint32> result);
typedef _add_Failed_Dart = int Function(
    Pointer obj, Pointer handler, Pointer<Uint32> result);

typedef _remove_Failed_Native = Int32 Function(Pointer obj, Uint32 token);
typedef _remove_Failed_Dart = int Function(Pointer obj, int token);

/// {@category Interface}
/// {@category winrt}
class ToastNotification extends IInspectable {
  // vtable begins at 6, ends at 14

  ToastNotification(Pointer<COMObject> ptr) : super(ptr);

  Pointer get Content {
    final retValuePtr = calloc<Pointer>();

    try {
      final hr = ptr.ref.lpVtbl.value
          .elementAt(6)
          .cast<Pointer<NativeFunction<_get_Content_Native>>>()
          .value
          .asFunction<_get_Content_Dart>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  set ExpirationTime(int value) {
    final hr = ptr.ref.lpVtbl.value
        .elementAt(7)
        .cast<Pointer<NativeFunction<_put_ExpirationTime_Native>>>()
        .value
        .asFunction<_put_ExpirationTime_Dart>()(ptr.ref.lpVtbl, value);

    if (FAILED(hr)) throw WindowsException(hr);
  }

  int get ExpirationTime {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.lpVtbl.value
          .elementAt(8)
          .cast<Pointer<NativeFunction<_get_ExpirationTime_Native>>>()
          .value
          .asFunction<_get_ExpirationTime_Dart>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  int add_Dismissed(Pointer handler, Pointer<Uint32> result) =>
      ptr.ref.lpVtbl.value
          .elementAt(9)
          .cast<Pointer<NativeFunction<_add_Dismissed_Native>>>()
          .value
          .asFunction<_add_Dismissed_Dart>()(ptr.ref.lpVtbl, handler, result);

  int remove_Dismissed(int token) => ptr.ref.lpVtbl.value
      .elementAt(10)
      .cast<Pointer<NativeFunction<_remove_Dismissed_Native>>>()
      .value
      .asFunction<_remove_Dismissed_Dart>()(ptr.ref.lpVtbl, token);

  int add_Activated(Pointer handler, Pointer<Uint32> result) =>
      ptr.ref.lpVtbl.value
          .elementAt(11)
          .cast<Pointer<NativeFunction<_add_Activated_Native>>>()
          .value
          .asFunction<_add_Activated_Dart>()(ptr.ref.lpVtbl, handler, result);

  int remove_Activated(int token) => ptr.ref.lpVtbl.value
      .elementAt(12)
      .cast<Pointer<NativeFunction<_remove_Activated_Native>>>()
      .value
      .asFunction<_remove_Activated_Dart>()(ptr.ref.lpVtbl, token);

  int add_Failed(Pointer handler, Pointer<Uint32> result) =>
      ptr.ref.lpVtbl.value
          .elementAt(13)
          .cast<Pointer<NativeFunction<_add_Failed_Native>>>()
          .value
          .asFunction<_add_Failed_Dart>()(ptr.ref.lpVtbl, handler, result);

  int remove_Failed(int token) => ptr.ref.lpVtbl.value
      .elementAt(14)
      .cast<Pointer<NativeFunction<_remove_Failed_Native>>>()
      .value
      .asFunction<_remove_Failed_Dart>()(ptr.ref.lpVtbl, token);

  static ToastNotification Create(Pointer content) {
    final hClassName = convertToHString(_className);

    final pIID = calloc<GUID>()..ref.setGUID(IID_IToastNotificationFactory);
    final activationFactory = calloc<COMObject>();
    final toastNotification = calloc<COMObject>();

    try {
      var hr =
          RoGetActivationFactory(hClassName, pIID, activationFactory.cast());
      if (FAILED(hr)) {
        throw WindowsException(hr);
      }
      final toastNotificationFactory =
          IToastNotificationFactory(activationFactory);
      hr = toastNotificationFactory.CreateToastNotification(
          content, toastNotification.cast());
      if (FAILED(hr)) {
        throw WindowsException(hr);
      }
      return ToastNotification(toastNotification);
    } finally {
      WindowsDeleteString(hClassName);
      free(pIID);
      free(activationFactory);
      free(toastNotification);
    }
  }
}
