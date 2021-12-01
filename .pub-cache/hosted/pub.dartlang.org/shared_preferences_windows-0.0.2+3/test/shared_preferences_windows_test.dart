// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';

void main() {
  MemoryFileSystem fileSystem;
  PathProviderWindows pathProvider;

  setUp(() {
    fileSystem = MemoryFileSystem.test();
    pathProvider = FakePathProviderWindows();
  });

  tearDown(() {});

  Future<String> _getFilePath() async {
    final directory = await pathProvider.getApplicationSupportPath();
    return path.join(directory, 'shared_preferences.json');
  }

  _writeTestFile(String value) async {
    fileSystem.file(await _getFilePath())
      ..createSync(recursive: true)
      ..writeAsStringSync(value);
  }

  Future<String> _readTestFile() async {
    return fileSystem.file(await _getFilePath()).readAsStringSync();
  }

  SharedPreferencesWindows _getPreferences() {
    var prefs = SharedPreferencesWindows();
    prefs.fs = fileSystem;
    prefs.pathProvider = pathProvider;
    return prefs;
  }

  test('getAll', () async {
    await _writeTestFile('{"key1": "one", "key2": 2}');
    var prefs = _getPreferences();

    var values = await prefs.getAll();
    expect(values, hasLength(2));
    expect(values['key1'], 'one');
    expect(values['key2'], 2);
  });

  test('remove', () async {
    await _writeTestFile('{"key1":"one","key2":2}');
    var prefs = _getPreferences();

    await prefs.remove('key2');

    expect(await _readTestFile(), '{"key1":"one"}');
  });

  test('setValue', () async {
    await _writeTestFile('{}');
    var prefs = _getPreferences();

    await prefs.setValue('', 'key1', 'one');
    await prefs.setValue('', 'key2', 2);

    expect(await _readTestFile(), '{"key1":"one","key2":2}');
  });

  test('clear', () async {
    await _writeTestFile('{"key1":"one","key2":2}');
    var prefs = _getPreferences();

    await prefs.clear();
    expect(await _readTestFile(), '{}');
  });
}

/// Fake implementation of PathProviderWindows that returns hard-coded paths,
/// allowing tests to run on any platform.
///
/// Note that this should only be used with an in-memory filesystem, as the
/// path it returns is a root path that does not actually exist on Windows.
class FakePathProviderWindows extends PathProviderPlatform
    implements PathProviderWindows {
  VersionInfoQuerier versionInfoQuerier;

  @override
  Future<String> getApplicationSupportPath() async => r'C:\appsupport';

  @override
  Future<String> getTemporaryPath() async => null;

  @override
  Future<String> getLibraryPath() async => null;

  @override
  Future<String> getApplicationDocumentsPath() async => null;

  @override
  Future<String> getDownloadsPath() async => null;

  @override
  Future<String> getPath(String folderID) async => null;
}
