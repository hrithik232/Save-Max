// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of firebase_dynamic_links;

typedef OnLinkSuccessCallback = Future<dynamic> Function(
    PendingDynamicLinkData linkData);
typedef OnLinkErrorCallback = Future<dynamic> Function(
    OnLinkErrorException error);

/// Firebase Dynamic Links API.
///
/// You can get an instance by calling [FirebaseDynamicLinks.instance].
class FirebaseDynamicLinks {
  FirebaseDynamicLinks._();

  @visibleForTesting
  static const MethodChannel channel =
      MethodChannel('plugins.flutter.io/firebase_dynamic_links');

  /// Singleton of [FirebaseDynamicLinks].
  static final FirebaseDynamicLinks instance = FirebaseDynamicLinks._();

  OnLinkSuccessCallback _onLinkSuccess;
  OnLinkErrorCallback _onLinkError;

  /// Attempts to retrieve the dynamic link which launched the app.
  ///
  /// This method always returns a Future. That Future completes to null if
  /// there is no pending dynamic link or any call to this method after the
  /// the first attempt.
  Future<PendingDynamicLinkData> getInitialLink() async {
    final Map<String, dynamic> linkData =
        await channel.invokeMapMethod<String, dynamic>(
            'FirebaseDynamicLinks#getInitialLink');
    return getPendingDynamicLinkDataFromMap(linkData);
  }

  Future<PendingDynamicLinkData> getDynamicLink(Uri url) async {
    final Map<String, dynamic> linkData = await FirebaseDynamicLinks.channel
        .invokeMapMethod<String, dynamic>('FirebaseDynamicLinks#getDynamicLink',
            <String, dynamic>{'url': url.toString()});
    return getPendingDynamicLinkDataFromMap(linkData);
  }

  PendingDynamicLinkData getPendingDynamicLinkDataFromMap(
      Map<dynamic, dynamic> linkData) {
    if (linkData == null) return null;

    final link = linkData['link'];
    if (link == null) return null;

    PendingDynamicLinkDataAndroid androidData;
    if (linkData['android'] != null) {
      final Map<dynamic, dynamic> data = linkData['android'];
      androidData = PendingDynamicLinkDataAndroid._(
        data['clickTimestamp'],
        data['minimumVersion'],
      );
    }

    PendingDynamicLinkDataIOS iosData;
    if (linkData['ios'] != null) {
      final Map<dynamic, dynamic> data = linkData['ios'];
      iosData = PendingDynamicLinkDataIOS._(data['minimumVersion']);
    }

    return PendingDynamicLinkData._(
      Uri.parse(link),
      androidData,
      iosData,
    );
  }

  /// Configures onLink listeners: it has two methods for success and failure.
  void onLink({
    OnLinkSuccessCallback onSuccess,
    OnLinkErrorCallback onError,
  }) {
    _onLinkSuccess = onSuccess;
    _onLinkError = onError;
    channel.setMethodCallHandler(_handleMethod);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onLinkSuccess":
        PendingDynamicLinkData linkData;
        if (call.arguments != null) {
          final Map<dynamic, dynamic> data =
              call.arguments.cast<dynamic, dynamic>();
          linkData = getPendingDynamicLinkDataFromMap(data);
        }
        return _onLinkSuccess(linkData);
      case "onLinkError":
        final Map<dynamic, dynamic> data =
            call.arguments.cast<dynamic, dynamic>();
        final OnLinkErrorException e = OnLinkErrorException._(
            data['code'], data['message'], data['details']);
        return _onLinkError(e);
    }
  }
}

/// Provides data from received dynamic link.
class PendingDynamicLinkData {
  PendingDynamicLinkData._(this.link, this.android, this.ios);

  /// Provides Android specific data from received dynamic link.
  ///
  /// Can be null if [link] equals null or dynamic link was not received on an
  /// Android device.
  final PendingDynamicLinkDataAndroid android;

  /// Provides iOS specific data from received dynamic link.
  ///
  /// Can be null if [link] equals null or dynamic link was not received on an
  /// iOS device.
  final PendingDynamicLinkDataIOS ios;

  /// Deep link parameter of the dynamic link.
  final Uri link;
}

/// Provides android specific data from received dynamic link.
class PendingDynamicLinkDataAndroid {
  PendingDynamicLinkDataAndroid._(
    this.clickTimestamp,
    this.minimumVersion,
  );

  /// The time the user clicked on the dynamic link.
  ///
  /// Equals the number of milliseconds that have elapsed since January 1, 1970.
  final int clickTimestamp;

  /// The minimum version of your app that can open the link.
  ///
  /// The minimum Android app version requested to process the dynamic link that
  /// can be compared directly with versionCode.
  ///
  /// If the installed app is an older version, the user is taken to the Play
  /// Store to upgrade the app.
  final int minimumVersion;
}

/// Provides iOS specific data from received dynamic link.
class PendingDynamicLinkDataIOS {
  PendingDynamicLinkDataIOS._(this.minimumVersion);

  /// The minimum version of your app that can open the link.
  ///
  /// It is app developer's responsibility to open AppStore when received link
  /// declares higher [minimumVersion] than currently installed.
  final String minimumVersion;
}

/// This object is returned by the handler when an error occurs.
class OnLinkErrorException extends PlatformException {
  OnLinkErrorException._(String code, String message, dynamic details)
      : super(code: code, message: message, details: details);
}
