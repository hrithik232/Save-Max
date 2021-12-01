// Copyright 2019, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_info/device_info.dart';
import 'package:e2e/e2e.dart';

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();

  IosDeviceInfo iosInfo;
  AndroidDeviceInfo androidInfo;

  setUpAll(() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      iosInfo = await deviceInfoPlugin.iosInfo;
    } else if (Platform.isAndroid) {
      androidInfo = await deviceInfoPlugin.androidInfo;
    }
  });

  testWidgets('Can get non-null device model', (WidgetTester tester) async {
    if (Platform.isIOS) {
      expect(iosInfo.model, isNotNull);
    } else if (Platform.isAndroid) {
      expect(androidInfo.model, isNotNull);
    }
  });
}
