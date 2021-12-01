// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb, visibleForTesting;
import 'package:package_info_plus_linux/package_info_plus_linux.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';
import 'package:package_info_plus_windows/package_info_plus_windows.dart';

/// Application metadata. Provides application bundle information on iOS and
/// application package information on Android.
class PackageInfo {
  /// Constructs an instance with the given values for testing. [PackageInfo]
  /// instances constructed this way won't actually reflect any real information
  /// from the platform, just whatever was passed in at construction time.
  ///
  /// See [fromPlatform] for the right API to get a [PackageInfo]
  /// that's actually populated with real data.
  PackageInfo({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    this.buildSignature = '',
  });

  /// Disables the platform override in order to use a manually registered
  /// [PackageInfoPlatform] for testing purposes.
  /// See https://github.com/flutter/flutter/issues/52267 for more details.
  @visibleForTesting
  static set disablePackageInfoPlatformOverride(bool override) {
    _disablePlatformOverride = override;
  }

  static bool _disablePlatformOverride = false;
  static PackageInfoPlatform? __platform;

  // This is to manually endorse the Desktop plugins until automatic
  // registration of Dart plugins is implemented.
  // See https://github.com/flutter/flutter/issues/52267 for more details.
  static PackageInfoPlatform get _platform {
    if (__platform == null) {
      if (!_disablePlatformOverride && !kIsWeb) {
        if (Platform.isLinux) {
          __platform = PackageInfoLinux();
        } else if (Platform.isWindows) {
          __platform = PackageInfoWindows();
        }
      }
      __platform ??= PackageInfoPlatform.instance;
    }
    return __platform!;
  }

  static PackageInfo? _fromPlatform;

  /// Retrieves package information from the platform.
  /// The result is cached.
  static Future<PackageInfo> fromPlatform() async {
    if (_fromPlatform != null) {
      return _fromPlatform!;
    }

    final platformData = await _platform.getAll();
    _fromPlatform = PackageInfo(
      appName: platformData.appName,
      packageName: platformData.packageName,
      version: platformData.version,
      buildNumber: platformData.buildNumber,
      buildSignature: platformData.buildSignature,
    );
    return _fromPlatform!;
  }

  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  final String appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  final String packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  final String version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  final String buildNumber;

  /// The build signature. Empty string on iOS, signing key signature (hex) on Android.
  final String buildSignature;

  /// Initializes the application metadata with mock values for testing.
  ///
  /// If the singleton instance has been initialized already, it is overwritten.
  @visibleForTesting
  static void setMockInitialValues({
    required String appName,
    required String packageName,
    required String version,
    required String buildNumber,
    required String buildSignature,
  }) {
    _fromPlatform = PackageInfo(
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
      buildSignature: buildSignature,
    );
  }
}
