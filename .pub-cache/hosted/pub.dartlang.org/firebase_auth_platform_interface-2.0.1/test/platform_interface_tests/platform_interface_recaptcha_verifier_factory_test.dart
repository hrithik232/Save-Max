// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  group('$RecaptchaVerifierFactoryPlatform()', () {
    TestRecaptchaVerifierFactoryPlatform recaptchaVerifierFactoryPlatform;

    setUpAll(() async {
      recaptchaVerifierFactoryPlatform = TestRecaptchaVerifierFactoryPlatform();
    });

    test('Constructor', () {
      expect(recaptchaVerifierFactoryPlatform,
          isA<RecaptchaVerifierFactoryPlatform>());
      expect(recaptchaVerifierFactoryPlatform, isA<PlatformInterface>());
    });

    group('set.instance', () {
      test('sets current instance', () {
        try {
          RecaptchaVerifierFactoryPlatform.instance =
              recaptchaVerifierFactoryPlatform;
        } catch (_) {
          fail('thrown an unexpected error');
        }
      });

      test('throws an [AssertionError] exception when instance is null', () {
        expect(() => RecaptchaVerifierFactoryPlatform.instance = null,
            throwsAssertionError);
      });
    });

    test('get.instance', () {
      try {
        RecaptchaVerifierFactoryPlatform.instance =
            recaptchaVerifierFactoryPlatform;
        final result = RecaptchaVerifierFactoryPlatform.instance;
        expect(result, isA<RecaptchaVerifierFactoryPlatform>());
      } catch (_) {
        fail('thrown an unexpected error');
      }
    });

    group('verifyExtends()', () {
      test('calls successfully', () {
        try {
          RecaptchaVerifierFactoryPlatform.verifyExtends(
              recaptchaVerifierFactoryPlatform);
          return;
        } catch (_) {
          fail('thrown an unexpected exception');
        }
      });

      test('throws an [AssertionError] exception when instance is null', () {
        expect(() => RecaptchaVerifierFactoryPlatform.verifyExtends(null),
            throwsAssertionError);
      });
    });

    test('throws if getDelegate()', () async {
      try {
        await recaptchaVerifierFactoryPlatform.getDelegate();
      } on UnimplementedError catch (e) {
        expect(e.message, equals('getDelegate() is not implemented'));
        return;
      }
      fail('Should have thrown an [UnimplementedError]');
    });

    group('delegateFor()', () {
      test('accepts two arguments', () {
        try {
          recaptchaVerifierFactoryPlatform
              .delegateFor(container: 'test', parameters: <String, dynamic>{});
        } catch (_) {}
        return;
      });

      test('throws UnimplementedError error', () async {
        try {
          await recaptchaVerifierFactoryPlatform.delegateFor();
        } on UnimplementedError catch (e) {
          expect(e.message, equals('delegateFor() is not implemented'));
          return;
        }
        fail('Should have thrown an [UnimplementedError]');
      });
    });

    test('throws if type', () async {
      try {
        await recaptchaVerifierFactoryPlatform.type;
      } on UnimplementedError catch (e) {
        expect(e.message, equals('type is not implemented'));
        return;
      }
      fail('Should have thrown an [UnimplementedError]');
    });

    test('throws if clear()', () async {
      try {
        await recaptchaVerifierFactoryPlatform.clear();
      } on UnimplementedError catch (e) {
        expect(e.message, equals('clear() is not implemented'));
        return;
      }
      fail('Should have thrown an [UnimplementedError]');
    });

    test('throws if render()', () async {
      try {
        await recaptchaVerifierFactoryPlatform.render();
      } on UnimplementedError catch (e) {
        expect(e.message, equals('render() is not implemented'));
        return;
      }
      fail('Should have thrown an [UnimplementedError]');
    });

    test('throws if verify()', () async {
      try {
        await recaptchaVerifierFactoryPlatform.verify();
      } on UnimplementedError catch (e) {
        expect(e.message, equals('verify() is not implemented'));
        return;
      }
      fail('Should have thrown an [UnimplementedError]');
    });
  });
}

class TestRecaptchaVerifierFactoryPlatform
    extends RecaptchaVerifierFactoryPlatform {
  TestRecaptchaVerifierFactoryPlatform() : super();
}
