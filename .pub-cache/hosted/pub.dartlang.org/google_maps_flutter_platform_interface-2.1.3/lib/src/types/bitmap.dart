// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async' show Future;
import 'dart:typed_data' show Uint8List;
import 'dart:ui' show Size;

import 'package:flutter/material.dart'
    show ImageConfiguration, AssetImage, AssetBundleImageKey;
import 'package:flutter/services.dart' show AssetBundle;

import 'package:flutter/foundation.dart' show kIsWeb;

/// Defines a bitmap image. For a marker, this class can be used to set the
/// image of the marker icon. For a ground overlay, it can be used to set the
/// image to place on the surface of the earth.
class BitmapDescriptor {
  const BitmapDescriptor._(this._json);

  static const String _defaultMarker = 'defaultMarker';
  static const String _fromAsset = 'fromAsset';
  static const String _fromAssetImage = 'fromAssetImage';
  static const String _fromBytes = 'fromBytes';

  static const Set<String> _validTypes = {
    _defaultMarker,
    _fromAsset,
    _fromAssetImage,
    _fromBytes,
  };

  /// Convenience hue value representing red.
  static const double hueRed = 0.0;

  /// Convenience hue value representing orange.
  static const double hueOrange = 30.0;

  /// Convenience hue value representing yellow.
  static const double hueYellow = 60.0;

  /// Convenience hue value representing green.
  static const double hueGreen = 120.0;

  /// Convenience hue value representing cyan.
  static const double hueCyan = 180.0;

  /// Convenience hue value representing azure.
  static const double hueAzure = 210.0;

  /// Convenience hue value representing blue.
  static const double hueBlue = 240.0;

  /// Convenience hue value representing violet.
  static const double hueViolet = 270.0;

  /// Convenience hue value representing magenta.
  static const double hueMagenta = 300.0;

  /// Convenience hue value representing rose.
  static const double hueRose = 330.0;

  /// Creates a BitmapDescriptor that refers to the default marker image.
  static const BitmapDescriptor defaultMarker =
      BitmapDescriptor._(<Object>[_defaultMarker]);

  /// Creates a BitmapDescriptor that refers to a colorization of the default
  /// marker image. For convenience, there is a predefined set of hue values.
  /// See e.g. [hueYellow].
  static BitmapDescriptor defaultMarkerWithHue(double hue) {
    assert(0.0 <= hue && hue < 360.0);
    return BitmapDescriptor._(<Object>[_defaultMarker, hue]);
  }

  /// Creates a [BitmapDescriptor] from an asset image.
  ///
  /// Asset images in flutter are stored per:
  /// https://flutter.dev/docs/development/ui/assets-and-images#declaring-resolution-aware-image-assets
  /// This method takes into consideration various asset resolutions
  /// and scales the images to the right resolution depending on the dpi.
  /// Set `mipmaps` to false to load the exact dpi version of the image, `mipmap` is true by default.
  static Future<BitmapDescriptor> fromAssetImage(
    ImageConfiguration configuration,
    String assetName, {
    AssetBundle? bundle,
    String? package,
    bool mipmaps = true,
  }) async {
    double? devicePixelRatio = configuration.devicePixelRatio;
    if (!mipmaps && devicePixelRatio != null) {
      return BitmapDescriptor._(<Object>[
        _fromAssetImage,
        assetName,
        devicePixelRatio,
      ]);
    }
    final AssetImage assetImage =
        AssetImage(assetName, package: package, bundle: bundle);
    final AssetBundleImageKey assetBundleImageKey =
        await assetImage.obtainKey(configuration);
    final Size? size = configuration.size;
    return BitmapDescriptor._(<Object>[
      _fromAssetImage,
      assetBundleImageKey.name,
      assetBundleImageKey.scale,
      if (kIsWeb && size != null)
        [
          size.width,
          size.height,
        ],
    ]);
  }

  /// Creates a BitmapDescriptor using an array of bytes that must be encoded
  /// as PNG.
  static BitmapDescriptor fromBytes(Uint8List byteData) {
    return BitmapDescriptor._(<Object>[_fromBytes, byteData]);
  }

  /// The inverse of .toJson.
  // This is needed in Web to re-hydrate BitmapDescriptors that have been
  // transformed to JSON for transport.
  // TODO(https://github.com/flutter/flutter/issues/70330): Clean this up.
  BitmapDescriptor.fromJson(Object json) : _json = json {
    assert(_json is List<dynamic>);
    final jsonList = json as List<dynamic>;
    assert(_validTypes.contains(jsonList[0]));
    switch (jsonList[0]) {
      case _defaultMarker:
        assert(jsonList.length <= 2);
        if (jsonList.length == 2) {
          assert(jsonList[1] is num);
          assert(0 <= jsonList[1] && jsonList[1] < 360);
        }
        break;
      case _fromBytes:
        assert(jsonList.length == 2);
        assert(jsonList[1] != null && jsonList[1] is List<int>);
        assert((jsonList[1] as List).isNotEmpty);
        break;
      case _fromAsset:
        assert(jsonList.length <= 3);
        assert(jsonList[1] != null && jsonList[1] is String);
        assert((jsonList[1] as String).isNotEmpty);
        if (jsonList.length == 3) {
          assert(jsonList[2] != null && jsonList[2] is String);
          assert((jsonList[2] as String).isNotEmpty);
        }
        break;
      case _fromAssetImage:
        assert(jsonList.length <= 4);
        assert(jsonList[1] != null && jsonList[1] is String);
        assert((jsonList[1] as String).isNotEmpty);
        assert(jsonList[2] != null && jsonList[2] is double);
        if (jsonList.length == 4) {
          assert(jsonList[3] != null && jsonList[3] is List);
          assert((jsonList[3] as List).length == 2);
        }
        break;
      default:
        break;
    }
  }

  final Object _json;

  /// Convert the object to a Json format.
  Object toJson() => _json;
}
