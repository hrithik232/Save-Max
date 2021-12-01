// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Helpful utilities

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'constants.dart';
import 'kernel32.dart';
import 'shell32.dart';
import 'structs.g.dart';
import 'types.dart';

/// Sets up a WinMain function with all the relevant information.
///
/// Add the following line to your command line app:
/// ```dart
/// void main() => initApp(winMain);
/// ```
///
/// Now you can declare a winMain function as:
/// ```dart
/// void winMain(int hInstance, List<String> args, int nShowCmd) {
/// ...
/// }
/// ```
void initApp(Function winMain) {
  final nArgs = calloc<Int32>();
  final args = <String>[];
  final lpStartupInfo = calloc<STARTUPINFO>();

  // Parse command line args using Win32 functions, to reduce ceremony in the
  // app that uses this.
  final szArgList = CommandLineToArgvW(GetCommandLine(), nArgs);
  for (var i = 0; i < nArgs.value; i++) {
    args.add(szArgList[i].toDartString());
  }
  LocalFree(szArgList.address);

  final hInstance = GetModuleHandle(nullptr);
  GetStartupInfo(lpStartupInfo);
  try {
    winMain(
        hInstance,
        args,
        lpStartupInfo.ref.dwFlags & STARTF_USESHOWWINDOW == STARTF_USESHOWWINDOW
            ? lpStartupInfo.ref.wShowWindow
            : SW_SHOWDEFAULT);
  } finally {
    free(nArgs);
    free(lpStartupInfo);
  }
}

/// Detects whether the Windows Runtime is available by attempting to open its
/// core library.
bool isWindowsRuntimeAvailable() {
  try {
    DynamicLibrary.open('api-ms-win-core-winrt-l1-1-0.dll');
    // ignore: avoid_catching_errors
  } on ArgumentError {
    return false;
  }

  return true;
}

/// Converts a Dart string to a natively-allocated string.
///
/// The receiver is responsible for disposing its memory, typically by calling
/// [free] when it has been used.
LPWSTR TEXT(String string) => string.toNativeUtf16();

/// Allocates memory for a Unicode string and returns a pointer.
///
/// The parameter indicates how many characters should be allocated. The
/// receiver is responsible for disposing the memory allocated, typically by
/// calling [free] when it is no longer required.
LPWSTR wsalloc(int wChars) => calloc<WCHAR>(wChars).cast();

/// Frees allocated memory.
///
/// [calloc.free] and [malloc.free] do the same thing, so this works regardless
/// of whether memory was zero-allocated on creation or not.
void free(Pointer pointer) => calloc.free(pointer);
