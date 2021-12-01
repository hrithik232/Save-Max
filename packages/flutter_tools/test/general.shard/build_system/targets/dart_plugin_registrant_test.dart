// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

// TODO(gspencergoog): Remove this tag once this test's state leaks/test
// dependencies have been fixed.
// https://github.com/flutter/flutter/issues/85160
// Fails with "flutter test --test-randomize-ordering-seed=20210722"
@Tags(<String>['no-shuffle'])

import 'package:file/memory.dart';
import 'package:flutter_tools/src/base/file_system.dart';
import 'package:flutter_tools/src/base/logger.dart';
import 'package:flutter_tools/src/build_info.dart';
import 'package:flutter_tools/src/build_system/build_system.dart';
import 'package:flutter_tools/src/build_system/targets/dart_plugin_registrant.dart';
import 'package:flutter_tools/src/project.dart';

import '../../../src/common.dart';
import '../../../src/context.dart';

const String _kEmptyPubspecFile = '''
name: path_provider_example

dependencies:
  flutter:
    sdk: flutter
''';

const String _kEmptyPackageJson = '''
{
  "configVersion": 2,
  "packages": [
     {
      "name": "path_provider_example",
      "rootUri": "../",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    }
  ]
}
''';

const String _kSamplePackageJson = '''
{
  "configVersion": 2,
  "packages": [
    {
      "name": "path_provider_linux",
      "rootUri": "/path_provider_linux",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    },
    {
      "name": "path_provider_example",
      "rootUri": "../",
      "packageUri": "lib/",
      "languageVersion": "2.12"
    }
  ]
}
''';

const String _kSamplePackagesFile = '''
path_provider_linux:/path_provider_linux/lib/
path_provider_example:lib/
''';

const String _kSamplePubspecFile = '''
name: path_provider_example
description: Demonstrates how to use the path_provider plugin.

dependencies:
  flutter:
    sdk: flutter
  path_provider_linux: 1.0.0
''';

const String _kSamplePluginPubspec = '''
name: path_provider_linux
description: linux implementation of the path_provider plugin
// version: 2.0.1
// homepage: https://github.com/flutter/plugins/tree/master/packages/path_provider/path_provider_linux

flutter:
  plugin:
    implements: path_provider
    platforms:
      linux:
        dartPluginClass: PathProviderLinux
        pluginClass: none

environment:
  sdk: ">=2.12.0-259.9.beta <3.0.0"
  flutter: ">=1.20.0"
''';

void main() {

  group('Dart plugin registrant' , () {
    final FileSystem fileSystem = MemoryFileSystem.test();

    testWithoutContext('skipped based on environment.generateDartPluginRegistry',
        () async {
      final Environment environment = Environment.test(
          fileSystem.currentDirectory,
          artifacts: null,
          fileSystem: fileSystem,
          logger: BufferLogger.test(),
          processManager: FakeProcessManager.any(),
          generateDartPluginRegistry: false,
          defines: <String, String>{
            kTargetPlatform: 'darwin-x64',
          });

      expect(const DartPluginRegistrantTarget().canSkip(environment), isTrue);

      final Environment environment2 = Environment.test(
          fileSystem.currentDirectory,
          artifacts: null,
          fileSystem: fileSystem,
          logger: BufferLogger.test(),
          processManager: FakeProcessManager.any(),
          generateDartPluginRegistry: true,
          defines: <String, String>{
            kTargetPlatform: 'darwin-x64',
          });

      expect(const DartPluginRegistrantTarget().canSkip(environment2), isFalse);
    });

    testWithoutContext('skipped based on platform', () async {
      const Map<String, bool> canSkip = <String, bool>{
        'darwin-x64': false,
        'linux-x64': false,
        'linux-arm64': false,
        'windows-x64': false,
        'windows-uwp-x64': false,
        'web-javascript': true,
        'ios': true,
        'android': true,
        'fuchsia-arm64': true,
        'fuchsia-x64': true,
      };

      for (final String targetPlatform in canSkip.keys) {
        expect(
          const DartPluginRegistrantTarget().canSkip(
            Environment.test(
              fileSystem.currentDirectory,
              artifacts: null,
              fileSystem: fileSystem,
              logger: BufferLogger.test(),
              processManager: FakeProcessManager.any(),
              generateDartPluginRegistry: true,
              defines: <String, String>{
                kTargetPlatform: targetPlatform,
              },
            ),
          ),
          canSkip[targetPlatform],
        );
      }
    });

    testUsingContext("doesn't generate generated_main.dart if there aren't Dart plugins", () async {
      final Directory projectDir = fileSystem.directory('project')..createSync();
      final Environment environment = Environment.test(
          fileSystem.currentDirectory,
          projectDir: projectDir,
          artifacts: null,
          fileSystem: fileSystem,
          logger: BufferLogger.test(),
          processManager: FakeProcessManager.any(),
          defines: <String, String>{
            kTargetFile: projectDir.childDirectory('lib').childFile('main.dart').absolute.path,
          },
          generateDartPluginRegistry: true);

      projectDir
          .childDirectory('.dart_tool')
          .childFile('package_config.json')
          ..createSync(recursive: true)
          ..writeAsStringSync(_kSamplePackageJson);

      projectDir.childFile('pubspec.yaml').createSync();

      projectDir.childFile('.packages').createSync();

      final FlutterProject testProject = FlutterProject.fromDirectoryTest(projectDir);
      await DartPluginRegistrantTarget.test(testProject).build(environment);

      final File generatedMain = projectDir
          .childDirectory('.dart_tool')
          .childDirectory('flutter_build')
          .childFile('generated_main.dart');
      expect(generatedMain.existsSync(), isFalse);
    });

    testUsingContext('regenerates generated_main.dart', () async {
      final Directory projectDir = fileSystem.directory('project')..createSync();
      final Environment environment = Environment.test(
          fileSystem.currentDirectory,
          projectDir: projectDir,
          artifacts: null,
          fileSystem: fileSystem,
          logger: BufferLogger.test(),
          processManager: FakeProcessManager.any(),
          defines: <String, String>{
            kTargetFile: projectDir.childDirectory('lib').childFile('main.dart').absolute.path,
          },
          generateDartPluginRegistry: true);

      projectDir
          .childDirectory('.dart_tool')
          .childFile('package_config.json')
          ..createSync(recursive: true)
          ..writeAsStringSync(_kSamplePackageJson);

      projectDir.childFile('pubspec.yaml').writeAsStringSync(_kSamplePubspecFile);

      projectDir.childFile('.packages').writeAsStringSync(_kSamplePackagesFile);

      projectDir.childDirectory('lib').childFile('main.dart').createSync(recursive: true);

      environment.fileSystem.currentDirectory
          .childDirectory('path_provider_linux')
          .childFile('pubspec.yaml')
          ..createSync(recursive: true)
          ..writeAsStringSync(_kSamplePluginPubspec);

      final FlutterProject testProject = FlutterProject.fromDirectoryTest(projectDir);
      await DartPluginRegistrantTarget.test(testProject).build(environment);

      final File generatedMain = projectDir
          .childDirectory('.dart_tool')
          .childDirectory('flutter_build')
          .childFile('generated_main.dart');
      final String mainContent = generatedMain.readAsStringSync();
      expect(
        mainContent,
        equals(
          '//\n'
          '// Generated file. Do not edit.\n'
          '// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.\n'
          '//\n'
          '\n'
          '// @dart = 2.12\n'
          '\n'
          "import 'package:path_provider_example/main.dart' as entrypoint;\n"
          "import 'dart:io'; // flutter_ignore: dart_io_import.\n"
          "import 'package:path_provider_linux/path_provider_linux.dart';\n"
          '\n'
          "@pragma('vm:entry-point')\n"
          'class _PluginRegistrant {\n'
          '\n'
          "  @pragma('vm:entry-point')\n"
          '  static void register() {\n'
          '    if (Platform.isLinux) {\n'
          '      try {\n'
          '        PathProviderLinux.registerWith();\n'
          '      } catch (err) {\n'
          '        print(\n'
          "          '`path_provider_linux` threw an error: \$err. '\n"
          "          'The app may not function as expected until you remove this plugin from pubspec.yaml'\n"
          '        );\n'
          '        rethrow;\n'
          '      }\n'
          '\n'
          '    } else if (Platform.isMacOS) {\n'
          '    } else if (Platform.isWindows) {\n'
          '    }\n'
          '  }\n'
          '\n'
          '}\n'
          '\n'
          'typedef _UnaryFunction = dynamic Function(List<String> args);\n'
          'typedef _NullaryFunction = dynamic Function();\n'
          '\n'
          'void main(List<String> args) {\n'
          '  if (entrypoint.main is _UnaryFunction) {\n'
          '    (entrypoint.main as _UnaryFunction)(args);\n'
          '  } else {\n'
          '    (entrypoint.main as _NullaryFunction)();\n'
          '  }\n'
          '}\n'
        ),
      );
    });

    testUsingContext('removes generated_main.dart if plugins are removed from pubspec.yaml', () async {
      final Directory projectDir = fileSystem.directory('project')..createSync();
      final Environment environment = Environment.test(
          fileSystem.currentDirectory,
          projectDir: projectDir,
          artifacts: null,
          fileSystem: fileSystem,
          logger: BufferLogger.test(),
          processManager: FakeProcessManager.any(),
          defines: <String, String>{
            kTargetFile: projectDir.childDirectory('lib').childFile('main.dart').absolute.path,
          },
          generateDartPluginRegistry: true);
      final File config = projectDir
          .childDirectory('.dart_tool')
          .childFile('package_config.json')
          ..createSync(recursive: true)
          ..writeAsStringSync(_kSamplePackageJson);

      final File pubspec = projectDir.childFile('pubspec.yaml')..writeAsStringSync(_kSamplePubspecFile);

      final File packages = projectDir.childFile('.packages')..writeAsStringSync(_kSamplePackagesFile);

      environment.fileSystem.currentDirectory
          .childDirectory('path_provider_linux')
          .childFile('pubspec.yaml')
          ..createSync(recursive: true)
          ..writeAsStringSync(_kSamplePluginPubspec);

      final File generatedMain = projectDir
          .childDirectory('.dart_tool')
          .childDirectory('flutter_build')
          .childFile('generated_main.dart');

      final FlutterProject testProject = FlutterProject.fromDirectoryTest(projectDir);
      await DartPluginRegistrantTarget.test(testProject).build(environment);
      expect(generatedMain.existsSync(), isTrue);

      // Simulate a user removing everything from pubspec.yaml.
      pubspec.writeAsStringSync(_kEmptyPubspecFile);
      packages.writeAsStringSync(_kEmptyPackageJson);
      config.writeAsStringSync(_kEmptyPackageJson);

      await DartPluginRegistrantTarget.test(testProject).build(environment);
      expect(generatedMain.existsSync(), isFalse);
    });

    testUsingContext('target file is outside the current project package', () async {
      final Directory projectDir = fileSystem.directory('project')..createSync();
      final Environment environment = Environment.test(
          fileSystem.currentDirectory,
          projectDir: projectDir,
          artifacts: null,
          fileSystem: fileSystem,
          logger: BufferLogger.test(),
          processManager: FakeProcessManager.any(),
          defines: <String, String>{
            kTargetFile: fileSystem.directory('root').childFile('external.dart').absolute.path,
          },
          generateDartPluginRegistry: true);

      projectDir
          .childDirectory('.dart_tool')
          .childFile('package_config.json')
          .writeAsStringSync(_kSamplePackageJson);

      projectDir.childFile('pubspec.yaml').writeAsStringSync(_kSamplePubspecFile);

      projectDir.childFile('.packages').writeAsStringSync(_kSamplePackagesFile);

      projectDir.childDirectory('lib').childFile('main.dart').createSync(recursive: true);

      environment.fileSystem.currentDirectory
          .childDirectory('path_provider_linux')
          .childFile('pubspec.yaml')
          .writeAsStringSync(_kSamplePluginPubspec);

      final FlutterProject testProject = FlutterProject.fromDirectoryTest(projectDir);
      await DartPluginRegistrantTarget.test(testProject).build(environment);

      final File generatedMain = projectDir
          .childDirectory('.dart_tool')
          .childDirectory('flutter_build')
          .childFile('generated_main.dart');

      final String mainContent = generatedMain.readAsStringSync();
      expect(
        mainContent,
        equals(
          '//\n'
          '// Generated file. Do not edit.\n'
          '// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.\n'
          '//\n'
          '\n'
          '// @dart = 2.12\n'
          '\n'
          "import 'file:///root/external.dart' as entrypoint;\n"
          "import 'dart:io'; // flutter_ignore: dart_io_import.\n"
          "import 'package:path_provider_linux/path_provider_linux.dart';\n"
          '\n'
          "@pragma('vm:entry-point')\n"
          'class _PluginRegistrant {\n'
          '\n'
          "  @pragma('vm:entry-point')\n"
          '  static void register() {\n'
          '    if (Platform.isLinux) {\n'
          '      try {\n'
          '        PathProviderLinux.registerWith();\n'
          '      } catch (err) {\n'
          '        print(\n'
          "          '`path_provider_linux` threw an error: \$err. '\n"
          "          'The app may not function as expected until you remove this plugin from pubspec.yaml'\n"
          '        );\n'
          '        rethrow;\n'
          '      }\n'
          '\n'
          '    } else if (Platform.isMacOS) {\n'
          '    } else if (Platform.isWindows) {\n'
          '    }\n'
          '  }\n'
          '\n'
          '}\n'
          '\n'
          'typedef _UnaryFunction = dynamic Function(List<String> args);\n'
          'typedef _NullaryFunction = dynamic Function();\n'
          '\n'
          'void main(List<String> args) {\n'
          '  if (entrypoint.main is _UnaryFunction) {\n'
          '    (entrypoint.main as _UnaryFunction)(args);\n'
          '  } else {\n'
          '    (entrypoint.main as _NullaryFunction)();\n'
          '  }\n'
          '}\n'
        ),
      );
    });
  });
}
