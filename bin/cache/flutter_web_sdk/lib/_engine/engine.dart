// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

@JS()
library dart._engine;

// This file is transformed during the build process in order to make it a
// single library. Some notable transformations:
//
// 1. Imports of engine/* files are stripped out.
// 2. Exports of engine/* files are replaced with a part directive.
//
// The code that performs the transformations lives in:
// - https://github.com/flutter/engine/blob/master/web_sdk/sdk_rewriter.dart

import 'dart:async';
// Some of these names are used in services/buffers.dart for example.
// ignore: unused_import
import 'dart:collection'
    show ListBase, IterableBase, DoubleLinkedQueue, DoubleLinkedQueueEntry;
// ignore: unused_import
import 'dart:convert' hide Codec;
import 'dart:developer' as developer;
import 'dart:html' as html;
// ignore: unused_import
import 'dart:js' as js;
// ignore: unused_import
import 'dart:js_util' as js_util;
// ignore: unused_import
import 'dart:math' as math;
import 'dart:typed_data';

import 'dart:_js_annotations';
// ignore: unused_import


import 'dart:ui' as ui;












part 'engine/alarm_clock.dart';

part 'engine/assets.dart';

part 'engine/browser_detection.dart';

part 'engine/canvas_pool.dart';

part 'engine/canvaskit/canvas.dart';

part 'engine/canvaskit/canvaskit_api.dart';

part 'engine/canvaskit/canvaskit_canvas.dart';

part 'engine/canvaskit/color_filter.dart';

part 'engine/canvaskit/embedded_views.dart';

part 'engine/canvaskit/font_fallbacks.dart';

part 'engine/canvaskit/fonts.dart';

part 'engine/canvaskit/image.dart';

part 'engine/canvaskit/image_filter.dart';

part 'engine/canvaskit/initialization.dart';

part 'engine/canvaskit/interval_tree.dart';

part 'engine/canvaskit/layer.dart';

part 'engine/canvaskit/layer_scene_builder.dart';

part 'engine/canvaskit/layer_tree.dart';

part 'engine/canvaskit/mask_filter.dart';

part 'engine/canvaskit/n_way_canvas.dart';

part 'engine/canvaskit/painting.dart';

part 'engine/canvaskit/path.dart';

part 'engine/canvaskit/path_metrics.dart';

part 'engine/canvaskit/picture.dart';

part 'engine/canvaskit/picture_recorder.dart';

part 'engine/canvaskit/raster_cache.dart';

part 'engine/canvaskit/rasterizer.dart';

part 'engine/canvaskit/shader.dart';

part 'engine/canvaskit/skia_object_cache.dart';

part 'engine/canvaskit/surface.dart';

part 'engine/canvaskit/surface_factory.dart';

part 'engine/canvaskit/text.dart';

part 'engine/canvaskit/util.dart';

part 'engine/canvaskit/vertices.dart';

part 'engine/clipboard.dart';

part 'engine/color_filter.dart';

part 'engine/dom_renderer.dart';

part 'engine/engine_canvas.dart';

part 'engine/font_change_util.dart';

part 'engine/frame_reference.dart';

part 'engine/host_node.dart';

part 'engine/html/backdrop_filter.dart';

part 'engine/html/bitmap_canvas.dart';

part 'engine/html/canvas.dart';

part 'engine/html/clip.dart';

part 'engine/html/color_filter.dart';

part 'engine/html/debug_canvas_reuse_overlay.dart';

part 'engine/html/dom_canvas.dart';

part 'engine/html/image_filter.dart';

part 'engine/html/offscreen_canvas.dart';

part 'engine/html/offset.dart';

part 'engine/html/opacity.dart';

part 'engine/html/painting.dart';

part 'engine/html/path/conic.dart';

part 'engine/html/path/cubic.dart';

part 'engine/html/path/path.dart';

part 'engine/html/path/path_iterator.dart';

part 'engine/html/path/path_metrics.dart';

part 'engine/html/path/path_ref.dart';

part 'engine/html/path/path_to_svg.dart';

part 'engine/html/path/path_utils.dart';

part 'engine/html/path/path_windings.dart';

part 'engine/html/path/tangent.dart';

part 'engine/html/path_to_svg_clip.dart';

part 'engine/html/picture.dart';

part 'engine/html/platform_view.dart';

part 'engine/html/recording_canvas.dart';

part 'engine/html/render_vertices.dart';

part 'engine/html/scene.dart';

part 'engine/html/scene_builder.dart';

part 'engine/html/shader_mask.dart';

part 'engine/html/shaders/image_shader.dart';

part 'engine/html/shaders/normalized_gradient.dart';

part 'engine/html/shaders/shader.dart';

part 'engine/html/shaders/shader_builder.dart';

part 'engine/html/shaders/vertex_shaders.dart';

part 'engine/html/shaders/webgl_context.dart';

part 'engine/html/surface.dart';

part 'engine/html/surface_stats.dart';

part 'engine/html/transform.dart';

part 'engine/html_image_codec.dart';

part 'engine/key_map.dart';

part 'engine/keyboard.dart';

part 'engine/keyboard_binding.dart';

part 'engine/mouse_cursor.dart';

part 'engine/navigation/history.dart';

part 'engine/navigation/js_url_strategy.dart';

part 'engine/navigation/url_strategy.dart';

part 'engine/onscreen_logging.dart';

part 'engine/picture.dart';

part 'engine/platform_dispatcher.dart';

part 'engine/platform_views.dart';

part 'engine/platform_views/content_manager.dart';

part 'engine/platform_views/message_handler.dart';

part 'engine/platform_views/slots.dart';

part 'engine/plugins.dart';

part 'engine/pointer_binding.dart';

part 'engine/pointer_converter.dart';

part 'engine/profiler.dart';

part 'engine/rrect_renderer.dart';

part 'engine/semantics/accessibility.dart';

part 'engine/semantics/checkable.dart';

part 'engine/semantics/image.dart';

part 'engine/semantics/incrementable.dart';

part 'engine/semantics/label_and_value.dart';

part 'engine/semantics/live_region.dart';

part 'engine/semantics/scrollable.dart';

part 'engine/semantics/semantics.dart';

part 'engine/semantics/semantics_helper.dart';

part 'engine/semantics/tappable.dart';

part 'engine/semantics/text_field.dart';

part 'engine/services/buffers.dart';

part 'engine/services/message_codec.dart';

part 'engine/services/message_codecs.dart';

part 'engine/services/serialization.dart';

part 'engine/shadow.dart';

part 'engine/test_embedding.dart';

part 'engine/text/canvas_paragraph.dart';

part 'engine/text/font_collection.dart';

part 'engine/text/layout_service.dart';

part 'engine/text/line_break_properties.dart';

part 'engine/text/line_breaker.dart';

part 'engine/text/measurement.dart';

part 'engine/text/paint_service.dart';

part 'engine/text/paragraph.dart';

part 'engine/text/ruler.dart';

part 'engine/text/text_direction.dart';

part 'engine/text/unicode_range.dart';

part 'engine/text/word_break_properties.dart';

part 'engine/text/word_breaker.dart';

part 'engine/text_editing/autofill_hint.dart';

part 'engine/text_editing/input_type.dart';

part 'engine/text_editing/text_capitalization.dart';

part 'engine/text_editing/text_editing.dart';

part 'engine/util.dart';

part 'engine/validators.dart';

part 'engine/vector_math.dart';

part 'engine/web_experiments.dart';

part 'engine/window.dart';

/// The mode the app is running in.
/// Keep these in sync with the same constants on the framework-side under foundation/constants.dart.
const bool kReleaseMode =
    bool.fromEnvironment('dart.vm.product', defaultValue: false);
/// A constant that is true if the application was compiled in profile mode.
const bool kProfileMode =
    bool.fromEnvironment('dart.vm.profile', defaultValue: false);
/// A constant that is true if the application was compiled in debug mode.
const bool kDebugMode = !kReleaseMode && !kProfileMode;
/// Returns mode of the app is running in as a string.
String get buildMode => kReleaseMode
    ? 'release'
    : kProfileMode
        ? 'profile'
        : 'debug';

/// A benchmark metric that includes frame-related computations prior to
/// submitting layer and picture operations to the underlying renderer, such as
/// HTML and CanvasKit. During this phase we compute transforms, clips, and
/// other information needed for rendering.
const String kProfilePrerollFrame = 'preroll_frame';

/// A benchmark metric that includes submitting layer and picture information
/// to the renderer.
const String kProfileApplyFrame = 'apply_frame';

bool _engineInitialized = false;

final List<ui.VoidCallback> _hotRestartListeners = <ui.VoidCallback>[];

/// Requests that [listener] is called just before hot restarting the app.
void registerHotRestartListener(ui.VoidCallback listener) {
  _hotRestartListeners.add(listener);
}

/// This method performs one-time initialization of the Web environment that
/// supports the Flutter framework.
///
/// This is only available on the Web, as native Flutter configures the
/// environment in the native embedder.
void initializeEngine() {
  if (_engineInitialized) {
    return;
  }

  // Setup the hook that allows users to customize URL strategy before running
  // the app.
  _addUrlStrategyListener();

  // Called by the Web runtime just before hot restarting the app.
  //
  // This extension cleans up resources that are registered with browser's
  // global singletons that Dart compiler is unable to clean-up automatically.
  //
  // This extension does not need to clean-up Dart statics. Those are cleaned
  // up by the compiler.
  developer.registerExtension('ext.flutter.disassemble', (_, __) {
    for (final ui.VoidCallback listener in _hotRestartListeners) {
      listener();
    }
    return Future<developer.ServiceExtensionResponse>.value(
        developer.ServiceExtensionResponse.result('OK'));
  });

  _engineInitialized = true;

  // Initialize the DomRenderer before initializing framework bindings.
  ensureDomRendererInitialized();

  WebExperiments.ensureInitialized();

  if (Profiler.isBenchmarkMode) {
    Profiler.ensureInitialized();
  }

  bool waitingForAnimation = false;
  scheduleFrameCallback = () {
    // We're asked to schedule a frame and call `frameHandler` when the frame
    // fires.
    if (!waitingForAnimation) {
      waitingForAnimation = true;
      html.window.requestAnimationFrame((num highResTime) {
        frameTimingsOnVsync();

        // Reset immediately, because `frameHandler` can schedule more frames.
        waitingForAnimation = false;

        // We have to convert high-resolution time to `int` so we can construct
        // a `Duration` out of it. However, high-res time is supplied in
        // milliseconds as a double value, with sub-millisecond information
        // hidden in the fraction. So we first multiply it by 1000 to uncover
        // microsecond precision, and only then convert to `int`.
        final int highResTimeMicroseconds = (1000 * highResTime).toInt();

        // In Flutter terminology "building a frame" consists of "beginning
        // frame" and "drawing frame".
        //
        // We do not call `frameTimingsOnBuildFinish` from here because
        // part of the rasterization process, particularly in the HTML
        // renderer, takes place in the `SceneBuilder.build()`.
        frameTimingsOnBuildStart();
        if (EnginePlatformDispatcher.instance.onBeginFrame != null) {
          EnginePlatformDispatcher.instance.invokeOnBeginFrame(
              Duration(microseconds: highResTimeMicroseconds));
        }

        if (EnginePlatformDispatcher.instance.onDrawFrame != null) {
          // TODO(yjbanov): technically Flutter flushes microtasks between
          //                onBeginFrame and onDrawFrame. We don't, which hasn't
          //                been an issue yet, but eventually we'll have to
          //                implement it properly.
          EnginePlatformDispatcher.instance.invokeOnDrawFrame();
        }
      });
    }
  };

  Keyboard.initialize();
  MouseCursor.initialize();
}

void _addUrlStrategyListener() {
  jsSetUrlStrategy = allowInterop((JsUrlStrategy? jsStrategy) {
    customUrlStrategy =
        jsStrategy == null ? null : CustomUrlStrategy.fromJs(jsStrategy);
  });
  registerHotRestartListener(() {
    jsSetUrlStrategy = null;
  });
}

/// Sanitizer used to convert const svg filter and clippath snippets to
/// SvgElement without sanitization.
class NullTreeSanitizer implements html.NodeTreeSanitizer {
  @override
  void sanitizeTree(html.Node node) {}
}

/// The shared instance of PlatformViewManager shared across the engine to handle
/// rendering of PlatformViews into the web app.
// TODO(dit): How to make this overridable from tests?
final PlatformViewManager platformViewManager = PlatformViewManager();

/// Converts a matrix represented using [Float64List] to one represented using
/// [Float32List].
///
/// 32-bit precision is sufficient because Flutter Engine itself (as well as
/// Skia) use 32-bit precision under the hood anyway.
///
/// 32-bit matrices require 2x less memory and in V8 they are allocated on the
/// JavaScript heap, thus avoiding a malloc.
///
/// See also:
/// * https://bugs.chromium.org/p/v8/issues/detail?id=9199
/// * https://bugs.chromium.org/p/v8/issues/detail?id=2022
Float32List toMatrix32(Float64List matrix64) {
  final Float32List matrix32 = Float32List(16);
  matrix32[15] = matrix64[15];
  matrix32[14] = matrix64[14];
  matrix32[13] = matrix64[13];
  matrix32[12] = matrix64[12];
  matrix32[11] = matrix64[11];
  matrix32[10] = matrix64[10];
  matrix32[9] = matrix64[9];
  matrix32[8] = matrix64[8];
  matrix32[7] = matrix64[7];
  matrix32[6] = matrix64[6];
  matrix32[5] = matrix64[5];
  matrix32[4] = matrix64[4];
  matrix32[3] = matrix64[3];
  matrix32[2] = matrix64[2];
  matrix32[1] = matrix64[1];
  matrix32[0] = matrix64[0];
  return matrix32;
}
