// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

void main() {
  TestGithubAuthProvider githubAuthProvider;
  final String kMockProviderId = 'github.com';
  setUpAll(() {
    githubAuthProvider = TestGithubAuthProvider();
  });

  group('$GithubAuthProvider', () {
    test('Constructor', () {
      expect(githubAuthProvider, isA<GithubAuthProvider>());
    });

    test('GithubAuthProvider.GITHUB_SIGN_IN_METHOD', () {
      expect(GithubAuthProvider.GITHUB_SIGN_IN_METHOD, isA<String>());
      expect(GithubAuthProvider.GITHUB_SIGN_IN_METHOD, equals(kMockProviderId));
    });

    test('GithubAuthProvider.PROVIDER_ID', () {
      expect(GithubAuthProvider.PROVIDER_ID, isA<String>());
      expect(GithubAuthProvider.PROVIDER_ID, equals(kMockProviderId));
    });

    test('scopes', () {
      expect(githubAuthProvider.scopes, isA<List<String>>());
      expect(githubAuthProvider.scopes.length, 0);
    });

    test('parameters', () {
      expect(githubAuthProvider.parameters, isA<Object>());
    });

    group('addScope()', () {
      test('adds a new scope', () {
        String kMockScope = 'repo';
        final result = githubAuthProvider.addScope(kMockScope);

        expect(result, isA<GithubAuthProvider>());
        expect(result.scopes, isA<List<String>>());
        expect(result.scopes.length, 1);
        expect(result.scopes[0], equals(kMockScope));
      });

      test('throws [AssertionError] when scope is null', () {
        expect(() => githubAuthProvider.addScope(null), throwsAssertionError);
      });
    });

    group('setCustomParameters()', () {
      test('sets custom parameters', () {
        final Map<dynamic, dynamic> kCustomOAuthParameters = <dynamic, dynamic>{
          'allow_signup': 'false',
        };
        final result =
            githubAuthProvider.setCustomParameters(kCustomOAuthParameters);
        expect(result, isA<GithubAuthProvider>());
        expect(result.parameters['allow_signup'], isA<String>());
        expect(result.parameters['allow_signup'], equals('false'));
      });

      test('throws [AssertionError] when customOAuthParameters is null', () {
        expect(() => githubAuthProvider.setCustomParameters(null),
            throwsAssertionError);
      });
    });

    group('GithubAuthProvider.credential()', () {
      final String kMockAccessToken = 'test-token';
      test('creates a new [GithubAuthCredential]', () {
        final result = GithubAuthProvider.credential(kMockAccessToken);
        expect(result, isA<OAuthCredential>());
        expect(result.token, isNull);
        expect(result.idToken, isNull);
        expect(result.accessToken, kMockAccessToken);
        expect(result.providerId, equals(kMockProviderId));
        expect(result.signInMethod, equals(kMockProviderId));
      });

      test('throws [AssertionError] when accessToken is null', () {
        expect(() => GithubAuthProvider.credential(null), throwsAssertionError);
      });
    });
  });
}

class TestGithubAuthProvider extends GithubAuthProvider {
  TestGithubAuthProvider() : super();
}
