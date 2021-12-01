// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

void main() {
  TestPhoneAuthProvider phoneAuthProvider;
  final String kMockProviderId = 'phone';
  setUpAll(() {
    phoneAuthProvider = TestPhoneAuthProvider();
  });

  group('$PhoneAuthProvider', () {
    test('Constructor', () {
      expect(phoneAuthProvider, isA<PhoneAuthProvider>());
    });

    test('PhoneAuthProvider.PHONE_SIGN_IN_METHOD', () {
      expect(PhoneAuthProvider.PHONE_SIGN_IN_METHOD, isA<String>());
      expect(PhoneAuthProvider.PHONE_SIGN_IN_METHOD, equals(kMockProviderId));
    });

    test('PhoneAuthProvider.PROVIDER_ID', () {
      expect(PhoneAuthProvider.PROVIDER_ID, isA<String>());
      expect(PhoneAuthProvider.PROVIDER_ID, equals(kMockProviderId));
    });

    group('PhoneAuthProvider.credential()', () {
      final String kMockVerificationId = 'test-verification-id';
      final String kMockSmsCode = 'test-sms-code';
      test('creates a new [PhoneAuthCredential]', () {
        final result = PhoneAuthProvider.credential(
            verificationId: kMockVerificationId, smsCode: kMockSmsCode);

        expect(result, isA<AuthCredential>());
        expect(result.token, isNull);
        expect(result.providerId, equals(kMockProviderId));
        expect(result.signInMethod, equals(kMockProviderId));
      });

      test('throws [AssertionError] when verificationId is null', () {
        expect(
            () => PhoneAuthProvider.credential(
                verificationId: null, smsCode: kMockSmsCode),
            throwsAssertionError);
      });

      test('throws [AssertionError] when smsCode is null', () {
        expect(
            () => PhoneAuthProvider.credential(
                verificationId: kMockVerificationId, smsCode: null),
            throwsAssertionError);
      });
    });
  });
}

class TestPhoneAuthProvider extends PhoneAuthProvider {
  TestPhoneAuthProvider() : super();
}
