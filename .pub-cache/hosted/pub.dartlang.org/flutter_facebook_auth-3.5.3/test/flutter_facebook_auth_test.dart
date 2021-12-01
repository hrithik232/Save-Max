import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_auth_platform_interface/flutter_facebook_auth_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'src/data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('authentication', () {
    const MethodChannel channel = MethodChannel(
      'app.meedu/flutter_facebook_auth',
    );
    late FacebookAuth facebookAuth;
    late bool isLogged, isAutoLogAppEventsEnabled;

    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      isLogged = false;
      isAutoLogAppEventsEnabled = false;
      facebookAuth = FacebookAuth.getInstance();
      channel.setMockMethodCallHandler((MethodCall call) async {
        switch (call.method) {
          case "login":
            isLogged = true;
            return mockAccessToken;
          case "expressLogin":
            isLogged = true;
            return mockAccessToken;
          case "getAccessToken":
            return isLogged ? mockAccessToken : null;
          case "logOut":
            isLogged = false;
            return null;

          case "getUserData":
            // final String fields = call.arguments['fields'];
            final data = mockUserData;
            if (defaultTargetPlatform == TargetPlatform.android) {
              return jsonEncode(data);
            }
            return data;
          case "isAutoLogAppEventsEnabled":
            return isAutoLogAppEventsEnabled;

          case "updateAutoLogAppEventsEnabled":
            final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
            if (isIOS) {
              isAutoLogAppEventsEnabled = call.arguments['enabled'];
            }
        }
      });
    });

    test('login request', () async {
      expect(facebookAuth.isWebSdkInitialized, false);
      expect(await facebookAuth.accessToken, null);
      facebookAuth.webInitialize(appId: "1233443", cookie: true, xfbml: true, version: "v9.0");
      final result = await facebookAuth.login();
      expect(result.status, LoginStatus.success);
      expect(result.accessToken, isNotNull);
      expect(await facebookAuth.accessToken, isA<AccessToken>());
      final Map<String, dynamic> userData = await facebookAuth.getUserData();
      expect(userData.containsKey("email"), true);
      final FacebookPermissions? permissions = await facebookAuth.permissions;
      expect(permissions, isNotNull);
      expect(permissions!.granted.length > 0, true);
      expect(permissions.declined.length == 0, true);
      await facebookAuth.logOut();
      expect(await facebookAuth.accessToken, null);
    });

    test('express login', () async {
      expect(await facebookAuth.accessToken, null);
      final result = await facebookAuth.expressLogin();
      expect(result.status, LoginStatus.success);
    });

    test('test singleton', () async {
      expect(await FacebookAuth.i.accessToken, null);
    });

    test('autoLogAppEventsEnabled', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      expect(await facebookAuth.isAutoLogAppEventsEnabled, false);
      await facebookAuth.autoLogAppEventsEnabled(true);
      expect(await facebookAuth.isAutoLogAppEventsEnabled, true);
    });
  });
}
