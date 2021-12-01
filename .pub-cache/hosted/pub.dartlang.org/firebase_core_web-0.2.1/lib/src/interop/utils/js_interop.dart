// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

@JS()
library firebase_interop.core.js;

import 'package:js/js.dart';
import 'package:js/js_util.dart' as util;

// TODO(ehesp): Break into own package?
@JS('JSON.stringify')
external String stringify(Object obj);

@JS('Object.keys')
external List<String> objectKeys(Object obj);

@JS('Array.from')
external Object toJSArray(List source);

DateTime dartifyDate(Object jsObject) {
  if (util.hasProperty(jsObject, 'toDateString')) {
    try {
      var date = jsObject as dynamic;
      return DateTime.fromMillisecondsSinceEpoch(date.getTime());
    } on NoSuchMethodError {
      // so it's not a JsDate!
      return null;
    }
  }
  return null;
}
