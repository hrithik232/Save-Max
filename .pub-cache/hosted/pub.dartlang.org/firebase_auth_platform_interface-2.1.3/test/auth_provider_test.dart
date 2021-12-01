// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth_platform_interface/src/auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String kMockProviderId = 'id-1';
  group('$AuthProvider', () {
    group('Constructor', () {
      test('creates instance of [AuthProvider] ', () {
        final authProvider = TestAuthProvider(null);
        expect(authProvider, isA<TestAuthProvider>());
        expect(authProvider.providerId, isNull);
      });

      test('sets providerId with given value', () {
        TestAuthProvider authProvider = TestAuthProvider(kMockProviderId);
        expect(authProvider.providerId, equals(kMockProviderId));
      });
    });

    group('toString', () {
      test('returns correct string when providerId is set', () {
        TestAuthProvider authProvider = TestAuthProvider(kMockProviderId);
        expect(authProvider.toString(),
            equals('AuthProvider(providerId: $kMockProviderId)'));
      });

      test('returns correct string when providerId is null ', () {
        TestAuthProvider authProvider = TestAuthProvider(null);
        expect(
            authProvider.toString(), equals('AuthProvider(providerId: null)'));
      });
    });
  });
}

class TestAuthProvider extends AuthProvider {
  TestAuthProvider(String providerId) : super(providerId);
}
