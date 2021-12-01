@TestOn('browser')

import 'dart:js' as js;
import 'package:flutter_facebook_auth_platform_interface/flutter_facebook_auth_platform_interface.dart';
import 'package:flutter_facebook_auth_web/flutter_facebook_auth_web.dart';

import 'package:flutter_test/flutter_test.dart';
import 'mock/mock_data.dart';
import 'mock/mock_interop.dart';

/// create a new instance of FacebookAuthPlugin with Mock Data
FlutterFacebookAuthPlugin getPlugin() => FlutterFacebookAuthPlugin();

void main() {
  group('init', () {
    test('not initialized', () async {
      final plugin = getPlugin();
      final initialized = plugin.isWebSdkInitialized;
      expect(initialized, false);
      final result = await plugin.login();
      expect(result.status == LoginStatus.failed, true);
    });

    test('is initialized', () {
      fbMock = FbMock();
      js.context['FB']['init'] = js.allowInterop((js.JsObject options) {});
      final plugin = getPlugin();
      plugin.webInitialize(
        appId: '1234',
        cookie: true,
        xfbml: true,
        version: 'v10',
      );
      final initialized = plugin.isWebSdkInitialized;
      expect(initialized, true);
    });
  });
  group('web authentication', () {
    late bool isLogged = false;
    setUp(
      () {
        fbMock = FbMock();
        js.context['FB']['init'] = js.allowInterop((js.JsObject options) {});
        js.context['FB']['login'] = js.allowInterop((js.JsFunction fn, _) {
          isLogged = true;
          fn.apply(
            [
              js.JsObject.jsify({
                'status': 'connected',
                'authResponse': MockData.accessToken,
              })
            ],
          );
        });

        js.context['FB']['logout'] = js.allowInterop((js.JsFunction fn) {
          isLogged = false;
          fn.apply(
            [js.JsObject.jsify({})],
          );
        });

        js.context['FB']['api'] = js.allowInterop((String request, js.JsFunction fn) {
          if (request == "/me/permissions") {
            fn.apply(
              [
                js.JsObject.jsify(MockData.permissions),
              ],
            );
          } else {
            fn.apply(
              [
                js.JsObject.jsify(MockData.userData),
              ],
            );
          }
        });

        js.context['FB']['getLoginStatus'] = js.allowInterop(
          (js.JsFunction fn) {
            if (isLogged) {
              fn.apply(
                [
                  js.JsObject.jsify({
                    'status': 'connected',
                    'authResponse': MockData.accessToken,
                  })
                ],
              );
            } else {
              fn.apply(
                [
                  js.JsObject.jsify({
                    'status': 'unknown',
                  }),
                ],
              );
            }
          },
        );
      },
    );
    test('login request', () async {
      final plugin = getPlugin();
      plugin.webInitialize(
        appId: '1234',
        cookie: true,
        xfbml: true,
        version: 'v10',
      );
      // check that the user is not logged
      expect(await plugin.accessToken, null);

      // make a login request
      final result = await plugin.login();
      // check the login sucessful
      expect(result.status, LoginStatus.success);
      expect(result.accessToken != null, true);

      // check the granted and declined permissions
      final FacebookPermissions? permissions = await plugin.permissions;
      expect(permissions, isNotNull);
      expect(permissions!.granted.length == 1, true);
      expect(permissions.declined.length == 1, true);

      // get the user data
      Map<String, dynamic> userData = await plugin.getUserData();
      expect(userData.containsKey('name'), true); // check the key name

      // check the logout
      await plugin.logOut();
      expect(await plugin.accessToken, null);
    });
  });
}
