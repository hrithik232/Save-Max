// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void runTimestampTests() {
  group('$Timestamp', () {
    FirebaseFirestore firestore;

    setUpAll(() async {
      firestore = FirebaseFirestore.instance;
    });

    Future<DocumentReference> initializeTest(String path) async {
      String prefixedPath = 'flutter-tests/$path';
      await firestore.doc(prefixedPath).delete();
      return firestore.doc(prefixedPath);
    }

    test('sets a $Timestamp & returns one', () async {
      DocumentReference doc = await initializeTest('timestamp');
      DateTime date = DateTime.utc(3000, 01, 01);

      await doc.set({'foo': Timestamp.fromDate(date)});
      DocumentSnapshot snapshot = await doc.get();
      Timestamp timestamp = snapshot.data()['foo'];
      expect(timestamp, isA<Timestamp>());
      expect(timestamp.millisecondsSinceEpoch,
          equals(date.millisecondsSinceEpoch));
    });

    test('updates a $Timestamp & returns', () async {
      DocumentReference doc = await initializeTest('geo-point-update');
      DateTime date = DateTime.utc(3000, 01, 02);
      await doc.set({'foo': DateTime.utc(3000, 01, 01)});
      await doc.update({'foo': date});
      DocumentSnapshot snapshot = await doc.get();
      Timestamp timestamp = snapshot.data()['foo'];
      expect(timestamp, isA<Timestamp>());
      expect(timestamp.millisecondsSinceEpoch,
          equals(date.millisecondsSinceEpoch));
    });
  });
}
