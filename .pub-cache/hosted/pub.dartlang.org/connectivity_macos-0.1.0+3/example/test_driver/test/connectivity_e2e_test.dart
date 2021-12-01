// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';

Future<void> main() async {
  final FlutterDriver driver = await FlutterDriver.connect();
  final String result =
      await driver.requestData(null, timeout: const Duration(minutes: 1));
  await driver.close();
  exit(result == 'pass' ? 0 : 1);
}
