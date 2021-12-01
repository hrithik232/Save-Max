// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of firebase_core;

/// Represents a single Firebase app instance.
///
/// You can get an instance by calling [Firebase.app()].
class FirebaseApp {
  FirebaseAppPlatform _delegate;

  /// A [FirebaseApp] instance can only be accessed from a call to `app()` on
  /// [FirebaseCore].
  ///
  /// This constructor ensures that the delegate instance it is
  /// constructed with is one which extends [FirebaseAppPlatform].
  FirebaseApp._(this._delegate) {
    FirebaseAppPlatform.verifyExtends(_delegate);
  }

  /// Deletes this app and frees up system resources.
  ///
  /// Once deleted, any plugin functionality using this app instance will throw
  /// an error.
  Future<void> delete() async {
    await _delegate.delete();
  }

  @Deprecated("Deprecated in favor of Firebase.app()")
  // ignore: public_member_api_docs
  static FirebaseApp appNamed(String name) {
    return Firebase.app(name);
  }

  @Deprecated("Deprecated in favor of Firebase.apps")
  // ignore: public_member_api_docs
  static Future<List<FirebaseApp>> allApps() async {
    return Firebase.apps;
  }

  @Deprecated("Deprecated in favor of Firebase.initializeApp()")
  // ignore: public_member_api_docs
  static Future<FirebaseApp> configure({
    @required String name,
    @required FirebaseOptions options,
  }) {
    return Firebase.initializeApp(name: name, options: options);
  }

  @Deprecated("Deprecated in favor of Firebase.app()")
  // ignore: public_member_api_docs
  static FirebaseApp get instance {
    return Firebase.app();
  }

  @Deprecated("Deprecated in favor of defaultFirebaseAppName")
  // ignore: public_member_api_docs
  static String get defaultAppName {
    return defaultFirebaseAppName;
  }

  /// The name of this [FirebaseApp].
  String get name => _delegate.name;

  /// The [FirebaseOptions] this app was created with.
  FirebaseOptions get options => _delegate.options;

  /// Returns whether automatic data collection is enabled or disabled for this
  /// app.
  ///
  /// Automatic data collection can be enabled or disabled via `setAutomaticDataCollectionEnabled`.
  bool get isAutomaticDataCollectionEnabled =>
      _delegate.isAutomaticDataCollectionEnabled;

  /// Sets whether automatic data collection is enabled or disabled for this
  /// app.
  ///
  /// To check whether it is currently enabled or not, call [isAutomaticDataCollectionEnabled].
  Future<void> setAutomaticDataCollectionEnabled(bool enabled) {
    return _delegate.setAutomaticDataCollectionEnabled(enabled);
  }

  /// Sets whether automatic resource management is enabled or disabled for this
  /// app.
  Future<void> setAutomaticResourceManagementEnabled(bool enabled) {
    return _delegate.setAutomaticResourceManagementEnabled(enabled);
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! FirebaseApp) return false;
    return other.name == name && other.options == options;
  }

  @override
  int get hashCode => hash2(name, options);

  @override
  String toString() => '$FirebaseApp($name)';
}
