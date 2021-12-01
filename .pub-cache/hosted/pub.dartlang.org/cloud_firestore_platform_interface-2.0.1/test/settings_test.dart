// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Settings', () {
    test('equality', () {
      expect(
          Settings(
            persistenceEnabled: true,
            host: 'foo bar',
            sslEnabled: true,
            cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
          ),
          equals(Settings(
            persistenceEnabled: true,
            host: 'foo bar',
            sslEnabled: true,
            cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
          )));
    });

    test('returns a map of settings', () {
      expect(Settings().asMap, <String, dynamic>{
        'persistenceEnabled': null,
        'host': null,
        'sslEnabled': null,
        'cacheSizeBytes': null
      });

      expect(
          Settings(
            persistenceEnabled: true,
            host: 'foo bar',
            sslEnabled: true,
            cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
          ).asMap,
          <String, dynamic>{
            'persistenceEnabled': true,
            'host': 'foo bar',
            'sslEnabled': true,
            'cacheSizeBytes': Settings.CACHE_SIZE_UNLIMITED,
          });
    });

    test('CACHE_SIZE_UNLIMITED returns -1', () {
      expect(Settings.CACHE_SIZE_UNLIMITED, equals(-1));
    });
  });
}
