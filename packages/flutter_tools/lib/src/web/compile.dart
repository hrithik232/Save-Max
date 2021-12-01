// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import '../artifacts.dart';
import '../base/common.dart';
import '../base/file_system.dart';
import '../base/logger.dart';
import '../build_info.dart';
import '../build_system/build_system.dart';
import '../build_system/targets/web.dart';
import '../cache.dart';
import '../flutter_plugins.dart';
import '../globals_null_migrated.dart' as globals;
import '../platform_plugins.dart';
import '../plugins.dart';
import '../project.dart';

Future<void> buildWeb(
  FlutterProject flutterProject,
  String target,
  BuildInfo buildInfo,
  bool csp,
  String serviceWorkerStrategy,
  bool sourceMaps,
  bool nativeNullAssertions,
  String baseHref,
) async {
  final bool hasWebPlugins = (await findPlugins(flutterProject))
    .any((Plugin p) => p.platforms.containsKey(WebPlugin.kConfigKey));
  final Directory outputDirectory = globals.fs.directory(getWebBuildDirectory());
  outputDirectory.createSync(recursive: true);

  await injectPlugins(flutterProject, webPlatform: true);
  final Status status = globals.logger.startProgress('Compiling $target for the Web...');
  final Stopwatch sw = Stopwatch()..start();
  try {
    final BuildResult result = await globals.buildSystem.build(const WebServiceWorker(), Environment(
      projectDir: globals.fs.currentDirectory,
      outputDir: outputDirectory,
      buildDir: flutterProject.directory
        .childDirectory('.dart_tool')
        .childDirectory('flutter_build'),
      defines: <String, String>{
        kTargetFile: target,
        kHasWebPlugins: hasWebPlugins.toString(),
        kCspMode: csp.toString(),
        kBaseHref : baseHref,
        kSourceMapsEnabled: sourceMaps.toString(),
        kNativeNullAssertions: nativeNullAssertions.toString(),
        if (serviceWorkerStrategy != null)
         kServiceWorkerStrategy: serviceWorkerStrategy,
        ...buildInfo.toBuildSystemEnvironment(),
      },
      artifacts: globals.artifacts,
      fileSystem: globals.fs,
      logger: globals.logger,
      processManager: globals.processManager,
      platform: globals.platform,
      cacheDir: globals.cache.getRoot(),
      engineVersion: globals.artifacts.isLocalEngine
        ? null
        : globals.flutterVersion.engineRevision,
      flutterRootDir: globals.fs.directory(Cache.flutterRoot),
      // Web uses a different Dart plugin registry.
      // https://github.com/flutter/flutter/issues/80406
      generateDartPluginRegistry: false,
    ));
    if (!result.success) {
      for (final ExceptionMeasurement measurement in result.exceptions.values) {
        globals.printError('Target ${measurement.target} failed: ${measurement.exception}',
          stackTrace: measurement.fatal
            ? measurement.stackTrace
            : null,
        );
      }
      throwToolExit('Failed to compile application for the Web.');
    }
  } on Exception catch (err) {
    throwToolExit(err.toString());
  } finally {
    status.stop();
  }
  globals.flutterUsage.sendTiming('build', 'dart2js', Duration(milliseconds: sw.elapsedMilliseconds));
}

/// Web rendering backend mode.
enum WebRendererMode {
  /// Auto detects which rendering backend to use.
  autoDetect,
  /// Always uses canvaskit.
  canvaskit,
  /// Always uses html.
  html,
}

/// The correct precompiled artifact to use for each build and render mode.
const Map<WebRendererMode, Map<NullSafetyMode, HostArtifact>> kDartSdkJsArtifactMap = <WebRendererMode, Map<NullSafetyMode, HostArtifact>>{
  WebRendererMode.autoDetect: <NullSafetyMode, HostArtifact> {
    NullSafetyMode.sound: HostArtifact.webPrecompiledCanvaskitAndHtmlSoundSdk,
    NullSafetyMode.unsound: HostArtifact.webPrecompiledCanvaskitAndHtmlSdk,
  },
  WebRendererMode.canvaskit: <NullSafetyMode, HostArtifact> {
    NullSafetyMode.sound: HostArtifact.webPrecompiledCanvaskitSoundSdk,
    NullSafetyMode.unsound: HostArtifact.webPrecompiledCanvaskitSdk,
  },
  WebRendererMode.html: <NullSafetyMode, HostArtifact> {
    NullSafetyMode.sound: HostArtifact.webPrecompiledSoundSdk,
    NullSafetyMode.unsound: HostArtifact.webPrecompiledSdk,
  },
};

/// The correct source map artifact to use for each build and render mode.
const Map<WebRendererMode, Map<NullSafetyMode, HostArtifact>> kDartSdkJsMapArtifactMap = <WebRendererMode, Map<NullSafetyMode, HostArtifact>>{
  WebRendererMode.autoDetect: <NullSafetyMode, HostArtifact> {
    NullSafetyMode.sound: HostArtifact.webPrecompiledCanvaskitAndHtmlSoundSdkSourcemaps,
    NullSafetyMode.unsound: HostArtifact.webPrecompiledCanvaskitAndHtmlSdkSourcemaps,
  },
  WebRendererMode.canvaskit: <NullSafetyMode, HostArtifact> {
    NullSafetyMode.sound: HostArtifact.webPrecompiledCanvaskitSoundSdkSourcemaps,
    NullSafetyMode.unsound: HostArtifact.webPrecompiledCanvaskitSdkSourcemaps,
  },
  WebRendererMode.html: <NullSafetyMode, HostArtifact> {
    NullSafetyMode.sound: HostArtifact.webPrecompiledSoundSdkSourcemaps,
    NullSafetyMode.unsound: HostArtifact.webPrecompiledSdkSourcemaps,
  },
};
