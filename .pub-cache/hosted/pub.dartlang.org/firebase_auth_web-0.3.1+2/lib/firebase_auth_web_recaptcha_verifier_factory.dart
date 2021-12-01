// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'package:firebase/firebase.dart' as firebase;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_auth_web/utils.dart';

const String _kInvisibleElementId = '__ff-recaptcha-container';

/// The delegate implementation for [RecaptchaVerifierFactoryPlatform].
///
/// This factory class is implemented to the user facing code has no underlying knowledge
/// of the delegate implementation.
class RecaptchaVerifierFactoryWeb extends RecaptchaVerifierFactoryPlatform {
  firebase.RecaptchaVerifier _delegate;

  /// Returns a stub instance of the class.
  ///
  /// This is used during initialization of the plugin so the user-facing
  /// code has access to the class instance without directly knowing about it.
  ///
  /// See the [registerWith] static method on the [FirebaseAuthWeb] class.
  static RecaptchaVerifierFactoryWeb get instance =>
      RecaptchaVerifierFactoryWeb._();

  RecaptchaVerifierFactoryWeb._() : super();

  /// Creates a new [RecaptchaVerifierFactoryWeb] with a container and parameters.
  RecaptchaVerifierFactoryWeb({
    String container,
    RecaptchaVerifierSize size = RecaptchaVerifierSize.normal,
    RecaptchaVerifierTheme theme = RecaptchaVerifierTheme.light,
    RecaptchaVerifierOnSuccess onSuccess,
    RecaptchaVerifierOnError onError,
    RecaptchaVerifierOnExpired onExpired,
  }) : super() {
    String element;
    Map<String, dynamic> parameters = {};

    if (onSuccess != null) {
      parameters['callback'] = (resp) {
        onSuccess();
      };
    }

    if (onExpired != null) {
      parameters['expired-callback'] = () {
        onExpired();
      };
    }

    if (onError != null) {
      parameters['error-callback'] = (Object error) {
        onError(throwFirebaseAuthException(error));
      };
    }

    if (container == null || container.isEmpty) {
      parameters['size'] = 'invisible';
      Element el = window.document.getElementById(_kInvisibleElementId);

      // If an existing element exists, something may have already been rendered.
      if (el != null) {
        el.remove();
      }

      window.document.documentElement.children
          .add(DivElement()..id = _kInvisibleElementId);

      element = _kInvisibleElementId;
    } else {
      parameters['size'] = convertRecaptchaVerifierSize(size);
      parameters['theme'] = convertRecaptchaVerifierTheme(theme);

      Element el = window.document.getElementById(container);
      assert(el != null,
          'An exception was thrown whilst creating a RecaptchaVerifier instance. No DOM element with an ID of $container could be found.');

      // If the provided string container ID has been found, assign it.
      element = container;
    }

    _delegate = firebase.RecaptchaVerifier(element, parameters);
  }

  @override
  RecaptchaVerifierFactoryPlatform delegateFor(
      {String container,
      RecaptchaVerifierSize size = RecaptchaVerifierSize.normal,
      RecaptchaVerifierTheme theme = RecaptchaVerifierTheme.light,
      RecaptchaVerifierOnSuccess onSuccess,
      RecaptchaVerifierOnError onError,
      RecaptchaVerifierOnExpired onExpired}) {
    return RecaptchaVerifierFactoryWeb(
        container: container,
        size: size,
        theme: theme,
        onSuccess: onSuccess,
        onError: onError,
        onExpired: onExpired);
  }

  @override
  firebase.ApplicationVerifier get delegate {
    return _delegate;
  }

  @override
  String get type => _delegate.type;

  @override
  void clear() {
    return _delegate.clear();
  }

  @override
  Future<String> verify() {
    try {
      return _delegate.verify();
    } catch (e) {
      throw throwFirebaseAuthException(e);
    }
  }

  @override
  Future<int> render() async {
    try {
      return (await _delegate.render()) as int;
    } catch (e) {
      throw throwFirebaseAuthException(e);
    }
  }
}
