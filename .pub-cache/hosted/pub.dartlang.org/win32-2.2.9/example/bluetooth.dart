// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Shows retrieval of various information from the high-level monitor
// configuration API.

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

String addressAsString(List<int> bluetoothAddress) => bluetoothAddress
    .map((byte) => byte.toRadixString(16).toUpperCase().padLeft(2, '0'))
    .join(':');

List<int> findBluetoothRadios() {
  final findRadioParams = calloc<BLUETOOTH_FIND_RADIO_PARAMS>()
    ..ref.dwSize = sizeOf<BLUETOOTH_FIND_RADIO_PARAMS>();

  final radioHandles = <int>[];

  final hRadio = calloc<HANDLE>();

  try {
    final hEnum = BluetoothFindFirstRadio(findRadioParams, hRadio);
    if (hEnum == NULL) {
      print('No radios found.');
    } else {
      radioHandles.add(hRadio.value);
      print('Found a radio with handle: ${hRadio.value.toHexString(32)}');

      while (BluetoothFindNextRadio(hEnum, hRadio) == TRUE) {
        radioHandles.add(hRadio.value);
      }
      BluetoothFindRadioClose(hEnum);
    }
    return radioHandles;
  } finally {
    free(findRadioParams);
    free(hRadio);
  }
}

void findRadioInfo(int hRadio) {
  final radioInfo = calloc<BLUETOOTH_RADIO_INFO>()
    ..ref.dwSize = sizeOf<BLUETOOTH_RADIO_INFO>();

  try {
    final res = BluetoothGetRadioInfo(hRadio, radioInfo);
    if (res == ERROR_SUCCESS) {
      final bluetoothAddress = addressAsString(radioInfo.ref.address.rgBytes);
      print('Radio name: ${radioInfo.ref.szName}');
      print('Radio address: $bluetoothAddress');
    }
  } finally {
    free(radioInfo);
  }
}

void findBluetoothDevices() {
  final params = calloc<BLUETOOTH_DEVICE_SEARCH_PARAMS>()
    ..ref.dwSize = sizeOf<BLUETOOTH_DEVICE_SEARCH_PARAMS>();
  final info = calloc<BLUETOOTH_DEVICE_INFO>();

  try {
    final firstDeviceHandle = BluetoothFindFirstDevice(params, info);

    if (firstDeviceHandle != NULL) {
      print('Found device: ${info.ref.szName}');
      while (BluetoothFindNextDevice(firstDeviceHandle, info) == TRUE) {
        print('Found device: ${info.ref.szName}');
      }
      BluetoothFindDeviceClose(firstDeviceHandle);
    } else {
      print('No devices found.');
    }
  } finally {
    free(params);
    free(info);
  }
}

void main() {
  final radioHandles = findBluetoothRadios();

  for (final hRadio in radioHandles) {
    findRadioInfo(hRadio);

    if (BluetoothIsDiscoverable(hRadio) == TRUE) {
      print('Bluetooth radio is discoverable.');
    } else {
      print('Bluetooth radio is not discoverable.');
    }
  }

  findBluetoothDevices();
}
