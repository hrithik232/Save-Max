// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:async';

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore_platform_interface/src/method_channel/method_channel_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/method_channel/method_channel_query.dart';

import '../utils/test_common.dart';

void main() {
  initializeMethodChannel();
  MethodChannelQuery query;
  const Map<String, dynamic> kMockSnapshotMetadata = <String, dynamic>{
    "hasPendingWrites": false,
    "isFromCache": false,
  };
  const Map<String, dynamic> kMockSnapshotData = <String, dynamic>{
    "1": 2,
  };
  const Map<String, dynamic> kMockDocumentSnapshotDocument = <String, dynamic>{
    'path': 'foo/bar',
    'data': kMockSnapshotData,
    'metadata': [kMockSnapshotMetadata]
  };

  group("$MethodChannelQuery", () {
    setUpAll(() async {
      await Firebase.initializeApp(
        name: 'testApp',
        options: const FirebaseOptions(
          appId: '1:1234567890:ios:42424242424242',
          apiKey: '123',
          projectId: '123',
          messagingSenderId: '1234567890',
        ),
      );

      query = MethodChannelQuery(
          FirebaseFirestorePlatform.instance, '$kCollectionId/$kDocumentId',
          parameters: {
            'where': [],
            'orderBy': ['foo'],
            'startAt': null,
            'startAfter': null,
            'endAt': ['0'],
            'endBefore': null,
            'limit': null,
            'limitToLast': null
          },
          isCollectionGroupQuery: false);
    });

    test("endAtDocument()", () {
      List<List<dynamic>> orders = List.from([
        ['bar']
      ]);
      List<dynamic> values = [1];
      MethodChannelQuery q = query.endAtDocument(orders, values);

      expect(q, isNot(same(query)));
      expect(q.parameters['endAt'], equals([1]));
      expect(
          q.parameters['orderBy'],
          equals([
            ['bar']
          ]));
      expect(q.parameters['endBefore'], equals(null));
    });

    test("endAt()", () {
      List<List<dynamic>> fields = List.from([
        ['bar']
      ]);
      MethodChannelQuery q = query.endAt(
        fields,
      );

      expect(q, isNot(same(query)));
      expect(
          q.parameters['endAt'],
          equals([
            ['bar']
          ]));
      expect(q.parameters['endBefore'], equals(null));
    });

    test("endBeforeDocument()", () {
      List<List<dynamic>> orders = List.from([
        ['bar']
      ]);
      List<dynamic> values = [1];
      MethodChannelQuery q = query.endBeforeDocument(orders, values);

      expect(q, isNot(same(query)));
      expect(q.parameters['endAt'], equals(null));
      expect(
          q.parameters['orderBy'],
          equals([
            ['bar']
          ]));
      expect(q.parameters['endBefore'], equals([1]));
    });

    test("endBefore()", () {
      List<dynamic> fields = List.from(['bar']);
      MethodChannelQuery q = query.endBefore(fields);

      expect(q, isNot(same(query)));
      expect(q.parameters['endAt'], equals(null));
      expect(q.parameters['orderBy'], equals(['foo']));
      expect(q.parameters['endBefore'], equals(fields));
    });
    group("get()", () {
      setUp(() async {
        MethodChannelFirebaseFirestore.channel
            .setMockMethodCallHandler((MethodCall methodCall) async {
          switch (methodCall.method) {
            case 'Query#get':
              MethodChannelQuery query = methodCall.arguments['query'];
              if (query.path == 'foo/unknown') {
                throw PlatformException(
                    code: 'ERROR', details: {'code': 'UNKNOWN_PATH'});
              }

              return <String, dynamic>{
                'paths': <String>["${query.path}/0"],
                'documents': <dynamic>[kMockDocumentSnapshotDocument],
                'metadatas': <Map<String, dynamic>>[kMockSnapshotMetadata],
                'metadata': kMockSnapshotMetadata,
                'documentChanges': <dynamic>[
                  <String, dynamic>{
                    'oldIndex': -1,
                    'newIndex': 0,
                    'path': 'foo/bar',
                    'metadata': kMockSnapshotMetadata,
                    'type': 'DocumentChangeType.added',
                    'data': kMockDocumentSnapshotDocument['data'],
                  },
                ]
              };
            default:
              return null;
          }
        });
      });
      test("returns a [QuerySnapshotPlatform] instance", () async {
        final GetOptions getOptions = const GetOptions(source: Source.cache);
        QuerySnapshotPlatform snapshot = await query.get(getOptions);
        expect(snapshot, isA<QuerySnapshotPlatform>());
        expect(snapshot.docs.length, 1);
      });

      test("throws a [FirebaseException]", () async {
        MethodChannelQuery testQuery = MethodChannelQuery(
            FirebaseFirestorePlatform.instance, 'foo/unknown',
            parameters: {
              'where': [],
              'orderBy': [],
            },
            isCollectionGroupQuery: false);
        final GetOptions getOptions = const GetOptions(source: Source.cache);

        try {
          await testQuery.get(getOptions);
        } on FirebaseException catch (e) {
          expect(e.code, equals('UNKNOWN_PATH'));
          return;
        }
        fail("Should have thrown a [FirebaseException]");
      });
    });

    test("limit()", () {
      MethodChannelQuery q = query.limit(1);

      expect(q, isNot(same(query)));
      expect(q.parameters['limit'], equals(1));
    });
    test("limitToLast()", () {
      MethodChannelQuery q = query.limitToLast(1);

      expect(q, isNot(same(query)));
      expect(q.parameters['limitToLast'], equals(1));
    });

    test("orderBy()", () {
      List<List<dynamic>> orders = List.from([
        ['bar']
      ]);
      MethodChannelQuery q = query.orderBy(orders);
      expect(q, isNot(same(query)));
      expect(
          q.parameters['orderBy'],
          equals([
            ['bar']
          ]));
    });

    group("snapshots()", () {
      int handleId;
      final List<MethodCall> log = <MethodCall>[];
      setUp(() {
        log.clear();
        handleId = nextMockHandleId;

        handleMethodCall((MethodCall call) async {
          log.add(call);
          if (call.method == "Query#addSnapshotListener") {
            await Future<void>.delayed(Duration.zero);
          }
        });
      });

      test('returns a [Stream]', () {
        Stream<QuerySnapshotPlatform> stream = query.snapshots();
        expect(stream, isA<Stream<QuerySnapshotPlatform>>());
      });

      test('onListen and onCancel invokes native methods with correct args',
          () async {
        Stream<QuerySnapshotPlatform> stream = query.snapshots();
        final StreamSubscription<QuerySnapshotPlatform> subscription =
            await stream.listen((QuerySnapshotPlatform snapshot) {});

        await subscription.cancel();
        await Future<void>.delayed(Duration.zero);
        expect(log[0].method, 'Query#addSnapshotListener');
        expect(log[1].method, 'Firestore#removeListener');
        expect(log[0].arguments, <String, dynamic>{
          'query': isInstanceOf<MethodChannelQuery>(),
          'handle': handleId,
          'firestore': isInstanceOf<FirebaseFirestorePlatform>(),
          'includeMetadataChanges': false,
        });
        expect(log[1].arguments, <String, dynamic>{'handle': handleId});
      });
    });

    test('sets a default value for includeMetadataChanges', () {
      try {
        query.snapshots();
      } on AssertionError catch (_) {
        fail("Default value not set for includeMetadataChanges");
      }
    });
    test('should throw if includeMetadataChanges is null', () {
      expect(() => query.snapshots(includeMetadataChanges: null),
          throwsAssertionError);
    });

    test("startAfterDocument()", () {
      List<List<dynamic>> orders = List.from([
        ['bar']
      ]);
      List<dynamic> values = [1];
      MethodChannelQuery q = query.startAfterDocument(orders, values);

      expect(q, isNot(same(query)));
      expect(q.parameters['startAt'], equals(null));
      expect(
          q.parameters['orderBy'],
          equals([
            ['bar']
          ]));
      expect(q.parameters['startAfter'], equals([1]));
    });
    test("startAfter()", () {
      List<dynamic> fields = List.from(['bar']);
      MethodChannelQuery q = query.startAfter(fields);

      expect(q, isNot(same(query)));
      expect(q.parameters['startAt'], equals(null));
      expect(q.parameters['orderBy'], equals(['foo']));
      expect(q.parameters['startAfter'], equals(fields));
    });
    test("startAtDocument()", () {
      List<List<dynamic>> orders = List.from([
        ['bar']
      ]);
      List<dynamic> values = [1];
      MethodChannelQuery q = query.startAtDocument(orders, values);

      expect(q, isNot(same(query)));
      expect(q.parameters['startAt'], equals([1]));
      expect(
          q.parameters['orderBy'],
          equals([
            ['bar']
          ]));
      expect(q.parameters['startAfter'], equals(null));
    });
    test("startAt()", () {
      List<dynamic> fields = List.from(['bar']);
      MethodChannelQuery q = query.startAt(fields);

      expect(q, isNot(same(query)));
      expect(q.parameters['startAt'], equals(['bar']));
      expect(q.parameters['startAfter'], equals(null));
    });

    test("where()", () {
      List<List<dynamic>> conditions = List.from([
        ['bar']
      ]);
      MethodChannelQuery q = query.where(conditions);

      expect(q, isNot(same(query)));
      expect(
          q.parameters['where'],
          equals([
            ['bar']
          ]));
    });
  });
}
