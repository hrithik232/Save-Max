// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@TestOn("chrome")
import 'package:firebase/firestore.dart' as web show FieldValue;
import 'package:cloud_firestore_web/src/field_value_factory_web.dart';
import 'package:cloud_firestore_web/src/field_value_web.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("$FieldValueFactoryWeb()", () {
    final factory = FieldValueFactoryWeb();

    test("arrayRemove", () {
      final FieldValueWeb actual = factory.arrayRemove([]);
      expect(actual.data, isInstanceOf<web.FieldValue>());
    });

    test("arrayUnion", () {
      final FieldValueWeb actual = factory.arrayUnion([]);
      expect(actual.data, isInstanceOf<web.FieldValue>());
    });

    test("delete", () {
      final FieldValueWeb actual = factory.delete();
      expect(actual.data, isInstanceOf<web.FieldValue>());
    });

    test("increment", () {
      final FieldValueWeb actualInt = factory.increment(1);
      expect(actualInt.data, isInstanceOf<web.FieldValue>());

      final FieldValueWeb actualDouble = factory.increment(1.25);
      expect(actualDouble.data, isInstanceOf<web.FieldValue>());
    });

    test("serverTimestamp", () {
      final FieldValueWeb actual = factory.serverTimestamp();
      expect(actual.data, isInstanceOf<web.FieldValue>());
    });
  });
}
