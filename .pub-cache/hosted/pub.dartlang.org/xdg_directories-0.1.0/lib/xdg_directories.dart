// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library xdg_directories;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:process/process.dart';

/// An override function used by the tests to override the environment variable
/// lookups using [xdgEnvironmentOverride].
typedef EnvironmentAccessor = String Function(String envVar);

/// A testing setter that replaces the real environment lookups with an override.
///
/// Set to null to stop overriding.
///
/// Only available to tests.
@visibleForTesting
set xdgEnvironmentOverride(EnvironmentAccessor override) {
  _xdgEnvironmentOverride = override;
  _getenv = _xdgEnvironmentOverride ?? _productionGetEnv;
}

/// A testing getter that returns the current value of the override that
/// replaces the real environment lookups with an override.
///
/// Only available to tests.
EnvironmentAccessor get xdgEnvironmentOverride => _xdgEnvironmentOverride;
EnvironmentAccessor _xdgEnvironmentOverride;
EnvironmentAccessor _productionGetEnv =
    (String value) => Platform.environment[value];
EnvironmentAccessor _getenv = _productionGetEnv;

/// A testing function that replaces the process manager used to run xdg-user-path
/// with the one supplied.
///
/// Only available to tests.
@visibleForTesting
set xdgProcessManager(ProcessManager processManager) {
  _processManager = processManager;
}

ProcessManager _processManager = const LocalProcessManager();

List<Directory> _directoryListFromEnvironment(
    String envVar, List<Directory> fallback) {
  assert(envVar != null);
  assert(fallback != null);
  final String value = _getenv(envVar);
  if (value == null || value.isEmpty) {
    return fallback;
  }
  return value.split(':').where((String value) {
    return value.isNotEmpty;
  }).map<Directory>((String entry) {
    return Directory(entry);
  }).toList();
}

Directory _directoryFromEnvironment(String envVar, String fallback) {
  assert(envVar != null);
  final String value = _getenv(envVar);
  if (value == null || value.isEmpty) {
    if (fallback == null) {
      return null;
    }
    return _getDirectory(fallback);
  }
  return Directory(value);
}

// Creates a Directory from a fallback path.
Directory _getDirectory(String subdir) {
  assert(subdir != null);
  assert(subdir.isNotEmpty);
  final String homeDir = _getenv('HOME');
  if (homeDir == null || homeDir.isEmpty) {
    throw StateError(
        'The "HOME" environment variable is not set. This package (and POSIX) '
        'requires that HOME be set.');
  }
  return Directory(path.joinAll(<String>[homeDir, subdir]));
}

/// The base directory relative to which user-specific
/// non-essential (cached) data should be written. (Corresponds to
/// `$XDG_CACHE_HOME`).
///
/// Throws [StateError] if the HOME environment variable is not set.
Directory get cacheHome =>
    _directoryFromEnvironment('XDG_CACHE_HOME', '.cache');

/// The list of preference-ordered base directories relative to
/// which configuration files should be searched. (Corresponds to
/// `$XDG_CONFIG_DIRS`).
///
/// Throws [StateError] if the HOME environment variable is not set.
List<Directory> get configDirs {
  return _directoryListFromEnvironment(
    'XDG_CONFIG_DIRS',
    <Directory>[Directory('/etc/xdg')],
  );
}

/// The a single base directory relative to which user-specific
/// configuration files should be written. (Corresponds to `$XDG_CONFIG_HOME`).
///
/// Throws [StateError] if the HOME environment variable is not set.
Directory get configHome =>
    _directoryFromEnvironment('XDG_CONFIG_HOME', '.config');

/// The list of preference-ordered base directories relative to
/// which data files should be searched. (Corresponds to `$XDG_DATA_DIRS`).
///
/// Throws [StateError] if the HOME environment variable is not set.
List<Directory> get dataDirs {
  return _directoryListFromEnvironment(
    'XDG_DATA_DIRS',
    <Directory>[Directory('/usr/local/share'), Directory('/usr/share')],
  );
}

/// The base directory relative to which user-specific data files should be
/// written. (Corresponds to `$XDG_DATA_HOME`).
///
/// Throws [StateError] if the HOME environment variable is not set.
Directory get dataHome =>
    _directoryFromEnvironment('XDG_DATA_HOME', '.local/share');

/// The base directory relative to which user-specific runtime
/// files and other file objects should be placed. (Corresponds to
/// `$XDG_RUNTIME_DIR`).
///
/// Throws [StateError] if the HOME environment variable is not set.
Directory get runtimeDir => _directoryFromEnvironment('XDG_RUNTIME_DIR', null);

/// Gets the xdg user directory named by `dirName`.
///
/// Use [getUserDirectoryNames] to find out the list of available names.
Directory getUserDirectory(String dirName) {
  final ProcessResult result = _processManager.runSync(
    <String>['xdg-user-dir', dirName],
    includeParentEnvironment: true,
    stdoutEncoding: Encoding.getByName('utf8'),
  );
  final String path = utf8.decode(result.stdout).split('\n')[0];
  return Directory(path);
}

/// Gets the set of user directory names that xdg knows about.
///
/// These are not paths, they are names of xdg values.  Call [getUserDirectory]
/// to get the associated directory.
///
/// These are the names of the variables in "[configHome]/user-dirs.dirs", with
/// the `XDG_` prefix removed and the `_DIR` suffix removed.
Set<String> getUserDirectoryNames() {
  final File configFile = File(path.join(configHome.path, 'user-dirs.dirs'));
  List<String> contents;
  try {
    contents = configFile.readAsLinesSync();
  } on FileSystemException {
    return const <String>{};
  }
  final Set<String> result = <String>{};
  final RegExp dirRegExp =
      RegExp(r'^\s*XDG_(?<dirname>[^=]*)_DIR\s*=\s*(?<dir>.*)\s*$');
  for (String line in contents) {
    final RegExpMatch match = dirRegExp.firstMatch(line);
    if (match == null) {
      continue;
    }
    result.add(match.namedGroup('dirname'));
  }
  return result;
}
