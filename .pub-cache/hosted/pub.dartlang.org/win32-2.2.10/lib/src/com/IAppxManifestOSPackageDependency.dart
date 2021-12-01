// IAppxManifestOSPackageDependency.dart

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

import 'IUnknown.dart';

/// @nodoc
const IID_IAppxManifestOSPackageDependency =
    '{154995EE-54A6-4F14-AC97-D8CF0519644B}';

typedef _GetName_Native = Int32 Function(
    Pointer obj, Pointer<Pointer<Utf16>> name);
typedef _GetName_Dart = int Function(Pointer obj, Pointer<Pointer<Utf16>> name);

typedef _GetVersion_Native = Int32 Function(
    Pointer obj, Pointer<Uint64> version);
typedef _GetVersion_Dart = int Function(Pointer obj, Pointer<Uint64> version);

/// {@category Interface}
/// {@category com}
class IAppxManifestOSPackageDependency extends IUnknown {
  // vtable begins at 3, ends at 4

  IAppxManifestOSPackageDependency(Pointer<COMObject> ptr) : super(ptr);

  int GetName(Pointer<Pointer<Utf16>> name) => ptr.ref.lpVtbl.value
      .elementAt(3)
      .cast<Pointer<NativeFunction<_GetName_Native>>>()
      .value
      .asFunction<_GetName_Dart>()(ptr.ref.lpVtbl, name);

  int GetVersion(Pointer<Uint64> version) => ptr.ref.lpVtbl.value
      .elementAt(4)
      .cast<Pointer<NativeFunction<_GetVersion_Native>>>()
      .value
      .asFunction<_GetVersion_Dart>()(ptr.ref.lpVtbl, version);
}
