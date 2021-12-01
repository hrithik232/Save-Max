// IAppxManifestReader6.dart

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
const IID_IAppxManifestReader6 = '{34DEACA4-D3C0-4E3E-B312-E42625E3807E}';

typedef _GetIsNonQualifiedResourcePackage_Native = Int32 Function(
    Pointer obj, Pointer<Int32> isNonQualifiedResourcePackage);
typedef _GetIsNonQualifiedResourcePackage_Dart = int Function(
    Pointer obj, Pointer<Int32> isNonQualifiedResourcePackage);

/// {@category Interface}
/// {@category com}
class IAppxManifestReader6 extends IUnknown {
  // vtable begins at 3, ends at 3

  IAppxManifestReader6(Pointer<COMObject> ptr) : super(ptr);

  int
      GetIsNonQualifiedResourcePackage(
              Pointer<Int32> isNonQualifiedResourcePackage) =>
          ptr.ref.lpVtbl.value
                  .elementAt(3)
                  .cast<
                      Pointer<
                          NativeFunction<
                              _GetIsNonQualifiedResourcePackage_Native>>>()
                  .value
                  .asFunction<_GetIsNonQualifiedResourcePackage_Dart>()(
              ptr.ref.lpVtbl, isNonQualifiedResourcePackage);
}
