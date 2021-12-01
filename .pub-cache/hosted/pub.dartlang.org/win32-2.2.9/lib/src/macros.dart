// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart representations of Win32 C macros

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'callbacks.dart';
import 'constants.dart';
import 'structs.g.dart';
import 'user32.dart';

/// Creates a WORD value by concatenating the specified values.
//
// #define MAKEWORD(a, b)   ((WORD)(((BYTE)(((DWORD_PTR)(a)) & 0xff)) |
//                          ((WORD)((BYTE)(((DWORD_PTR)(b)) & 0xff))) << 8))
int MAKEWORD(int a, int b) => a & 0xff | ((b & 0xff) << 8);

/// Creates a LONG value by concatenating the specified values.
//
// #define MAKELONG(a, b)   ((LONG)(((WORD)(((DWORD_PTR)(a)) & 0xffff)) |
//                          ((DWORD)((WORD)(((DWORD_PTR)(b)) & 0xffff))) << 16))
int MAKELONG(int a, int b) => a & 0xffff | ((b & 0xffff) << 16);

/// Retrieves the low-order word from the specified 32-bit value.
//
// #define LOWORD(l)           ((WORD)(((DWORD_PTR)(l)) & 0xffff))
int LOWORD(int l) => l & 0xffff;

/// Retrieves the high-order word from the specified 32-bit value.
//
// #define HIWORD(l)           ((WORD)((((DWORD_PTR)(l)) >> 16) & 0xffff))
int HIWORD(int l) => (l >> 16) & 0xffff;

/// Retrieves the low-order byte from the specified 16-bit value.
//
// #define LOBYTE(w)           ((BYTE)(((DWORD_PTR)(w)) & 0xff))
int LOBYTE(int w) => w & 0xff;

/// Retrieves the high-order byte from the specified 16-bit value.
//
// #define HIBYTE(w)           ((BYTE)((((DWORD_PTR)(w)) >> 8) & 0xff))
int HIBYTE(int w) => (w >> 8) & 0xff;

/// Selects a red, green, blue (RGB) color based on the arguments supplied and
/// the color capabilities of the output device.
//
// ((COLORREF)(((BYTE)(r)|((WORD)((BYTE)(g))<<8))|(((DWORD)(BYTE)(b))<<16)))
int RGB(int r, int g, int b) => r + (g << 8) + (b << 16);

/// Retrieves an intensity value for the red component of a red, green, blue
/// (RGB) value.
//
// #define GetRValue(rgb)      (LOBYTE(rgb))
int GetRValue(int rgb) => LOBYTE(rgb);

/// Retrieves an intensity value for the green component of a red, green, blue
/// (RGB) value.
//
// #define GetGValue(rgb)      (LOBYTE(((WORD)(rgb)) >> 8))
int GetGValue(int rgb) => LOBYTE(rgb >> 8);

/// Retrieves an intensity value for the blue component of a red, green, blue
/// (RGB) value.
//
// #define GetBValue(rgb)      (LOBYTE((rgb)>>16))
int GetBValue(int rgb) => LOBYTE(rgb >> 16);

/// Provides a generic test for success on any status value.
//
// #define SUCCEEDED(hr) (((HRESULT)(hr)) >= 0)
bool SUCCEEDED(int result) => result >= 0;

/// Provides a generic test for failure on any status value.
//
// #define FAILED(hr) (((HRESULT)(hr)) < 0)
bool FAILED(int result) => result < 0;

/// Maps a system error code to an HRESULT value.
//
// #define __HRESULT_FROM_WIN32(x) ((HRESULT)(x) <= 0 ? ((HRESULT)(x)) :
//       ((HRESULT) (((x) & 0x0000FFFF) | (FACILITY_WIN32 << 16) | 0x80000000)))
int HRESULT_FROM_WIN32(int x) =>
    (x <= 0 ? x : (x & 0x0000FFFF | (FACILITY_WIN32 << 16) | 0x80000000))
        .toSigned(32);

/// Maps a control code to a constant
//
// #define CTL_CODE( DeviceType, Function, Method, Access ) (
//   ((DeviceType) << 16) | ((Access) << 14) | ((Function) << 2) | (Method)
int CTL_CODE(int DeviceType, int Function, int Method, int Access) =>
    (((DeviceType) << 16) | ((Access) << 14) | ((Function) << 2) | (Method))
        .toSigned(32);

/// Retrieves the parameters to WM_SYSCOMMAND.
///
/// {@category user32}
//
// #define GET_SC_WPARAM(wParam) ((int)wParam & 0xFFF0)
int GET_SC_WPARAM(int wParam) => wParam & 0xFFF0;

/// Creates an overlapped, pop-up, or child window. It specifies the window
/// class, window title, window style, and (optionally) the initial position and
/// size of the window. The function also specifies the window's parent or
/// owner, if any, and the window's menu.
///
/// ```c
/// HWND CreateWindowW(
///   LPCWSTR   lpClassName,
///   LPCWSTR   lpWindowName,
///   DWORD     dwStyle,
///   int       X,
///   int       Y,
///   int       nWidth,
///   int       nHeight,
///   HWND      hWndParent,
///   HMENU     hMenu,
///   HINSTANCE hInstance,
///   LPVOID    lpParam
/// );
/// ```
///
/// {@category user32}
int CreateWindow(
        Pointer<Utf16> lpClassName,
        Pointer<Utf16> lpWindowName,
        int dwStyle,
        int X,
        int Y,
        int nWidth,
        int nHeight,
        int hWndParent,
        int hMenu,
        int hInstance,
        Pointer lpParam) =>
    CreateWindowEx(0, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight,
        hWndParent, hMenu, hInstance, lpParam);

/// Creates a modal dialog box from a dialog box template in memory.
/// DialogBoxIndirect does not return control until the specified callback
/// function terminates the modal dialog box by calling the EndDialog function.
///
/// DialogBoxIndirect is implemented as a call to the DialogBoxIndirectParam
/// function.
///
/// ```c
/// void DialogBoxIndirectW(
///    hInstance,
///    lpTemplate,
///    hWndParent,
///    lpDialogFunc
/// );
/// ```
/// {@category user32}
void DialogBoxIndirect(int hInstance, Pointer<DLGTEMPLATE> lpTemplate,
        int hWndParent, Pointer<NativeFunction<DlgProc>> lpDialogFunc) =>
    DialogBoxIndirectParam(hInstance, lpTemplate, hWndParent, lpDialogFunc, 0);
