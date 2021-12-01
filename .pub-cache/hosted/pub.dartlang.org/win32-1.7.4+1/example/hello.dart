// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Basic Petzoldian "hello world" Win32 app

import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'package:win32/win32.dart';

final hInstance = GetModuleHandle(nullptr);

int mainWindowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;

    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      final rect = RECT.allocate();
      final msg = TEXT('Hello, Dart!');

      GetClientRect(hWnd, rect.addressOf);
      DrawText(
          hdc, msg, -1, rect.addressOf, DT_CENTER | DT_VCENTER | DT_SINGLELINE);
      EndPaint(hWnd, ps.addressOf);

      free(ps.addressOf);
      free(rect.addressOf);
      free(msg);

      return 0;
  }
  return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

void main() {
  // Register the window class.

  final className = TEXT('Sample Window Class');

  final wc = WNDCLASS.allocate();
  wc.style = CS_HREDRAW | CS_VREDRAW;
  wc.lpfnWndProc = Pointer.fromFunction<WindowProc>(mainWindowProc, 0);
  wc.hInstance = hInstance;
  wc.lpszClassName = className;
  wc.hCursor = LoadCursor(NULL, IDC_ARROW);
  wc.hbrBackground = GetStockObject(WHITE_BRUSH);
  RegisterClass(wc.addressOf);

  // Create the window.

  final hWnd = CreateWindowEx(
      0, // Optional window styles.
      className, // Window class
      TEXT('Dart Native Win32 window'), // Window caption
      WS_OVERLAPPEDWINDOW, // Window style

      // Size and position
      CW_USEDEFAULT,
      CW_USEDEFAULT,
      CW_USEDEFAULT,
      CW_USEDEFAULT,
      NULL, // Parent window
      NULL, // Menu
      hInstance, // Instance handle
      nullptr // Additional application data
      );

  if (hWnd == 0) {
    final error = GetLastError();
    throw WindowsException(HRESULT_FROM_WIN32(error));
  }

  ShowWindow(hWnd, SW_SHOWNORMAL);
  UpdateWindow(hWnd);

  // Run the message loop.

  final msg = MSG.allocate();
  while (GetMessage(msg.addressOf, NULL, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
}
