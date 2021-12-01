// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'com/combase.dart';
import 'structs.dart';

final _comctl32 = DynamicLibrary.open('comctl32.dll');

/// The DrawStatusText function draws the specified text in the style of a
/// status window with borders.
///
/// ```c
/// void DrawStatusTextW(
///   HDC     hDC,
///   LPCRECT lprc,
///   LPCWSTR pszText,
///   UINT    uFlags
/// );
/// ```
/// {@category comctl32}
final DrawStatusText = _comctl32.lookupFunction<
    Void Function(
        IntPtr hdc, Pointer<RECT> lprc, Pointer<Utf16> pszText, Uint32 uFlags),
    void Function(int hdc, Pointer<RECT> lprc, Pointer<Utf16> pszText,
        int uFlags)>('DrawStatusTextW');

/// Ensures that the common control DLL (Comctl32.dll) is loaded, and
/// registers specific common control classes from the DLL. An application
/// must call this function before creating a common control.
///
/// ```c
/// BOOL InitCommonControlsEx(
///   const INITCOMMONCONTROLSEX *picce
/// );
/// ```
/// {@category comctl32}
final InitCommonControlsEx = _comctl32.lookupFunction<
    Int32 Function(Pointer<INITCOMMONCONTROLSEX> picce),
    int Function(Pointer<INITCOMMONCONTROLSEX> picce)>('InitCommonControlsEx');

/// The TaskDialog function creates, displays, and operates a task dialog.
/// The task dialog contains application-defined message text and title,
/// icons, and any combination of predefined push buttons. This function
/// does not support the registration of a callback function to receive
/// notifications.
///
/// ```c
/// HRESULT TaskDialog(
///   HWND                           hwndOwner,
///   HINSTANCE                      hInstance,
///   PCWSTR                         pszWindowTitle,
///   PCWSTR                         pszMainInstruction,
///   PCWSTR                         pszContent,
///   TASKDIALOG_COMMON_BUTTON_FLAGS dwCommonButtons,
///   PCWSTR                         pszIcon,
///   int                            *pnButton
/// );
/// ```
/// {@category comctl32}
final TaskDialog = _comctl32.lookupFunction<
    Int32 Function(
        Int32 hwndOwner,
        Int32 hInstance,
        Pointer<Utf16> pszWindowTitle,
        Pointer<Utf16> pszMainInstruction,
        Pointer<Utf16> pszContent,
        Int32 dwCommonButtons,
        Pointer<Utf16> pszIcon,
        Pointer<Int32> pnButton),
    int Function(
        int hwndOwner,
        int hInstance,
        Pointer<Utf16> pszWindowTitle,
        Pointer<Utf16> pszMainInstruction,
        Pointer<Utf16> pszContent,
        int dwCommonButtons,
        Pointer<Utf16> pszIcon,
        Pointer<Int32> pnButton)>('TaskDialog');

/// The TaskDialogIndirect function creates, displays, and operates a task
/// dialog. The task dialog contains application-defined icons, messages,
/// title, verification check box, command links, push buttons, and radio
/// buttons. This function can register a callback function to receive
/// notification messages.
///
/// ```c
/// HRESULT TaskDialogIndirect(
///   const TASKDIALOGCONFIG *pTaskConfig,
///   int                    *pnButton,
///   int                    *pnRadioButton,
///   BOOL                   *pfVerificationFlagChecked
/// );
/// ```
/// {@category comctl32}
final TaskDialogIndirect = _comctl32.lookupFunction<
    Int32 Function(
        Pointer<TASKDIALOGCONFIG> pTaskConfig,
        Pointer<Int32> pnButton,
        Pointer<Int32> pnRadioButton,
        Pointer<Int32> pfVerificationFlagChecked),
    int Function(
        Pointer<TASKDIALOGCONFIG> pTaskConfig,
        Pointer<Int32> pnButton,
        Pointer<Int32> pnRadioButton,
        Pointer<Int32> pfVerificationFlagChecked)>('TaskDialogIndirect');
