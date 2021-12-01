// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Simple example of calling WinRT APIs

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void main() {
  winrtInitialize();

  try {
    final object =
        CreateObject('Windows.Globalization.Calendar', IID_ICalendar);
    final calendar = ICalendar(object.cast());

    print('Windows Runtime demo. Calling Windows.Globalization.Calendar...\n');
    print('The year is ${calendar.Year}.');

    final systemPtr = allocate<IntPtr>();
    calendar.GetCalendarSystem(systemPtr);
    print('The calendar system is ${convertFromHString(systemPtr)}.');
    WindowsDeleteString(systemPtr.value);
    free(systemPtr);

    final dayPtr = allocate<IntPtr>();
    calendar.DayOfWeekAsFullSoloString(dayPtr);
    print('Today is ${convertFromHString(dayPtr)}.');
    WindowsDeleteString(systemPtr.value);
    free(dayPtr);

    free(object);

    if (calendar.IsDaylightSavingTime == 1) {
      print('Daylight Saving Time is in observance.');
    } else if (calendar.IsDaylightSavingTime == 0) {
      print('Daylight Savings Time is not in observance.');
    }
  } finally {
    winrtUninitialize();
  }
}
