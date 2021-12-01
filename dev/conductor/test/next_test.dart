// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:args/command_runner.dart';
import 'package:conductor/next.dart';
import 'package:conductor/proto/conductor_state.pb.dart' as pb;
import 'package:conductor/proto/conductor_state.pbenum.dart' show ReleasePhase;
import 'package:conductor/repository.dart';
import 'package:conductor/state.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:platform/platform.dart';

import './common.dart';
import '../../../packages/flutter_tools/test/src/fake_process_manager.dart';

void main() {
  group('next command', () {
    const String flutterRoot = '/flutter';
    const String checkoutsParentDirectory = '$flutterRoot/dev/conductor';
    const String candidateBranch = 'flutter-1.2-candidate.3';
    const String workingBranch = 'cherrypicks-$candidateBranch';
    final String localPathSeparator = const LocalPlatform().pathSeparator;
    final String localOperatingSystem = const LocalPlatform().pathSeparator;
    const String revision1 = 'd3af60d18e01fcb36e0c0fa06c8502e4935ed095';
    const String revision2 = 'f99555c1e1392bf2a8135056b9446680c2af4ddf';
    const String revision3 = '98a5ca242b9d270ce000b26309b8a3cdc9c89df5';
    const String releaseVersion = '1.2.0-3.0.pre';
    const String releaseChannel = 'beta';
    late MemoryFileSystem fileSystem;
    late TestStdio stdio;
    const String stateFile = '/state-file.json';

    setUp(() {
      stdio = TestStdio();
      fileSystem = MemoryFileSystem.test();
    });

    CommandRunner<void> createRunner({
      required Checkouts checkouts,
    }) {
      final NextCommand command = NextCommand(
        checkouts: checkouts,
      );
      return CommandRunner<void>('codesign-test', '')..addCommand(command);
    }

    test('throws if no state file found', () async {
      final FakeProcessManager processManager = FakeProcessManager.list(
        <FakeCommand>[],
      );
      final FakePlatform platform = FakePlatform(
        environment: <String, String>{
          'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
        },
        operatingSystem: localOperatingSystem,
        pathSeparator: localPathSeparator,
      );
      final Checkouts checkouts = Checkouts(
        fileSystem: fileSystem,
        parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
        platform: platform,
        processManager: processManager,
        stdio: stdio,
      );
      final CommandRunner<void> runner = createRunner(checkouts: checkouts);
      expect(
        () async => runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]),
        throwsExceptionWith('No persistent state file found at $stateFile'),
      );
    });

    group('APPLY_ENGINE_CHERRYPICKS to CODESIGN_ENGINE_BINARIES', () {
      test('does not prompt user and updates currentPhase if there are no engine cherrypicks', () async {
        final FakeProcessManager processManager = FakeProcessManager.list(
          <FakeCommand>[],
        );
        final FakePlatform platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
        final pb.ConductorState state = pb.ConductorState(
          currentPhase: ReleasePhase.APPLY_ENGINE_CHERRYPICKS,
          engine: pb.Repository(
            startingGitHead: revision1,
          ),
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(processManager, hasNoRemainingExpectations);
        expect(finalState.currentPhase, ReleasePhase.CODESIGN_ENGINE_BINARIES);
        expect(stdio.error, isEmpty);
        expect(
          stdio.stdout,
          contains('You must now codesign the engine binaries for commit $revision1'));
      });

      test('confirms to stdout when all engine cherrypicks were auto-applied', () async {
        const String remoteUrl = 'https://github.com/org/repo.git';
        stdio.stdin.add('n');
        final FakeProcessManager processManager = FakeProcessManager.empty();
        final FakePlatform platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
        final pb.ConductorState state = pb.ConductorState(
          engine: pb.Repository(
            cherrypicks: <pb.Cherrypick>[
              pb.Cherrypick(
                trunkRevision: 'abc123',
                state: pb.CherrypickState.COMPLETED,
              ),
            ],
            workingBranch: workingBranch,
            upstream: pb.Remote(name: 'upstream', url: remoteUrl),
            mirror: pb.Remote(name: 'mirror', url: remoteUrl),
          ),
          currentPhase: ReleasePhase.APPLY_ENGINE_CHERRYPICKS,
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        expect(processManager, hasNoRemainingExpectations);
        expect(
          stdio.stdout,
          contains('All engine cherrypicks have been auto-applied by the conductor'),
        );
      });

      test('updates lastPhase if user responds yes', () async {
        const String remoteUrl = 'https://github.com/org/repo.git';
        const String releaseChannel = 'dev';
        stdio.stdin.add('y');
        final FakeProcessManager processManager = FakeProcessManager.list(<FakeCommand>[
          const FakeCommand(
            command: <String>['git', 'fetch', 'upstream'],
          ),
          const FakeCommand(command: <String>['git', 'checkout', workingBranch]),
          const FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
          const FakeCommand(command: <String>['git', 'push', 'mirror', '$revision1:$workingBranch']),
        ]);
        final FakePlatform platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
        final pb.ConductorState state = pb.ConductorState(
          currentPhase: ReleasePhase.APPLY_ENGINE_CHERRYPICKS,
          engine: pb.Repository(
            candidateBranch: candidateBranch,
            cherrypicks: <pb.Cherrypick>[
              pb.Cherrypick(
                trunkRevision: revision2,
                state: pb.CherrypickState.PENDING,
              ),
            ],
            workingBranch: workingBranch,
            upstream: pb.Remote(name: 'upstream', url: remoteUrl),
            mirror: pb.Remote(name: 'mirror', url: remoteUrl),
          ),
          releaseChannel: releaseChannel,
          releaseVersion: releaseVersion,
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(processManager, hasNoRemainingExpectations);
        expect(
          stdio.stdout,
          contains('You must now open a pull request at https://github.com/flutter/engine/compare/flutter-1.2-candidate.3...org:cherrypicks-flutter-1.2-candidate.3?expand=1'));
        expect(stdio.stdout, contains(
                'Are you ready to push your engine branch to the repository $remoteUrl? (y/n) '));
        expect(finalState.currentPhase, ReleasePhase.CODESIGN_ENGINE_BINARIES);
        expect(stdio.error, isEmpty);
      });
    });

    group('CODESIGN_ENGINE_BINARIES to APPLY_FRAMEWORK_CHERRYPICKS', () {
      late pb.ConductorState state;
      late FakeProcessManager processManager;
      late FakePlatform platform;

      setUp(() {
        state = pb.ConductorState(
          engine: pb.Repository(
            cherrypicks: <pb.Cherrypick>[
              pb.Cherrypick(
                trunkRevision: 'abc123',
                state: pb.CherrypickState.PENDING,
              ),
            ],
          ),
          currentPhase: ReleasePhase.CODESIGN_ENGINE_BINARIES,
        );

        processManager = FakeProcessManager.empty();

        platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
      });

      test('does not update currentPhase if user responds no', () async {
        stdio.stdin.add('n');
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(stdio.stdout, contains('Has CI passed for the engine PR and binaries been codesigned? (y/n) '));
        expect(finalState.currentPhase, ReleasePhase.CODESIGN_ENGINE_BINARIES);
        expect(stdio.error.contains('Aborting command.'), true);
      });

      test('updates currentPhase if user responds yes', () async {
        stdio.stdin.add('y');
        final FakePlatform platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(stdio.stdout, contains('Has CI passed for the engine PR and binaries been codesigned? (y/n) '));
        expect(finalState.currentPhase, ReleasePhase.APPLY_FRAMEWORK_CHERRYPICKS);
      });
    });

    group('APPLY_FRAMEWORK_CHERRYPICKS to PUBLISH_VERSION', () {
      const String mirrorRemoteUrl = 'https://github.com/org/repo.git';
      const String upstreamRemoteUrl = 'https://github.com/mirror/repo.git';
      const String engineUpstreamRemoteUrl = 'https://github.com/mirror/engine.git';
      const String frameworkCheckoutPath = '$checkoutsParentDirectory/framework';
      const String engineCheckoutPath = '$checkoutsParentDirectory/engine';
      const String oldEngineVersion = '000000001';
      const String frameworkCherrypick = '431ae69b4dd2dd48f7ba0153671e0311014c958b';
      late FakeProcessManager processManager;
      late FakePlatform platform;
      late pb.ConductorState state;

      setUp(() {
        processManager = FakeProcessManager.empty();
        platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
        state = pb.ConductorState(
          releaseChannel: releaseChannel,
          releaseVersion: releaseVersion,
          framework: pb.Repository(
            candidateBranch: candidateBranch,
            checkoutPath: frameworkCheckoutPath,
            cherrypicks: <pb.Cherrypick>[
              pb.Cherrypick(
                trunkRevision: frameworkCherrypick,
                state: pb.CherrypickState.PENDING,
              ),
            ],
            mirror: pb.Remote(name: 'mirror', url: mirrorRemoteUrl),
            upstream: pb.Remote(name: 'upstream', url: upstreamRemoteUrl),
            workingBranch: workingBranch,
          ),
          engine: pb.Repository(
            candidateBranch: candidateBranch,
            checkoutPath: engineCheckoutPath,
            dartRevision: 'cdef0123',
            workingBranch: workingBranch,
            upstream: pb.Remote(name: 'upstream', url: engineUpstreamRemoteUrl),
          ),
          currentPhase: ReleasePhase.APPLY_FRAMEWORK_CHERRYPICKS,
        );
        // create engine repo
        fileSystem.directory(engineCheckoutPath).createSync(recursive: true);
        // create framework repo
        final Directory frameworkDir = fileSystem.directory(frameworkCheckoutPath);
        final File engineRevisionFile = frameworkDir
            .childDirectory('bin')
            .childDirectory('internal')
            .childFile('engine.version');
        engineRevisionFile.createSync(recursive: true);
        engineRevisionFile.writeAsStringSync(oldEngineVersion, flush: true);
      });

      test('with no dart, engine or framework cherrypicks, no user input, no PR needed', () async {
        state = pb.ConductorState(
          framework: pb.Repository(
            candidateBranch: candidateBranch,
            checkoutPath: frameworkCheckoutPath,
            mirror: pb.Remote(name: 'mirror', url: mirrorRemoteUrl),
            upstream: pb.Remote(name: 'upstream', url: upstreamRemoteUrl),
            workingBranch: workingBranch,
          ),
          engine: pb.Repository(
            candidateBranch: candidateBranch,
            checkoutPath: engineCheckoutPath,
            upstream: pb.Remote(name: 'upstream', url: engineUpstreamRemoteUrl),
          ),
          currentPhase: ReleasePhase.APPLY_FRAMEWORK_CHERRYPICKS,
        );

        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );

        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);

        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(finalState.currentPhase, ReleasePhase.PUBLISH_VERSION);
        expect(stdio.error, isEmpty);
        expect(
          stdio.stdout,
          contains('pull request is not required'),
        );
      });

      test('with no engine cherrypicks but a dart revision update, updates engine revision', () async {
        stdio.stdin.add('n');
        processManager.addCommands(const <FakeCommand>[
          FakeCommand(command: <String>['git', 'fetch', 'upstream']),
          // we want merged upstream commit, not local working commit
          FakeCommand(command: <String>['git', 'checkout', 'upstream/$candidateBranch']),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
          FakeCommand(command: <String>['git', 'fetch', 'upstream']),
          FakeCommand(command: <String>['git', 'checkout', workingBranch]),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision2,
          ),
          FakeCommand(command: <String>['git', 'add', '--all']),
          FakeCommand(command: <String>[
            'git',
            'commit',
            "--message='Update Engine revision to $revision1 for $releaseChannel release $releaseVersion'",
          ]),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision3,
          ),
        ]);
        final pb.ConductorState state = pb.ConductorState(
          releaseChannel: releaseChannel,
          releaseVersion: releaseVersion,
          currentPhase: ReleasePhase.APPLY_FRAMEWORK_CHERRYPICKS,
          framework: pb.Repository(
            candidateBranch: candidateBranch,
            checkoutPath: frameworkCheckoutPath,
            mirror: pb.Remote(name: 'mirror', url: mirrorRemoteUrl),
            upstream: pb.Remote(name: 'upstream', url: upstreamRemoteUrl),
            workingBranch: workingBranch,
          ),
          engine: pb.Repository(
            candidateBranch: candidateBranch,
            checkoutPath: engineCheckoutPath,
            upstream: pb.Remote(name: 'upstream', url: engineUpstreamRemoteUrl),
            dartRevision: 'abc123',
          ),
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        expect(processManager, hasNoRemainingExpectations);
        expect(stdio.stdout, contains('Updating engine revision from $oldEngineVersion to $revision1'));
        expect(stdio.stdout, contains('a framework PR is still\nrequired to roll engine cherrypicks.'));
      });

      test('does not update state.currentPhase if user responds no', () async {
        stdio.stdin.add('n');
        processManager.addCommands(const <FakeCommand>[
          FakeCommand(command: <String>['git', 'fetch', 'upstream']),
          // we want merged upstream commit, not local working commit
          FakeCommand(command: <String>['git', 'checkout', 'upstream/$candidateBranch']),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
          FakeCommand(command: <String>['git', 'fetch', 'upstream']),
          FakeCommand(command: <String>['git', 'checkout', workingBranch]),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision2,
          ),
          FakeCommand(command: <String>['git', 'add', '--all']),
          FakeCommand(command: <String>[
            'git',
            'commit',
            "--message='Update Engine revision to $revision1 for $releaseChannel release $releaseVersion'",
          ]),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision3,
          ),
        ]);
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(stdio.stdout, contains('Are you ready to push your framework branch to the repository $mirrorRemoteUrl? (y/n) '));
        expect(stdio.error, contains('Aborting command.'));
        expect(finalState.currentPhase, ReleasePhase.APPLY_FRAMEWORK_CHERRYPICKS);
      });

      test('updates state.currentPhase if user responds yes', () async {
        stdio.stdin.add('y');
        processManager.addCommands(const <FakeCommand>[
          // Engine repo
          FakeCommand(command: <String>['git', 'fetch', 'upstream']),
          // we want merged upstream commit, not local working commit
          FakeCommand(command: <String>['git', 'checkout', 'upstream/$candidateBranch']),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
          // Framework repo
          FakeCommand(command: <String>['git', 'fetch', 'upstream']),
          FakeCommand(command: <String>['git', 'checkout', workingBranch]),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision2,
          ),
          FakeCommand(command: <String>['git', 'add', '--all']),
          FakeCommand(command: <String>[
            'git',
            'commit',
            "--message='Update Engine revision to $revision1 for $releaseChannel release $releaseVersion'",
          ]),
          FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision3,
          ),
          FakeCommand(
            command: <String>['git', 'push', 'mirror', '$revision2:$workingBranch'],
          ),
        ]);
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(finalState.currentPhase, ReleasePhase.PUBLISH_VERSION);
        expect(
          stdio.stdout,
          contains('Rolling new engine hash $revision1 to framework checkout...'),
        );
        expect(
          stdio.stdout,
          contains('There were 1 cherrypicks that were not auto-applied'),
        );
        expect(
          stdio.stdout,
          contains('Are you ready to push your framework branch to the repository $mirrorRemoteUrl? (y/n)'),
        );
        expect(
          stdio.stdout,
          contains('Executed command: `git push mirror $revision2:$workingBranch`'),
        );
        expect(stdio.error, isEmpty);
      });
    });

    group('PUBLISH_VERSION to PUBLISH_CHANNEL', () {
      const String remoteName = 'upstream';
      const String releaseVersion = '1.2.0-3.0.pre';
      late pb.ConductorState state;
      late FakePlatform platform;

      setUp(() {
        state = pb.ConductorState(
          currentPhase: ReleasePhase.PUBLISH_VERSION,
          framework: pb.Repository(
            candidateBranch: candidateBranch,
            upstream: pb.Remote(url: FrameworkRepository.defaultUpstream),
          ),
          releaseVersion: releaseVersion,
        );
        platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
      });

      test('does not update state.currentPhase if user responds no', () async {
        stdio.stdin.add('n');
        final FakeProcessManager processManager = FakeProcessManager.list(
          <FakeCommand>[
            const FakeCommand(
              command: <String>['git', 'fetch', 'upstream'],
            ),
            const FakeCommand(
              command: <String>['git', 'checkout', '$remoteName/$candidateBranch'],
            ),
            const FakeCommand(
              command: <String>['git', 'rev-parse', 'HEAD'],
              stdout: revision1,
            ),
          ],
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(processManager, hasNoRemainingExpectations);
        expect(stdio.stdout, contains('Are you ready to tag commit $revision1 as $releaseVersion'));
        expect(stdio.error, contains('Aborting command.'));
        expect(finalState.currentPhase, ReleasePhase.PUBLISH_VERSION);
        expect(finalState.logs, stdio.logs);
      });

      test('updates state.currentPhase if user responds yes', () async {
        stdio.stdin.add('y');
        final FakeProcessManager processManager = FakeProcessManager.list(<FakeCommand>[
          const FakeCommand(
            command: <String>['git', 'fetch', 'upstream'],
          ),
          const FakeCommand(
            command: <String>['git', 'checkout', '$remoteName/$candidateBranch'],
          ),
          const FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
          const FakeCommand(
            command: <String>['git', 'tag', releaseVersion, revision1],
          ),
          const FakeCommand(
            command: <String>['git', 'push', remoteName, releaseVersion],
          ),
        ]);
        final FakePlatform platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(processManager, hasNoRemainingExpectations);
        expect(finalState.currentPhase, ReleasePhase.PUBLISH_CHANNEL);
        expect(stdio.stdout, contains('Are you ready to tag commit $revision1 as $releaseVersion'));
        expect(finalState.logs, stdio.logs);
      });
    });

    group('PUBLISH_CHANNEL to VERIFY_RELEASE', () {
      const String remoteName = 'upstream';
      late pb.ConductorState state;
      late FakePlatform platform;

      setUp(() {
        state = pb.ConductorState(
          currentPhase: ReleasePhase.PUBLISH_CHANNEL,
          framework: pb.Repository(
            candidateBranch: candidateBranch,
            upstream: pb.Remote(url: FrameworkRepository.defaultUpstream),
          ),
          releaseChannel: releaseChannel,
          releaseVersion: releaseVersion,
        );
        platform = FakePlatform(
          environment: <String, String>{
            'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
          },
          operatingSystem: localOperatingSystem,
          pathSeparator: localPathSeparator,
        );
      });

      test('does not update currentPhase if user responds no', () async {
        stdio.stdin.add('n');
        final FakeProcessManager processManager = FakeProcessManager.list(<FakeCommand>[
          const FakeCommand(
            command: <String>['git', 'fetch', 'upstream'],
          ),
          const FakeCommand(
            command: <String>['git', 'checkout', '$remoteName/$candidateBranch'],
          ),
          const FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
        ]);
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(processManager, hasNoRemainingExpectations);
        expect(stdio.error, contains('Aborting command.'));
        expect(
          stdio.stdout,
          contains('About to execute command: `git push ${FrameworkRepository.defaultUpstream} $revision1:$releaseChannel`'),
        );
        expect(finalState.currentPhase, ReleasePhase.PUBLISH_CHANNEL);
      });

      test('updates currentPhase if user responds yes', () async {
        stdio.stdin.add('y');
        final FakeProcessManager processManager = FakeProcessManager.list(<FakeCommand>[
          const FakeCommand(
            command: <String>['git', 'fetch', 'upstream'],
          ),
          const FakeCommand(
            command: <String>['git', 'checkout', '$remoteName/$candidateBranch'],
          ),
          const FakeCommand(
            command: <String>['git', 'rev-parse', 'HEAD'],
            stdout: revision1,
          ),
          const FakeCommand(
            command: <String>['git', 'push', FrameworkRepository.defaultUpstream, '$revision1:$releaseChannel'],
          ),
        ]);
        writeStateToFile(
          fileSystem.file(stateFile),
          state,
          <String>[],
        );
        final Checkouts checkouts = Checkouts(
          fileSystem: fileSystem,
          parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
          platform: platform,
          processManager: processManager,
          stdio: stdio,
        );
        final CommandRunner<void> runner = createRunner(checkouts: checkouts);
        await runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]);

        final pb.ConductorState finalState = readStateFromFile(
          fileSystem.file(stateFile),
        );

        expect(processManager, hasNoRemainingExpectations);
        expect(stdio.error, isEmpty);
        expect(
          stdio.stdout,
          contains('About to execute command: `git push ${FrameworkRepository.defaultUpstream} $revision1:$releaseChannel`'),
        );
        expect(
          stdio.stdout,
          contains('Release archive packages must be verified on cloud storage: https://ci.chromium.org/p/flutter/g/beta_packaging/console'),
        );
        expect(finalState.currentPhase, ReleasePhase.VERIFY_RELEASE);
      });
    });

    test('throws exception if state.currentPhase is RELEASE_COMPLETED', () async {
      final FakeProcessManager processManager = FakeProcessManager.empty();
      final FakePlatform platform = FakePlatform(
        environment: <String, String>{
          'HOME': <String>['path', 'to', 'home'].join(localPathSeparator),
        },
        operatingSystem: localOperatingSystem,
        pathSeparator: localPathSeparator,
      );
      final pb.ConductorState state = pb.ConductorState(
        currentPhase: ReleasePhase.RELEASE_COMPLETED,
      );
      writeStateToFile(
        fileSystem.file(stateFile),
        state,
        <String>[],
      );
      final Checkouts checkouts = Checkouts(
        fileSystem: fileSystem,
        parentDirectory: fileSystem.directory(checkoutsParentDirectory)..createSync(recursive: true),
        platform: platform,
        processManager: processManager,
        stdio: stdio,
      );
      final CommandRunner<void> runner = createRunner(checkouts: checkouts);
      expect(
        () async => runner.run(<String>[
          'next',
          '--$kStateOption',
          stateFile,
        ]),
        throwsExceptionWith('This release is finished.'),
      );
    });
  }, onPlatform: <String, dynamic>{
    'windows': const Skip('Flutter Conductor only supported on macos/linux'),
  });
}
