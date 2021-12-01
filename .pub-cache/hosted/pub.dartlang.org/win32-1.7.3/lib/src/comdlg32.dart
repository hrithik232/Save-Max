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

final _comdlg32 = DynamicLibrary.open('comdlg32.dll');

/// Creates a Color dialog box that enables the user to select a color.
///
/// ```c
/// BOOL WINAPI ChooseColor(
///   _Inout_ LPCHOOSECOLOR lpcc
/// );
/// ```
/// {@category comdlg32}
final ChooseColor = _comdlg32.lookupFunction<
    Int32 Function(Pointer<CHOOSECOLOR> lpcc),
    int Function(Pointer<CHOOSECOLOR> lpcc)>('ChooseColorW');

/// Creates a Font dialog box that enables the user to choose attributes
/// for a logical font. These attributes include a font family and
/// associated font style, a point size, effects (underline, strikeout, and
/// text color), and a script (or character set).
///
/// ```c
/// BOOL WINAPI ChooseFont(
///   _Inout_ LPCHOOSEFONT lpcf
/// );
/// ```
/// {@category comdlg32}
final ChooseFont = _comdlg32.lookupFunction<
    Int32 Function(Pointer<CHOOSEFONT> lpcf),
    int Function(Pointer<CHOOSEFONT> lpcf)>('ChooseFontW');

/// Creates a system-defined modeless Find dialog box that lets the user
/// specify a string to search for and options to use when searching for
/// text in a document.
///
/// ```c
/// HWND FindTextW(
///   LPFINDREPLACEW Arg1
/// );
/// ```
/// {@category comdlg32}
final FindText = _comdlg32.lookupFunction<
    IntPtr Function(Pointer<FINDREPLACE> Arg1),
    int Function(Pointer<FINDREPLACE> Arg1)>('FindTextW');

/// Creates an Open dialog box that lets the user specify the drive,
/// directory, and the name of a file or set of files to be opened.
///
/// ```c
/// BOOL GetOpenFileNameW(
///   LPOPENFILENAMEW Arg1
/// );
/// ```
/// {@category comdlg32}
final GetOpenFileName = _comdlg32.lookupFunction<
    Int32 Function(Pointer<OPENFILENAME> arg1),
    int Function(Pointer<OPENFILENAME> arg1)>('GetOpenFileNameW');

/// Creates a Save dialog box that lets the user specify the drive,
/// directory, and name of a file to save.
///
/// ```c
/// BOOL GetSaveFileNameW(
///   LPOPENFILENAMEW Arg1
/// );
/// ```
/// {@category comdlg32}
final GetSaveFileName = _comdlg32.lookupFunction<
    Int32 Function(Pointer<OPENFILENAME> arg1),
    int Function(Pointer<OPENFILENAME> arg1)>('GetSaveFileNameW');

/// Creates a system-defined modeless dialog box that lets the user specify
/// a string to search for and a replacement string, as well as options to
/// control the find and replace operations.
///
/// ```c
/// HWND ReplaceTextW(
///   LPFINDREPLACEW Arg1
/// );
/// ```
/// {@category comdlg32}
final ReplaceText = _comdlg32.lookupFunction<
    IntPtr Function(Pointer<FINDREPLACE> Arg1),
    int Function(Pointer<FINDREPLACE> Arg1)>('ReplaceTextW');
