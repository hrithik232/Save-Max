// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'callbacks.dart';
import 'combase.dart';
import 'structs.dart';
import 'structs.g.dart';

final _scarddlg = DynamicLibrary.open('scarddlg.dll');

/// The SCardUIDlgSelectCard function displays the smart card Select Card
/// dialog box.
///
/// ```c
/// LONG SCardUIDlgSelectCardW(
///   LPOPENCARDNAMEW_EX unnamedParam1
/// );
/// ```
/// {@category winscard}
int SCardUIDlgSelectCard(Pointer<OPENCARDNAME_EX> param0) =>
    _SCardUIDlgSelectCard(param0);

late final _SCardUIDlgSelectCard = _scarddlg.lookupFunction<
    Int32 Function(Pointer<OPENCARDNAME_EX> param0),
    int Function(Pointer<OPENCARDNAME_EX> param0)>('SCardUIDlgSelectCardW');
