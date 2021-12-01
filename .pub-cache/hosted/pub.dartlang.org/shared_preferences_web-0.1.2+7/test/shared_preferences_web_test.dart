// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

@TestOn('chrome') // Uses web-only Flutter SDK

import 'dart:convert' show json;
import 'dart:html' as html;

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

const Map<String, dynamic> kTestValues = <String, dynamic>{
  'flutter.String': 'hello world',
  'flutter.Bool': true,
  'flutter.Int': 42,
  'flutter.Double': 3.14159,
  'flutter.StringList': <String>['foo', 'bar'],
};

void main() {
  group('SharedPreferencesPlugin', () {
    setUp(() {
      html.window.localStorage.clear();
    });

    test('registers itself', () {
      expect(SharedPreferencesStorePlatform.instance,
          isNot(isA<SharedPreferencesPlugin>()));
      SharedPreferencesPlugin.registerWith(null);
      expect(SharedPreferencesStorePlatform.instance,
          isA<SharedPreferencesPlugin>());
    });

    test('getAll', () async {
      final SharedPreferencesPlugin store = SharedPreferencesPlugin();
      expect(await store.getAll(), isEmpty);

      html.window.localStorage['flutter.testKey'] = '"test value"';
      html.window.localStorage['unprefixed_key'] = 'not a flutter value';
      final Map<String, Object> allData = await store.getAll();
      expect(allData, hasLength(1));
      expect(allData['flutter.testKey'], 'test value');
    });

    test('remove', () async {
      final SharedPreferencesPlugin store = SharedPreferencesPlugin();
      html.window.localStorage['flutter.testKey'] = '"test value"';
      expect(html.window.localStorage['flutter.testKey'], isNotNull);
      expect(await store.remove('flutter.testKey'), isTrue);
      expect(html.window.localStorage['flutter.testKey'], isNull);
      expect(
        () => store.remove('unprefixed'),
        throwsA(isA<FormatException>()),
      );
    });

    test('setValue', () async {
      final SharedPreferencesPlugin store = SharedPreferencesPlugin();
      for (String key in kTestValues.keys) {
        final dynamic value = kTestValues[key];
        expect(await store.setValue(key.split('.').last, key, value), true);
      }
      expect(html.window.localStorage.keys, hasLength(kTestValues.length));
      for (String key in html.window.localStorage.keys) {
        expect(html.window.localStorage[key], json.encode(kTestValues[key]));
      }

      // Check that generics are preserved.
      expect((await store.getAll())['flutter.StringList'], isA<List<String>>());

      // Invalid key format.
      expect(
        () => store.setValue('String', 'unprefixed', 'hello'),
        throwsA(isA<FormatException>()),
      );
    });

    test('clear', () async {
      final SharedPreferencesPlugin store = SharedPreferencesPlugin();
      html.window.localStorage['flutter.testKey1'] = '"test value"';
      html.window.localStorage['flutter.testKey2'] = '42';
      html.window.localStorage['unprefixed_key'] = 'not a flutter value';
      expect(await store.clear(), isTrue);
      expect(html.window.localStorage.keys.single, 'unprefixed_key');
    });
  });
}
