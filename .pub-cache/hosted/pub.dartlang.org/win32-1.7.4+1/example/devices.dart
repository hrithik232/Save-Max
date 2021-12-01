// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Finds physical volumes on the system

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

final volumeHandles = <int, String>{};

void displayVolumePaths(String volumeName) {
  var error = 0;

  // Could be arbitrarily long, but 4*MAX_PATH is a reasonable default.
  // More sophisticated solutions can be found online
  final pathNamePtr = allocate<Uint16>(count: MAX_PATH * 4).cast<Utf16>();
  final charCount = allocate<Uint32>();
  charCount.value = MAX_PATH;
  error = GetVolumePathNamesForVolumeName(
      Utf16.toUtf16(volumeName), pathNamePtr, charCount.value, charCount);

  if (error != 0) {
    if (charCount.value > 1) {
      for (final path in pathNamePtr.unpackStringArray(charCount.value)) {
        print(path);
      }
    } else {
      print('[none]');
    }
  } else {
    error = GetLastError();
    print('GetVolumePathNamesForVolumeName failed with error code $error');
  }

  free(pathNamePtr);
  free(charCount);
}

void main() {
  var error = 0;
  final volumeNamePtr = allocate<Uint16>(count: MAX_PATH).cast<Utf16>();

  final hFindVolume = FindFirstVolume(volumeNamePtr, MAX_PATH);
  if (hFindVolume == INVALID_HANDLE_VALUE) {
    error = GetLastError();
    print('FindFirstVolume failed with error code $error');
    return;
  }

  while (true) {
    final volumeName = volumeNamePtr.unpackString(MAX_PATH);

    //  Skip the \\?\ prefix and remove the trailing backslash.
    final shortVolumeName = volumeName.substring(4, volumeName.length - 1);
    final shortVolumeNamePtr = TEXT(shortVolumeName);

    final deviceName = allocate<Uint16>(count: MAX_PATH).cast<Utf16>();
    final charCount = QueryDosDevice(shortVolumeNamePtr, deviceName, MAX_PATH);

    if (charCount == 0) {
      error = GetLastError();
      print('QueryDosDevice failed with error code $error');
      break;
    }

    print('\nFound a device:\n${deviceName.unpackString(MAX_PATH)}');
    print('Volume name: $volumeName');
    print('Paths:');
    displayVolumePaths(volumeName);

    final success = FindNextVolume(hFindVolume, volumeNamePtr, MAX_PATH);
    if (success == 0) {
      error = GetLastError();
      if (error != ERROR_NO_MORE_FILES && error != ERROR_SUCCESS) {
        print('FindNextVolume failed with error code $error');
        break;
      } else {
        error = ERROR_SUCCESS;
        break;
      }
    }
    free(shortVolumeNamePtr);
  }
  free(volumeNamePtr);
  FindVolumeClose(hFindVolume);
}
