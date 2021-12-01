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

final _api_ms_win_core_winrt_l1_1_0 =
    DynamicLibrary.open('api-ms-win-core-winrt-l1-1-0.dll');

/// Activates the specified Windows Runtime class.
///
/// ```c
/// HRESULT RoActivateInstance(
///   HSTRING      activatableClassId,
///   IInspectable **instance
/// );
/// ```
/// {@category winrt}
int RoActivateInstance(int activatableClassId, Pointer<Pointer> instance) =>
    _RoActivateInstance(activatableClassId, instance);

late final _RoActivateInstance = _api_ms_win_core_winrt_l1_1_0.lookupFunction<
    Int32 Function(IntPtr activatableClassId, Pointer<Pointer> instance),
    int Function(int activatableClassId,
        Pointer<Pointer> instance)>('RoActivateInstance');

/// Gets the activation factory for the specified runtime class.
///
/// ```c
/// HRESULT RoGetActivationFactory(
///   HSTRING activatableClassId,
///   REFIID  iid,
///   void    **factory
/// );
/// ```
/// {@category winrt}
int RoGetActivationFactory(
        int activatableClassId, Pointer<GUID> iid, Pointer<Pointer> factory) =>
    _RoGetActivationFactory(activatableClassId, iid, factory);

late final _RoGetActivationFactory =
    _api_ms_win_core_winrt_l1_1_0.lookupFunction<
        Int32 Function(IntPtr activatableClassId, Pointer<GUID> iid,
            Pointer<Pointer> factory),
        int Function(int activatableClassId, Pointer<GUID> iid,
            Pointer<Pointer> factory)>('RoGetActivationFactory');

/// Gets a unique identifier for the current apartment.
///
/// ```c
/// HRESULT RoGetApartmentIdentifier(
///   UINT64 *apartmentIdentifier
/// );
/// ```
/// {@category winrt}
int RoGetApartmentIdentifier(Pointer<Uint64> apartmentIdentifier) =>
    _RoGetApartmentIdentifier(apartmentIdentifier);

late final _RoGetApartmentIdentifier =
    _api_ms_win_core_winrt_l1_1_0.lookupFunction<
        Int32 Function(Pointer<Uint64> apartmentIdentifier),
        int Function(
            Pointer<Uint64> apartmentIdentifier)>('RoGetApartmentIdentifier');

/// Initializes the Windows Runtime on the current thread with the
/// specified concurrency model.
///
/// ```c
/// HRESULT RoInitialize(
///   RO_INIT_TYPE initType
/// );
/// ```
/// {@category winrt}
int RoInitialize(int initType) => _RoInitialize(initType);

late final _RoInitialize = _api_ms_win_core_winrt_l1_1_0.lookupFunction<
    Int32 Function(Uint32 initType),
    int Function(int initType)>('RoInitialize');

/// Closes the Windows Runtime on the current thread.
///
/// ```c
/// void RoUninitialize();
/// ```
/// {@category winrt}
void RoUninitialize() => _RoUninitialize();

late final _RoUninitialize = _api_ms_win_core_winrt_l1_1_0
    .lookupFunction<Void Function(), void Function()>('RoUninitialize');
