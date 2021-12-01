// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$GeoPoint', () {
    test('equality', () {
      expect(GeoPoint(-80, 0), equals(GeoPoint(-80, 0)));
      expect(GeoPoint(0, 0), equals(GeoPoint(0, 0)));
      expect(GeoPoint(0, 100), equals(GeoPoint(0, 100)));
    });

    test('throws if invalid values', () {
      expect(() => GeoPoint(-100, 0), throwsAssertionError);
      expect(() => GeoPoint(100, 0), throwsAssertionError);
      expect(() => GeoPoint(0, -190), throwsAssertionError);
      expect(() => GeoPoint(0, 190), throwsAssertionError);
    });
  });
}
