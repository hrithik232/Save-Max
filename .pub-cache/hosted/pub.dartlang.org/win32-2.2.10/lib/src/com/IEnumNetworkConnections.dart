// IEnumNetworkConnections.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../combase.dart';
import '../constants.dart';
import '../exceptions.dart';
import '../macros.dart';
import '../ole32.dart';
import '../structs.dart';
import '../structs.g.dart';
import '../utils.dart';

import 'IDispatch.dart';

/// @nodoc
const IID_IEnumNetworkConnections = '{DCB00006-570F-4A9B-8D69-199FDBA5723B}';

typedef _get__NewEnum_Native = Int32 Function(
    Pointer obj, Pointer<Pointer> ppEnumVar);
typedef _get__NewEnum_Dart = int Function(
    Pointer obj, Pointer<Pointer> ppEnumVar);

typedef _Next_Native = Int32 Function(Pointer obj, Uint32 celt,
    Pointer<Pointer> rgelt, Pointer<Uint32> pceltFetched);
typedef _Next_Dart = int Function(Pointer obj, int celt, Pointer<Pointer> rgelt,
    Pointer<Uint32> pceltFetched);

typedef _Skip_Native = Int32 Function(Pointer obj, Uint32 celt);
typedef _Skip_Dart = int Function(Pointer obj, int celt);

typedef _Reset_Native = Int32 Function(Pointer obj);
typedef _Reset_Dart = int Function(Pointer obj);

typedef _Clone_Native = Int32 Function(
    Pointer obj, Pointer<Pointer> ppEnumNetwork);
typedef _Clone_Dart = int Function(Pointer obj, Pointer<Pointer> ppEnumNetwork);

/// {@category Interface}
/// {@category com}
class IEnumNetworkConnections extends IDispatch {
  // vtable begins at 7, ends at 11

  IEnumNetworkConnections(Pointer<COMObject> ptr) : super(ptr);

  Pointer get NewEnum {
    final retValuePtr = calloc<Pointer>();

    try {
      final hr = ptr.ref.lpVtbl.value
          .elementAt(7)
          .cast<Pointer<NativeFunction<_get__NewEnum_Native>>>()
          .value
          .asFunction<_get__NewEnum_Dart>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  int Next(int celt, Pointer<Pointer> rgelt, Pointer<Uint32> pceltFetched) =>
      ptr.ref.lpVtbl.value
          .elementAt(8)
          .cast<Pointer<NativeFunction<_Next_Native>>>()
          .value
          .asFunction<_Next_Dart>()(ptr.ref.lpVtbl, celt, rgelt, pceltFetched);

  int Skip(int celt) => ptr.ref.lpVtbl.value
      .elementAt(9)
      .cast<Pointer<NativeFunction<_Skip_Native>>>()
      .value
      .asFunction<_Skip_Dart>()(ptr.ref.lpVtbl, celt);

  int Reset() => ptr.ref.lpVtbl.value
      .elementAt(10)
      .cast<Pointer<NativeFunction<_Reset_Native>>>()
      .value
      .asFunction<_Reset_Dart>()(ptr.ref.lpVtbl);

  int Clone(Pointer<Pointer> ppEnumNetwork) => ptr.ref.lpVtbl.value
      .elementAt(11)
      .cast<Pointer<NativeFunction<_Clone_Native>>>()
      .value
      .asFunction<_Clone_Dart>()(ptr.ref.lpVtbl, ppEnumNetwork);
}
