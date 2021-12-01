// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

/// Interface that defines the required continue/state URL with optional
/// Android and iOS bundle identifiers.
class ActionCodeSettings {
  // ignore: public_member_api_docs
  @protected
  ActionCodeSettings({
    @Deprecated("Deprecated in favor of using named args instead ([androidPackageName], [androidMinimumVersion], [androidInstallApp])")
        // ignore: deprecated_member_use_from_same_package
        this.android,
    this.androidPackageName,
    this.androidMinimumVersion,
    this.androidInstallApp,
    this.dynamicLinkDomain,
    this.handleCodeInApp,
    @Deprecated("Deprecated in favor of using named args instead ([iOSBundleId])")
        // ignore: deprecated_member_use_from_same_package
        this.iOS,
    this.iOSBundleId,
    @required
        this.url,
  }) : assert(url != null);

  @Deprecated(
      "Deprecated in favor of using named args instead ([androidPackageName], [androidMinimumVersion], [androidInstallApp])")
  // ignore: public_member_api_docs
  Map<String, dynamic> android;

  /// The Android package name of the application to open when the URL is pressed.
  final String androidPackageName;

  /// The minimum app version which must be installed on the device.
  ///
  /// This argument is only set if [androidPackageName] is also set. If the user
  /// has the application on the device but it is a lower version number than the
  /// one specified they will be taken to the Play Store to upgrade the application.
  final String androidMinimumVersion;

  /// Whether or not the user should be automatically prompted to install the app
  /// via the Play Store if it is not already installed.
  final bool androidInstallApp;

  /// The iOS app to open if it is installed on the device.
  final String iOSBundleId;

  /// Sets an optional Dynamic Link domain.
  final String dynamicLinkDomain;

  /// The default is false. When true, the action code link will be sent
  /// as a Universal Link or Android App Link and will be opened by the
  /// app if installed.
  final bool handleCodeInApp;

  @Deprecated("Deprecated in favor of using named args instead ([iOSBundleId])")
  // ignore: public_member_api_docs
  Map<String, dynamic> iOS;

  /// Sets the link continue/state URL
  final String url;

  /// Returns the current instance as a [Map].
  Map<String, dynamic> asMap() {
    // ignore: deprecated_member_use_from_same_package
    android ??= {};
    // ignore: deprecated_member_use_from_same_package
    iOS ??= {};

    Map<String, dynamic> androidMap;
    Map<String, dynamic> iOSMap;

    // ignore: deprecated_member_use_from_same_package
    if (androidPackageName != null || android['packageName'] != null) {
      androidMap = {};
      androidMap['packageName'] =
          // ignore: deprecated_member_use_from_same_package
          androidPackageName ?? android['packageName'].toString();
      androidMap['minimumVersion'] =
          // ignore: deprecated_member_use_from_same_package
          androidMinimumVersion ?? android['minimumVersion']?.toString();
      androidMap['installApp'] = androidInstallApp;

      // ignore: deprecated_member_use_from_same_package
      if (androidMap['installApp'] == null && android['installApp'] is bool) {
        // ignore: deprecated_member_use_from_same_package
        androidMap['installApp'] = android['installApp'];
      }
    }

    // ignore: deprecated_member_use_from_same_package
    if (iOSBundleId != null || iOS['bundleId'] != null) {
      iOSMap = {};
      // ignore: deprecated_member_use_from_same_package
      iOSMap['bundleId'] = iOSBundleId ?? iOS['bundleId'].toString();
    }

    return <String, dynamic>{
      'url': url,
      'dynamicLinkDomain': dynamicLinkDomain,
      'handleCodeInApp': handleCodeInApp,
      'android': androidMap,
      'iOS': iOSMap,
    };
  }

  @override
  String toString() {
    return '$ActionCodeSettings($asMap)';
  }
}
