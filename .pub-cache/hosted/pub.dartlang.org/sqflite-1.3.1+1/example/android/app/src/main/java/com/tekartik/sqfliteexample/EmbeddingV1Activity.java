// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package com.tekartik.sqfliteexample;

import android.os.Bundle;

import com.tekartik.sqflite.Constant;
import com.tekartik.sqflite.SqflitePlugin;

import dev.flutter.plugins.e2e.E2EPlugin;
import io.flutter.app.FlutterActivity;

public class EmbeddingV1Activity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SqflitePlugin.registerWith(registrarFor(Constant.PLUGIN_KEY));
        E2EPlugin.registerWith(registrarFor("dev.flutter.plugins.e2e.E2EPlugin"));
    }
}
