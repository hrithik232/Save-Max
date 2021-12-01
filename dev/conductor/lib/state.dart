// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:file/file.dart' show File;
import 'package:platform/platform.dart';

import './globals.dart';
import './proto/conductor_state.pb.dart' as pb;
import './proto/conductor_state.pbenum.dart' show ReleasePhase;

const String kStateFileName = '.flutter_conductor_state.json';

String luciConsoleLink(String channel, String groupName) {
  assert(
    <String>['stable', 'beta', 'dev', 'master'].contains(channel),
    'channel $channel not recognized',
  );
  assert(
    <String>['framework', 'engine', 'devicelab', 'packaging'].contains(groupName),
    'group named $groupName not recognized',
  );
  final String consoleName = channel == 'master' ? groupName : '${channel}_$groupName';
  return 'https://ci.chromium.org/p/flutter/g/$consoleName/console';
}

String defaultStateFilePath(Platform platform) {
  final String? home = platform.environment['HOME'];
  if (home == null) {
    throw ConductorException(r'Environment variable $HOME must be set!');
  }
  return <String>[
    home,
    kStateFileName,
  ].join(platform.pathSeparator);
}

String presentState(pb.ConductorState state) {
  final StringBuffer buffer = StringBuffer();
  buffer.writeln('Conductor version: ${state.conductorVersion}');
  buffer.writeln('Release channel: ${state.releaseChannel}');
  buffer.writeln('Release version: ${state.releaseVersion}');
  buffer.writeln('');
  buffer.writeln('Release started at: ${DateTime.fromMillisecondsSinceEpoch(state.createdDate.toInt())}');
  buffer.writeln('Last updated at: ${DateTime.fromMillisecondsSinceEpoch(state.lastUpdatedDate.toInt())}');
  buffer.writeln('');
  buffer.writeln('Engine Repo');
  buffer.writeln('\tCandidate branch: ${state.engine.candidateBranch}');
  buffer.writeln('\tStarting git HEAD: ${state.engine.startingGitHead}');
  buffer.writeln('\tCurrent git HEAD: ${state.engine.currentGitHead}');
  buffer.writeln('\tPath to checkout: ${state.engine.checkoutPath}');
  buffer.writeln('\tPost-submit LUCI dashboard: ${luciConsoleLink(state.releaseChannel, 'engine')}');
  if (state.engine.cherrypicks.isNotEmpty) {
    buffer.writeln('${state.engine.cherrypicks.length} Engine Cherrypicks:');
    for (final pb.Cherrypick cherrypick in state.engine.cherrypicks) {
      buffer.writeln('\t${cherrypick.trunkRevision} - ${cherrypick.state}');
    }
  } else {
    buffer.writeln('0 Engine cherrypicks.');
  }
  if (state.engine.dartRevision != null && state.engine.dartRevision.isNotEmpty) {
    buffer.writeln('New Dart SDK revision: ${state.engine.dartRevision}');
  }
  buffer.writeln('Framework Repo');
  buffer.writeln('\tCandidate branch: ${state.framework.candidateBranch}');
  buffer.writeln('\tStarting git HEAD: ${state.framework.startingGitHead}');
  buffer.writeln('\tCurrent git HEAD: ${state.framework.currentGitHead}');
  buffer.writeln('\tPath to checkout: ${state.framework.checkoutPath}');
  buffer.writeln('\tPost-submit LUCI dashboard: ${luciConsoleLink(state.releaseChannel, 'framework')}');
  buffer.writeln('\tDevicelab LUCI dashboard: ${luciConsoleLink(state.releaseChannel, 'devicelab')}');
  if (state.framework.cherrypicks.isNotEmpty) {
    buffer.writeln('${state.framework.cherrypicks.length} Framework Cherrypicks:');
    for (final pb.Cherrypick cherrypick in state.framework.cherrypicks) {
      buffer.writeln('\t${cherrypick.trunkRevision} - ${cherrypick.state}');
    }
  } else {
    buffer.writeln('0 Framework cherrypicks.');
  }
  buffer.writeln('');
  if (state.currentPhase == ReleasePhase.VERIFY_RELEASE) {
    buffer.writeln(
      '${state.releaseChannel} release ${state.releaseVersion} has been published and verified.\n',
    );
    return buffer.toString();
  }
  buffer.writeln('The current phase is:');
  buffer.writeln(presentPhases(state.currentPhase));

  buffer.writeln(phaseInstructions(state));
  buffer.writeln('');
  buffer.writeln('Issue `conductor next` when you are ready to proceed.');
  return buffer.toString();
}

String presentPhases(ReleasePhase currentPhase) {
  final StringBuffer buffer = StringBuffer();
  bool phaseCompleted = true;

  for (final ReleasePhase phase in ReleasePhase.values) {
    if (phase == currentPhase) {
      // This phase will execute the next time `conductor next` is run.
      buffer.writeln('> ${phase.name} (current)');
      phaseCompleted = false;
    } else if (phaseCompleted) {
      // This phase was already completed.
      buffer.writeln('✓ ${phase.name}');
    } else {
      // This phase has not been completed yet.
      buffer.writeln('  ${phase.name}');
    }
  }
  return buffer.toString();
}

String phaseInstructions(pb.ConductorState state) {
  switch (state.currentPhase) {
    case ReleasePhase.APPLY_ENGINE_CHERRYPICKS:
      if (state.engine.cherrypicks.isEmpty) {
        return <String>[
          'There are no engine cherrypicks, so issue `conductor next` to continue',
          'to the next step.',
        ].join('\n');
      }
      return <String>[
        'You must now manually apply the following engine cherrypicks to the checkout',
        'at ${state.engine.checkoutPath} in order:',
        for (final pb.Cherrypick cherrypick in state.engine.cherrypicks) '\t${cherrypick.trunkRevision}',
        'See $kReleaseDocumentationUrl for more information.',
      ].join('\n');
    case ReleasePhase.CODESIGN_ENGINE_BINARIES:
      if (!requiresEnginePR(state)) {
        return 'You must now codesign the engine binaries for commit '
            '${state.engine.startingGitHead}.';
      }
      // User's working branch was pushed to their mirror, but a PR needs to be
      // opened on GitHub.
      final String newPrLink = getNewPrLink(
        userName: githubAccount(state.engine.mirror.url),
        repoName: 'engine',
        state: state,
      );
      return <String>[
        'Your working branch ${state.engine.workingBranch} was pushed to your mirror.',
        'You must now open a pull request at $newPrLink, verify pre-submit CI',
        'builds on your engine pull request are successful, merge your pull request,',
        'validate post-submit CI, and then codesign the binaries on the merge commit.',
      ].join('\n');
    case ReleasePhase.APPLY_FRAMEWORK_CHERRYPICKS:
      final List<pb.Cherrypick> outstandingCherrypicks = state.framework.cherrypicks.where(
        (pb.Cherrypick cp) {
          return cp.state == pb.CherrypickState.PENDING || cp.state == pb.CherrypickState.PENDING_WITH_CONFLICT;
        },
      ).toList();
      if (outstandingCherrypicks.isNotEmpty) {
        return <String>[
          'You must now manually apply the following framework cherrypicks to the checkout',
          'at ${state.framework.checkoutPath} in order:',
          for (final pb.Cherrypick cherrypick in outstandingCherrypicks) '\t${cherrypick.trunkRevision}',
        ].join('\n');
      }
      return <String>['Either all cherrypicks have been auto-applied or there were none.'].join('\n');
    case ReleasePhase.PUBLISH_VERSION:
      if (!requiresFrameworkPR(state)) {
        return 'Since there are no code changes in this release, no Framework '
            'PR is necessary.';
      }

      final String newPrLink = getNewPrLink(
        userName: githubAccount(state.framework.mirror.url),
        repoName: 'flutter',
        state: state,
      );
      return <String>[
        'Your working branch ${state.framework.workingBranch} was pushed to your mirror.',
        'You must now open a pull request at $newPrLink',
        'verify pre-submit CI builds on your pull request are successful, merge your ',
        'pull request, validate post-submit CI.',
      ].join('\n');
    case ReleasePhase.PUBLISH_CHANNEL:
      return 'Issue `conductor next` to publish your release to the release branch.';
    case ReleasePhase.VERIFY_RELEASE:
      return 'Release archive packages must be verified on cloud storage: ${luciConsoleLink(state.releaseChannel, 'packaging')}';
    case ReleasePhase.RELEASE_COMPLETED:
      return 'This release has been completed.';
  }
  // For analyzer
  throw ConductorException('Unimplemented phase ${state.currentPhase}');
}

/// Regex pattern for git remote host URLs.
///
/// First group = git host (currently must be github.com)
/// Second group = account name
/// Third group = repo name
final RegExp githubRemotePattern =
    RegExp(r'^(git@github\.com:|https?:\/\/github\.com\/)([a-zA-Z0-9_-]+)\/([a-zA-Z0-9_-]+)(\.git)?$');

/// Parses a Git remote URL and returns the account name.
///
/// Uses [githubRemotePattern].
String githubAccount(String remoteUrl) {
  final String engineUrl = remoteUrl;
  final RegExpMatch? match = githubRemotePattern.firstMatch(engineUrl);
  if (match == null) {
    throw ConductorException(
      'Cannot determine the GitHub account from $engineUrl',
    );
  }
  final String? accountName = match.group(2);
  if (accountName == null || accountName.isEmpty) {
    throw ConductorException(
      'Cannot determine the GitHub account from $match',
    );
  }
  return accountName;
}

/// Returns the next phase in the ReleasePhase enum.
///
/// Will throw a [ConductorException] if [ReleasePhase.RELEASE_COMPLETED] is
/// passed as an argument, as there is no next phase.
ReleasePhase getNextPhase(ReleasePhase currentPhase) {
  assert(currentPhase != null);
  final ReleasePhase? nextPhase = ReleasePhase.valueOf(currentPhase.value + 1);
  if (nextPhase == null) {
    throw ConductorException('There is no next ReleasePhase!');
  }
  return nextPhase;
}

void writeStateToFile(File file, pb.ConductorState state, List<String> logs) {
  state.logs.addAll(logs);
  file.writeAsStringSync(
    jsonEncode(state.toProto3Json()),
    flush: true,
  );
}

pb.ConductorState readStateFromFile(File file) {
  final pb.ConductorState state = pb.ConductorState();
  final String stateAsString = file.readAsStringSync();
  state.mergeFromProto3Json(
    jsonDecode(stateAsString),
  );
  return state;
}

/// This release will require a new Engine PR.
///
/// The logic is if there are engine cherrypicks that have not been abandoned OR
/// there is a new Dart revision, then return true, else false.
bool requiresEnginePR(pb.ConductorState state) {
  final bool hasRequiredCherrypicks = state.engine.cherrypicks.any(
    (pb.Cherrypick cp) => cp.state != pb.CherrypickState.ABANDONED,
  );
  if (hasRequiredCherrypicks) {
    return true;
  }
  return state.engine.dartRevision.isNotEmpty;
}

/// This release will require a new Framework PR.
///
/// The logic is if there was an Engine PR OR there are framework cherrypicks
/// that have not been abandoned OR the increment level is 'm', then return
/// true, else false.
bool requiresFrameworkPR(pb.ConductorState state) {
  if (requiresEnginePR(state)) {
    return true;
  }
  final bool hasRequiredCherrypicks =
      state.framework.cherrypicks.any((pb.Cherrypick cp) => cp.state != pb.CherrypickState.ABANDONED);
  if (hasRequiredCherrypicks) {
    return true;
  }
  if (state.incrementLevel == 'm') {
    // requires an update to .ci.yaml
    return true;
  }
  return false;
}
