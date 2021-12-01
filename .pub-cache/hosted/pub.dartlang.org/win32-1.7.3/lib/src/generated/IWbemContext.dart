// IWbemContext.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../com/combase.dart';
import '../constants.dart';
import '../exceptions.dart';
import '../macros.dart';
import '../ole32.dart';
import '../structs.dart';

import 'IUnknown.dart';

/// @nodoc
const IID_IWbemContext = '{44aca674-e8fc-11d0-a07c-00c04fb68820}';

typedef _Clone_Native = Int32 Function(Pointer obj, Pointer<IntPtr> ppNewCopy);
typedef _Clone_Dart = int Function(Pointer obj, Pointer<IntPtr> ppNewCopy);

typedef _GetNames_Native = Int32 Function(
    Pointer obj, Int32 lFlags, Pointer<SAFEARRAY> pNames);
typedef _GetNames_Dart = int Function(
    Pointer obj, int lFlags, Pointer<SAFEARRAY> pNames);

typedef _BeginEnumeration_Native = Int32 Function(Pointer obj, Int32 lFlags);
typedef _BeginEnumeration_Dart = int Function(Pointer obj, int lFlags);

typedef _Next_Native = Int32 Function(Pointer obj, Int32 lFlags,
    Pointer<Utf16> pstrName, Pointer<VARIANT_POINTER> pValue);
typedef _Next_Dart = int Function(Pointer obj, int lFlags,
    Pointer<Utf16> pstrName, Pointer<VARIANT_POINTER> pValue);

typedef _EndEnumeration_Native = Int32 Function(Pointer obj);
typedef _EndEnumeration_Dart = int Function(Pointer obj);

typedef _SetValue_Native = Int32 Function(Pointer obj, Pointer<Utf16> wszName,
    Int32 lFlags, Pointer<VARIANT_POINTER> pValue);
typedef _SetValue_Dart = int Function(Pointer obj, Pointer<Utf16> wszName,
    int lFlags, Pointer<VARIANT_POINTER> pValue);

typedef _GetValue_Native = Int32 Function(Pointer obj, Pointer<Utf16> wszName,
    Int32 lFlags, Pointer<VARIANT_POINTER> pValue);
typedef _GetValue_Dart = int Function(Pointer obj, Pointer<Utf16> wszName,
    int lFlags, Pointer<VARIANT_POINTER> pValue);

typedef _DeleteValue_Native = Int32 Function(
    Pointer obj, Pointer<Utf16> wszName, Int32 lFlags);
typedef _DeleteValue_Dart = int Function(
    Pointer obj, Pointer<Utf16> wszName, int lFlags);

typedef _DeleteAll_Native = Int32 Function(Pointer obj);
typedef _DeleteAll_Dart = int Function(Pointer obj);

/// {@category Interface}
/// {@category com}
class IWbemContext extends IUnknown {
  // vtable begins at 3, ends at 11

  IWbemContext(Pointer<COMObject> ptr) : super(ptr);

  int Clone(Pointer<IntPtr> ppNewCopy) =>
      Pointer<NativeFunction<_Clone_Native>>.fromAddress(
              ptr.ref.vtable.elementAt(3).value)
          .asFunction<_Clone_Dart>()(ptr.ref.lpVtbl, ppNewCopy);

  int GetNames(int lFlags, Pointer<SAFEARRAY> pNames) =>
      Pointer<NativeFunction<_GetNames_Native>>.fromAddress(
              ptr.ref.vtable.elementAt(4).value)
          .asFunction<_GetNames_Dart>()(ptr.ref.lpVtbl, lFlags, pNames);

  int BeginEnumeration(int lFlags) =>
      Pointer<NativeFunction<_BeginEnumeration_Native>>.fromAddress(
              ptr.ref.vtable.elementAt(5).value)
          .asFunction<_BeginEnumeration_Dart>()(ptr.ref.lpVtbl, lFlags);

  int Next(int lFlags, Pointer<Utf16> pstrName,
          Pointer<VARIANT_POINTER> pValue) =>
      Pointer<NativeFunction<_Next_Native>>.fromAddress(
              ptr.ref.vtable.elementAt(6).value)
          .asFunction<_Next_Dart>()(ptr.ref.lpVtbl, lFlags, pstrName, pValue);

  int EndEnumeration() =>
      Pointer<NativeFunction<_EndEnumeration_Native>>.fromAddress(
              ptr.ref.vtable.elementAt(7).value)
          .asFunction<_EndEnumeration_Dart>()(ptr.ref.lpVtbl);

  int SetValue(Pointer<Utf16> wszName, int lFlags,
          Pointer<VARIANT_POINTER> pValue) =>
      Pointer<NativeFunction<_SetValue_Native>>.fromAddress(
                  ptr.ref.vtable.elementAt(8).value)
              .asFunction<_SetValue_Dart>()(
          ptr.ref.lpVtbl, wszName, lFlags, pValue);

  int GetValue(Pointer<Utf16> wszName, int lFlags,
          Pointer<VARIANT_POINTER> pValue) =>
      Pointer<NativeFunction<_GetValue_Native>>.fromAddress(
                  ptr.ref.vtable.elementAt(9).value)
              .asFunction<_GetValue_Dart>()(
          ptr.ref.lpVtbl, wszName, lFlags, pValue);

  int DeleteValue(Pointer<Utf16> wszName, int lFlags) =>
      Pointer<NativeFunction<_DeleteValue_Native>>.fromAddress(
              ptr.ref.vtable.elementAt(10).value)
          .asFunction<_DeleteValue_Dart>()(ptr.ref.lpVtbl, wszName, lFlags);

  int DeleteAll() => Pointer<NativeFunction<_DeleteAll_Native>>.fromAddress(
          ptr.ref.vtable.elementAt(11).value)
      .asFunction<_DeleteAll_Dart>()(ptr.ref.lpVtbl);
}
