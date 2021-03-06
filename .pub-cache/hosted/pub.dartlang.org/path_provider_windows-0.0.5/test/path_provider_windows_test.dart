// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

// A fake VersionInfoQuerier that just returns preset responses.
class FakeVersionInfoQuerier implements VersionInfoQuerier {
  FakeVersionInfoQuerier(this.responses);

  final Map<String, String> responses;

  getStringValue(Pointer<Uint8> versionInfo, key) => responses[key];
}

void main() {
  test('getTemporaryPath', () async {
    final pathProvider = PathProviderWindows();
    expect(await pathProvider.getTemporaryPath(), contains(r'C:\'));
  }, skip: !Platform.isWindows);

  test('getApplicationSupportPath with no version info', () async {
    final pathProvider = PathProviderWindows();
    pathProvider.versionInfoQuerier =
        FakeVersionInfoQuerier(<String, String>{});
    final path = await pathProvider.getApplicationSupportPath();
    expect(path, contains(r'C:\'));
    expect(path, contains(r'AppData'));
    // The last path component should be the executable name.
    expect(path, endsWith(r'flutter_tester'));
  }, skip: !Platform.isWindows);

  test('getApplicationSupportPath with full version info', () async {
    final pathProvider = PathProviderWindows();
    pathProvider.versionInfoQuerier = FakeVersionInfoQuerier(<String, String>{
      'CompanyName': 'A Company',
      'ProductName': 'Amazing App',
    });
    final path = await pathProvider.getApplicationSupportPath();
    expect(path, isNotNull);
    if (path != null) {
      expect(path, endsWith(r'AppData\Roaming\A Company\Amazing App'));
      expect(Directory(path).existsSync(), isTrue);
    }
  }, skip: !Platform.isWindows);

  test('getApplicationSupportPath with missing company', () async {
    final pathProvider = PathProviderWindows();
    pathProvider.versionInfoQuerier = FakeVersionInfoQuerier(<String, String>{
      'ProductName': 'Amazing App',
    });
    final path = await pathProvider.getApplicationSupportPath();
    expect(path, isNotNull);
    if (path != null) {
      expect(path, endsWith(r'AppData\Roaming\Amazing App'));
      expect(Directory(path).existsSync(), isTrue);
    }
  }, skip: !Platform.isWindows);

  test('getApplicationSupportPath with problematic values', () async {
    final pathProvider = PathProviderWindows();
    pathProvider.versionInfoQuerier = FakeVersionInfoQuerier(<String, String>{
      'CompanyName': r'A <Bad> Company: Name.',
      'ProductName': r'A"/Terrible\|App?*Name',
    });
    final path = await pathProvider.getApplicationSupportPath();
    expect(path, isNotNull);
    if (path != null) {
      expect(
          path,
          endsWith(r'AppData\Roaming\'
              r'A _Bad_ Company_ Name\'
              r'A__Terrible__App__Name'));
      expect(Directory(path).existsSync(), isTrue);
    }
  }, skip: !Platform.isWindows);

  test('getApplicationSupportPath with a completely invalid company', () async {
    final pathProvider = PathProviderWindows();
    pathProvider.versionInfoQuerier = FakeVersionInfoQuerier(<String, String>{
      'CompanyName': r'..',
      'ProductName': r'Amazing App',
    });
    final path = await pathProvider.getApplicationSupportPath();
    expect(path, isNotNull);
    if (path != null) {
      expect(path, endsWith(r'AppData\Roaming\Amazing App'));
      expect(Directory(path).existsSync(), isTrue);
    }
  }, skip: !Platform.isWindows);

  test('getApplicationSupportPath with very long app name', () async {
    final pathProvider = PathProviderWindows();
    final truncatedName = 'A' * 255;
    pathProvider.versionInfoQuerier = FakeVersionInfoQuerier(<String, String>{
      'CompanyName': 'A Company',
      'ProductName': truncatedName * 2,
    });
    final path = await pathProvider.getApplicationSupportPath();
    expect(path, endsWith('\\$truncatedName'));
    // The directory won't exist, since it's longer than MAXPATH, so don't check
    // that here.
  }, skip: !Platform.isWindows);

  test('getApplicationDocumentsPath', () async {
    final pathProvider = PathProviderWindows();
    final path = await pathProvider.getApplicationDocumentsPath();
    expect(path, contains(r'C:\'));
    expect(path, contains(r'Documents'));
  }, skip: !Platform.isWindows);

  test('getDownloadsPath', () async {
    final pathProvider = PathProviderWindows();
    final path = await pathProvider.getDownloadsPath();
    expect(path, contains(r'C:\'));
    expect(path, contains(r'Downloads'));
  }, skip: !Platform.isWindows);
}
