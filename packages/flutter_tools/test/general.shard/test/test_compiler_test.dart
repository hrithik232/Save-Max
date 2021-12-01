// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'package:file/memory.dart';
import 'package:flutter_tools/src/base/file_system.dart';
import 'package:flutter_tools/src/base/logger.dart';
import 'package:flutter_tools/src/base/platform.dart';
import 'package:flutter_tools/src/build_info.dart';
import 'package:flutter_tools/src/compile.dart';
import 'package:flutter_tools/src/project.dart';
import 'package:flutter_tools/src/test/test_compiler.dart';
import 'package:package_config/package_config_types.dart';
import 'package:test/fake.dart';

import '../../src/common.dart';
import '../../src/context.dart';

final Platform linuxPlatform = FakePlatform(
  operatingSystem: 'linux',
  environment: <String, String>{},
);

final BuildInfo debugBuild = BuildInfo(
  BuildMode.debug,
  '',
  treeShakeIcons: false,
  packageConfig: PackageConfig(<Package>[
    Package('test_api', Uri.parse('file:///test_api/')),
  ])
);

void main() {
  FakeResidentCompiler residentCompiler;
  FileSystem fileSystem;

  setUp(() {
    fileSystem = MemoryFileSystem.test();
    fileSystem.file('pubspec.yaml').createSync();
    fileSystem.file('test/foo.dart').createSync(recursive: true);
    residentCompiler = FakeResidentCompiler(fileSystem);
  });

  testUsingContext('TestCompiler reports a dill file when compile is successful', () async {
    residentCompiler.compilerOutput = const CompilerOutput('abc.dill', 0, <Uri>[]);
    final FakeTestCompiler testCompiler = FakeTestCompiler(
      debugBuild,
      FlutterProject.fromDirectoryTest(fileSystem.currentDirectory),
      residentCompiler,
    );

    expect(await testCompiler.compile(Uri.parse('test/foo.dart')), 'test/foo.dart.dill');
  }, overrides: <Type, Generator>{
    FileSystem: () => fileSystem,
    Platform: () => linuxPlatform,
    ProcessManager: () => FakeProcessManager.any(),
    Logger: () => BufferLogger.test(),
  });

  testUsingContext('TestCompiler does not try to cache the dill file when precompiled dill is passed', () async {
    residentCompiler.compilerOutput = const CompilerOutput('abc.dill', 0, <Uri>[]);
    final FakeTestCompiler testCompiler = FakeTestCompiler(
      debugBuild,
      FlutterProject.fromDirectoryTest(fileSystem.currentDirectory),
      residentCompiler,
      precompiledDillPath: 'precompiled.dill',
    );

    expect(await testCompiler.compile(Uri.parse('test/foo.dart')), 'abc.dill');
  }, overrides: <Type, Generator>{
    FileSystem: () => fileSystem,
    Platform: () => linuxPlatform,
    ProcessManager: () => FakeProcessManager.any(),
    Logger: () => BufferLogger.test(),
  });

  testUsingContext('TestCompiler reports null when a compile fails', () async {
    residentCompiler.compilerOutput = const CompilerOutput('abc.dill', 1, <Uri>[]);
    final FakeTestCompiler testCompiler = FakeTestCompiler(
      debugBuild,
      FlutterProject.fromDirectoryTest(fileSystem.currentDirectory),
      residentCompiler,
    );

    expect(await testCompiler.compile(Uri.parse('test/foo.dart')), null);
    expect(residentCompiler.didShutdown, true);
  }, overrides: <Type, Generator>{
    FileSystem: () => fileSystem,
    Platform: () => linuxPlatform,
    ProcessManager: () => FakeProcessManager.any(),
    Logger: () => BufferLogger.test(),
  });

  testUsingContext('TestCompiler disposing test compiler shuts down backing compiler', () async {
    final FakeTestCompiler testCompiler = FakeTestCompiler(
      debugBuild,
      FlutterProject.fromDirectoryTest(fileSystem.currentDirectory),
      residentCompiler,
    );
    testCompiler.compiler = residentCompiler;

    expect(testCompiler.compilerController.isClosed, false);

    await testCompiler.dispose();

    expect(testCompiler.compilerController.isClosed, true);
    expect(residentCompiler.didShutdown, true);
  }, overrides: <Type, Generator>{
    FileSystem: () => fileSystem,
    Platform: () => linuxPlatform,
    ProcessManager: () => FakeProcessManager.any(),
    Logger: () => BufferLogger.test(),
  });
}

/// Override the creation of the Resident Compiler to simplify testing.
class FakeTestCompiler extends TestCompiler {
  FakeTestCompiler(
    BuildInfo buildInfo,
    FlutterProject flutterProject,
    this.residentCompiler, {
      String precompiledDillPath,
    }
  ) : super(buildInfo, flutterProject, precompiledDillPath: precompiledDillPath);

  final FakeResidentCompiler residentCompiler;

  @override
  Future<ResidentCompiler> createCompiler() async {
    return residentCompiler;
  }
}

class FakeResidentCompiler extends Fake implements ResidentCompiler {
  FakeResidentCompiler(this.fileSystem);

  final FileSystem fileSystem;

  CompilerOutput compilerOutput;
  bool didShutdown = false;

  @override
  Future<CompilerOutput> recompile(
    Uri mainUri,
    List<Uri> invalidatedFiles, {
    String outputPath,
    PackageConfig packageConfig,
    String projectRootPath,
    FileSystem fs,
    bool suppressErrors = false,
  }) async {
    if (compilerOutput != null) {
      fileSystem.file(compilerOutput.outputFilename).createSync(recursive: true);
    }
    return compilerOutput;
  }

  @override
  void accept() { }

  @override
  void reset() { }

  @override
  Future<void> shutdown() async {
    didShutdown = true;
  }
}
