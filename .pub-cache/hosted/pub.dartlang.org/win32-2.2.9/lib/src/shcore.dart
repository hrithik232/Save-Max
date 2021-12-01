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

final _shcore = DynamicLibrary.open('shcore.dll');

/// Queries the dots per inch (dpi) of a display.
///
/// ```c
/// HRESULT GetDpiForMonitor(
///   HMONITOR         hmonitor,
///   MONITOR_DPI_TYPE dpiType,
///   UINT             *dpiX,
///   UINT             *dpiY
///   );
/// ```
/// {@category shcore}
int GetDpiForMonitor(int hmonitor, int dpiType, Pointer<Uint32> dpiX,
        Pointer<Uint32> dpiY) =>
    _GetDpiForMonitor(hmonitor, dpiType, dpiX, dpiY);

late final _GetDpiForMonitor = _shcore.lookupFunction<
    Int32 Function(IntPtr hmonitor, Uint32 dpiType, Pointer<Uint32> dpiX,
        Pointer<Uint32> dpiY),
    int Function(int hmonitor, int dpiType, Pointer<Uint32> dpiX,
        Pointer<Uint32> dpiY)>('GetDpiForMonitor');

/// Retrieves the dots per inch (dpi) awareness of the specified process.
///
/// ```c
/// HRESULT GetProcessDpiAwareness(
///   HANDLE                hprocess,
///   PROCESS_DPI_AWARENESS *value
/// );
/// ```
/// {@category shcore}
int GetProcessDpiAwareness(int hprocess, Pointer<Uint32> value) =>
    _GetProcessDpiAwareness(hprocess, value);

late final _GetProcessDpiAwareness = _shcore.lookupFunction<
    Int32 Function(IntPtr hprocess, Pointer<Uint32> value),
    int Function(
        int hprocess, Pointer<Uint32> value)>('GetProcessDpiAwareness');

/// Gets the scale factor of a specific monitor.
///
/// ```c
/// HRESULT GetScaleFactorForMonitor(
///   HMONITOR            hMon,
///   DEVICE_SCALE_FACTOR *pScale
/// );
/// ```
/// {@category shcore}
int GetScaleFactorForMonitor(int hMon, Pointer<Uint32> pScale) =>
    _GetScaleFactorForMonitor(hMon, pScale);

late final _GetScaleFactorForMonitor = _shcore.lookupFunction<
    Int32 Function(IntPtr hMon, Pointer<Uint32> pScale),
    int Function(int hMon, Pointer<Uint32> pScale)>('GetScaleFactorForMonitor');

/// Sets the process-default DPI awareness level. This is equivalent to
/// calling SetProcessDpiAwarenessContext with the corresponding
/// DPI_AWARENESS_CONTEXT value.
///
/// ```c
/// HRESULT SetProcessDpiAwareness(
///   PROCESS_DPI_AWARENESS value
/// );
/// ```
/// {@category shcore}
int SetProcessDpiAwareness(int value) => _SetProcessDpiAwareness(value);

late final _SetProcessDpiAwareness = _shcore.lookupFunction<
    Int32 Function(Uint32 value),
    int Function(int value)>('SetProcessDpiAwareness');
