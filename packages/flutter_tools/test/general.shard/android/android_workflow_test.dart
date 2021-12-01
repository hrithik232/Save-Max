// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'package:file/memory.dart';
import 'package:flutter_tools/src/android/android_sdk.dart';
import 'package:flutter_tools/src/android/android_workflow.dart';
import 'package:flutter_tools/src/base/file_system.dart';
import 'package:flutter_tools/src/base/logger.dart';
import 'package:flutter_tools/src/base/os.dart';
import 'package:flutter_tools/src/base/platform.dart';
import 'package:flutter_tools/src/base/user_messages.dart';
import 'package:flutter_tools/src/base/version.dart';
import 'package:flutter_tools/src/doctor_validator.dart';
import 'package:test/fake.dart';

import '../../src/common.dart';
import '../../src/context.dart';
import '../../src/fakes.dart';

void main() {
  FakeAndroidSdk sdk;
  Logger logger;
  MemoryFileSystem fileSystem;
  FakeProcessManager processManager;
  FakeStdio stdio;

  setUp(() {
    sdk = FakeAndroidSdk();
    fileSystem = MemoryFileSystem.test();
    fileSystem.directory('/home/me').createSync(recursive: true);
    logger = BufferLogger.test();
    processManager = FakeProcessManager.empty();
    stdio = FakeStdio();
  });

  testWithoutContext('AndroidWorkflow handles a null AndroidSDK', () {
    final AndroidWorkflow androidWorkflow = AndroidWorkflow(
      featureFlags: TestFeatureFlags(),
      androidSdk: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(androidWorkflow.canLaunchDevices, false);
    expect(androidWorkflow.canListDevices, false);
    expect(androidWorkflow.canListEmulators, false);
  });

  testWithoutContext('AndroidWorkflow handles a null adb', () {
    final FakeAndroidSdk androidSdk = FakeAndroidSdk();
    androidSdk.adbPath = null;
    final AndroidWorkflow androidWorkflow = AndroidWorkflow(
      featureFlags: TestFeatureFlags(),
      androidSdk: androidSdk,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(androidWorkflow.canLaunchDevices, false);
    expect(androidWorkflow.canListDevices, false);
    expect(androidWorkflow.canListEmulators, false);
  });

  // Android Studio is not currently supported on Linux Arm64 hosts.
  testWithoutContext('Not supported AndroidStudio on Linux Arm Hosts', () {
    final FakeAndroidSdk androidSdk = FakeAndroidSdk();
    androidSdk.adbPath = null;
    final AndroidWorkflow androidWorkflow = AndroidWorkflow(
      featureFlags: TestFeatureFlags(),
      androidSdk: androidSdk,
      operatingSystemUtils: CustomFakeOperatingSystemUtils(hostPlatform: HostPlatform.linux_arm64),
    );

    expect(androidWorkflow.appliesToHostPlatform, false);
    expect(androidWorkflow.canLaunchDevices, false);
    expect(androidWorkflow.canListDevices, false);
    expect(androidWorkflow.canListEmulators, false);
  });

  testWithoutContext('AndroidWorkflow is disabled if feature is disabled', () {
    final FakeAndroidSdk androidSdk = FakeAndroidSdk();
    androidSdk.adbPath = 'path/to/adb';
    final AndroidWorkflow androidWorkflow = AndroidWorkflow(
      featureFlags: TestFeatureFlags(isAndroidEnabled: false),
      androidSdk: androidSdk,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(androidWorkflow.appliesToHostPlatform, false);
    expect(androidWorkflow.canLaunchDevices, false);
    expect(androidWorkflow.canListDevices, false);
    expect(androidWorkflow.canListEmulators, false);
  });

  testWithoutContext('AndroidWorkflow cannot list emulators if emulatorPath is null', () {
    final FakeAndroidSdk androidSdk = FakeAndroidSdk();
    androidSdk.adbPath = 'path/to/adb';
    final AndroidWorkflow androidWorkflow = AndroidWorkflow(
      featureFlags: TestFeatureFlags(),
      androidSdk: androidSdk,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(androidWorkflow.appliesToHostPlatform, true);
    expect(androidWorkflow.canLaunchDevices, true);
    expect(androidWorkflow.canListDevices, true);
    expect(androidWorkflow.canListEmulators, false);
  });

  testWithoutContext('AndroidWorkflow can list emulators', () {
    final FakeAndroidSdk androidSdk = FakeAndroidSdk();
    androidSdk.adbPath = 'path/to/adb';
    androidSdk.emulatorPath = 'path/to/emulator';
    final AndroidWorkflow androidWorkflow = AndroidWorkflow(
      featureFlags: TestFeatureFlags(),
      androidSdk: androidSdk,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(androidWorkflow.appliesToHostPlatform, true);
    expect(androidWorkflow.canLaunchDevices, true);
    expect(androidWorkflow.canListDevices, true);
    expect(androidWorkflow.canListEmulators, true);
  });

  testWithoutContext('licensesAccepted returns LicensesAccepted.unknown if cannot find sdkmanager', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    processManager.excludedExecutables.add('/foo/bar/sdkmanager');
    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );
    final LicensesAccepted licenseStatus = await licenseValidator.licensesAccepted;

    expect(licenseStatus, LicensesAccepted.unknown);
  });

  testWithoutContext('licensesAccepted returns LicensesAccepted.unknown if cannot run sdkmanager', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    processManager.excludedExecutables.add('/foo/bar/sdkmanager');
    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );
    final LicensesAccepted licenseStatus = await licenseValidator.licensesAccepted;

    expect(licenseStatus, LicensesAccepted.unknown);
  });

  testWithoutContext('licensesAccepted handles garbage/no output', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    processManager.addCommand(const FakeCommand(
      command: <String>[
        '/foo/bar/sdkmanager',
        '--licenses',
      ], stdout: 'asdasassad',
    ));
    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );
    final LicensesAccepted result = await licenseValidator.licensesAccepted;

    expect(result, LicensesAccepted.unknown);
  });

  testWithoutContext('licensesAccepted works for all licenses accepted', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    const String output = '''
[=======================================] 100% Computing updates...
All SDK package licenses accepted.
''';
    processManager.addCommand(const FakeCommand(
      command: <String>[
        '/foo/bar/sdkmanager',
        '--licenses',
      ], stdout: output,
    ));

    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );
    final LicensesAccepted result = await licenseValidator.licensesAccepted;

    expect(result, LicensesAccepted.all);
  });

  testWithoutContext('licensesAccepted works for some licenses accepted', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    const String output = '''
[=======================================] 100% Computing updates...
2 of 5 SDK package licenses not accepted.
Review licenses that have not been accepted (y/N)?
''';
    processManager.addCommand(const FakeCommand(
      command: <String>[
        '/foo/bar/sdkmanager',
        '--licenses',
      ], stdout: output,
    ));

    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );
    final LicensesAccepted result = await licenseValidator.licensesAccepted;

    expect(result, LicensesAccepted.some);
  });

  testWithoutContext('licensesAccepted works for no licenses accepted', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    const String output = '''
[=======================================] 100% Computing updates...
5 of 5 SDK package licenses not accepted.
Review licenses that have not been accepted (y/N)?
''';
    processManager.addCommand(const FakeCommand(
      command: <String>[
        '/foo/bar/sdkmanager',
        '--licenses',
      ], stdout: output,
    ));

    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );
    final LicensesAccepted result = await licenseValidator.licensesAccepted;

    expect(result, LicensesAccepted.none);
  });

  testWithoutContext('runLicenseManager succeeds for version >= 26', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    sdk.sdkManagerVersion = '26.0.0';
    processManager.addCommand(const FakeCommand(
      command: <String>[
        '/foo/bar/sdkmanager',
        '--licenses',
      ], stdout: '',
    ));

    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(await licenseValidator.runLicenseManager(), isTrue);
  });

  testWithoutContext('runLicenseManager errors when sdkmanager is not found', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    processManager.excludedExecutables.add('/foo/bar/sdkmanager');

    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(licenseValidator.runLicenseManager(), throwsToolExit());
  });

  testWithoutContext('runLicenseManager errors when sdkmanager fails to run', () async {
    sdk.sdkManagerPath = '/foo/bar/sdkmanager';
    processManager.excludedExecutables.add('/foo/bar/sdkmanager');

    final AndroidLicenseValidator licenseValidator = AndroidLicenseValidator(
      androidSdk: sdk,
      fileSystem: fileSystem,
      processManager: processManager,
      platform: FakePlatform(environment: <String, String>{'HOME': '/home/me'}),
      stdio: stdio,
      logger: BufferLogger.test(),
      userMessages: UserMessages(),
      androidStudio: null,
      operatingSystemUtils: FakeOperatingSystemUtils(),
    );

    expect(licenseValidator.runLicenseManager(), throwsToolExit());
  });

  testWithoutContext('detects license-only SDK installation with cmdline-tools', () async {
    sdk
      ..licensesAvailable = true
      ..platformToolsAvailable = false
      ..cmdlineToolsAvailable = true
      ..directory = fileSystem.directory('/foo/bar');
    final ValidationResult validationResult = await AndroidValidator(
      androidStudio: null,
      androidSdk: sdk,
      fileSystem: fileSystem,
      logger: logger,
      processManager: processManager,
      platform: FakePlatform()..environment = <String, String>{'HOME': '/home/me'},
      userMessages: UserMessages(),
    ).validate();

    expect(validationResult.type, ValidationType.partial);

    final ValidationMessage sdkMessage = validationResult.messages.first;
    expect(sdkMessage.type, ValidationMessageType.information);
    expect(sdkMessage.message, 'Android SDK at /foo/bar');

    final ValidationMessage licenseMessage = validationResult.messages.last;
    expect(licenseMessage.type, ValidationMessageType.hint);
    expect(licenseMessage.message, UserMessages().androidSdkLicenseOnly(kAndroidHome));
  });

  testWithoutContext('detects minimum required SDK and buildtools', () async {
    processManager.addCommand(const FakeCommand(
      command: <String>[
        'which',
        'java',
      ], exitCode: 1,
    ));
    final FakeAndroidSdkVersion sdkVersion = FakeAndroidSdkVersion()
      ..sdkLevel = 28
      ..buildToolsVersion = Version(26, 0, 3);

    sdk
      ..licensesAvailable = true
      ..platformToolsAvailable = true
      ..cmdlineToolsAvailable = true
    // Test with invalid SDK and build tools
      ..directory = fileSystem.directory('/foo/bar')
      ..sdkManagerPath = '/foo/bar/sdkmanager'
      ..latestVersion = sdkVersion;

    final String errorMessage = UserMessages().androidSdkBuildToolsOutdated(
      sdk.sdkManagerPath,
      kAndroidSdkMinVersion,
      kAndroidSdkBuildToolsMinVersion.toString(),
      FakePlatform(),
    );

    final AndroidValidator androidValidator = AndroidValidator(
      androidStudio: null,
      androidSdk: sdk,
      fileSystem: fileSystem,
      logger: logger,
      processManager: processManager,
      platform: FakePlatform()..environment = <String, String>{'HOME': '/home/me'},
      userMessages: UserMessages(),
    );

    ValidationResult validationResult = await androidValidator.validate();
    expect(validationResult.type, ValidationType.missing);
    expect(
      validationResult.messages.last.message,
      errorMessage,
    );

    // Test with valid SDK but invalid build tools
    sdkVersion.sdkLevel = 29;
    sdkVersion.buildToolsVersion = Version(28, 0, 2);

    validationResult = await androidValidator.validate();
    expect(validationResult.type, ValidationType.missing);
    expect(
      validationResult.messages.last.message,
      errorMessage,
    );

    // Test with valid SDK and valid build tools
    // Will still be partial because AndroidSdk.findJavaBinary is static :(
    sdkVersion.sdkLevel = kAndroidSdkMinVersion;
    sdkVersion.buildToolsVersion = kAndroidSdkBuildToolsMinVersion;

    validationResult = await androidValidator.validate();
    expect(validationResult.type, ValidationType.partial); // No Java binary
    expect(
      validationResult.messages.any((ValidationMessage message) => message.message == errorMessage),
      isFalse,
    );
  });

  testWithoutContext('detects missing cmdline tools', () async {
    sdk
      ..licensesAvailable = true
      ..platformToolsAvailable = true
      ..cmdlineToolsAvailable = false
      ..directory = fileSystem.directory('/foo/bar');

    final AndroidValidator androidValidator = AndroidValidator(
      androidStudio: null,
      androidSdk: sdk,
      fileSystem: fileSystem,
      logger: logger,
      processManager: processManager,
      platform: FakePlatform()..environment = <String, String>{'HOME': '/home/me'},
      userMessages: UserMessages(),
    );

    final String errorMessage = UserMessages().androidMissingCmdTools;

    final ValidationResult validationResult = await androidValidator.validate();
    expect(validationResult.type, ValidationType.missing);

    final ValidationMessage sdkMessage = validationResult.messages.first;
    expect(sdkMessage.type, ValidationMessageType.information);
    expect(sdkMessage.message, 'Android SDK at /foo/bar');

    final ValidationMessage cmdlineMessage = validationResult.messages.last;
    expect(cmdlineMessage.type, ValidationMessageType.error);
    expect(cmdlineMessage.message, errorMessage);
  });

  testWithoutContext('detects minimum required java version', () async {
    // Test with older version of JDK
    const String javaVersionText = 'openjdk version "1.7.0_212"';
    processManager.addCommand(const FakeCommand(
      command: <String>[
        'home/java/bin/java',
        '-version',
      ], stderr: javaVersionText,
    ));
    final FakeAndroidSdkVersion sdkVersion = FakeAndroidSdkVersion()
      ..sdkLevel = 29
      ..buildToolsVersion = Version(28, 0, 3);

    // Mock a pass through scenario to reach _checkJavaVersion()
    sdk
      ..licensesAvailable = true
      ..platformToolsAvailable = true
      ..cmdlineToolsAvailable = true
      ..directory = fileSystem.directory('/foo/bar')
      ..sdkManagerPath = '/foo/bar/sdkmanager';
    sdk.latestVersion = sdkVersion;

    final String errorMessage = UserMessages().androidJavaMinimumVersion(javaVersionText);

    final ValidationResult validationResult = await AndroidValidator(
      androidSdk: sdk,
      androidStudio: null,
      fileSystem: fileSystem,
      logger: logger,
      platform: FakePlatform()..environment = <String, String>{'HOME': '/home/me', 'JAVA_HOME': 'home/java'},
      processManager: processManager,
      userMessages: UserMessages(),
    ).validate();
    expect(validationResult.type, ValidationType.partial);
    expect(
      validationResult.messages.last.message,
      errorMessage,
    );
    expect(
      validationResult.messages.any(
        (ValidationMessage message) => message.message.contains('Unable to locate Android SDK')
      ),
      false,
    );
  });

  testWithoutContext('Mentions `flutter config --android-sdk if user has no AndroidSdk`', () async {
    final ValidationResult validationResult = await AndroidValidator(
      androidSdk: null,
      androidStudio: null,
      fileSystem: fileSystem,
      logger: logger,
      platform: FakePlatform()..environment = <String, String>{'HOME': '/home/me', 'JAVA_HOME': 'home/java'},
      processManager: processManager,
      userMessages: UserMessages(),
    ).validate();

    expect(
      validationResult.messages.any(
        (ValidationMessage message) => message.message.contains('flutter config --android-sdk')
      ),
      true,
    );
  });
}

class FakeAndroidSdk extends Fake implements AndroidSdk {
  @override
  String sdkManagerPath;

  @override
  String sdkManagerVersion;

  @override
  String adbPath;

  @override
  bool licensesAvailable;

  @override
  bool platformToolsAvailable;

  @override
  bool cmdlineToolsAvailable;

  @override
  Directory directory;

  @override
  AndroidSdkVersion latestVersion;

  @override
  String emulatorPath;

  @override
  List<String> validateSdkWellFormed() => <String>[];

  @override
  Map<String, String> get sdkManagerEnv => <String, String>{};
}

class FakeAndroidSdkVersion extends Fake implements AndroidSdkVersion {
  @override
  int sdkLevel;

  @override
  Version buildToolsVersion;

  @override
  String get buildToolsVersionName => '';

  @override
  String get platformName => '';
}

class CustomFakeOperatingSystemUtils extends Fake implements OperatingSystemUtils {
  CustomFakeOperatingSystemUtils({
    HostPlatform hostPlatform = HostPlatform.linux_x64
  })  : _hostPlatform = hostPlatform;

  final HostPlatform _hostPlatform;

  @override
  String get name => 'Linux';

  @override
  HostPlatform get hostPlatform => _hostPlatform;
}
