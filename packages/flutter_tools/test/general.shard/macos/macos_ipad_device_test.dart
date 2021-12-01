// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'package:file/memory.dart';
import 'package:flutter_tools/src/base/logger.dart';
import 'package:flutter_tools/src/base/os.dart';
import 'package:flutter_tools/src/base/platform.dart';
import 'package:flutter_tools/src/build_info.dart';
import 'package:flutter_tools/src/desktop_device.dart';
import 'package:flutter_tools/src/device.dart';
import 'package:flutter_tools/src/ios/ios_workflow.dart';
import 'package:flutter_tools/src/macos/macos_ipad_device.dart';
import 'package:meta/meta.dart';
import 'package:test/fake.dart';

import '../../src/common.dart';
import '../../src/context.dart';
import '../../src/fakes.dart';

void main() {
  group('MacOSDesignedForIPadDevices', () {
    tearDown(() {
      MacOSDesignedForIPadDevices.allowDiscovery = false;
    });

    testWithoutContext('does not support non-macOS plaforms', () async {
      MacOSDesignedForIPadDevices.allowDiscovery = true;
      final MacOSDesignedForIPadDevices discoverer = MacOSDesignedForIPadDevices(
        platform: FakePlatform(operatingSystem: 'windows'),
        logger: BufferLogger.test(),
        processManager: FakeProcessManager.any(),
        fileSystem: MemoryFileSystem.test(),
        operatingSystemUtils: FakeOperatingSystemUtils(hostPlatform: HostPlatform.darwin_arm),
        iosWorkflow: FakeIOSWorkflow(canListDevices: true),
      );

      expect(discoverer.supportsPlatform, isFalse);
    });

    testWithoutContext('discovery not allowed', () async {
      final MacOSDesignedForIPadDevices discoverer = MacOSDesignedForIPadDevices(
        platform: FakePlatform(operatingSystem: 'macos'),
        logger: BufferLogger.test(),
        processManager: FakeProcessManager.any(),
        fileSystem: MemoryFileSystem.test(),
        operatingSystemUtils: FakeOperatingSystemUtils(hostPlatform: HostPlatform.darwin_arm),
        iosWorkflow: FakeIOSWorkflow(canListDevices: true),
      );
      expect(discoverer.supportsPlatform, isTrue);

      final List<Device> devices = await discoverer.devices;
      expect(devices, isEmpty);
    });

    testWithoutContext('no device on x86', () async {
      MacOSDesignedForIPadDevices.allowDiscovery = true;
      final MacOSDesignedForIPadDevices discoverer = MacOSDesignedForIPadDevices(
        platform: FakePlatform(operatingSystem: 'macos'),
        logger: BufferLogger.test(),
        processManager: FakeProcessManager.any(),
        fileSystem: MemoryFileSystem.test(),
        operatingSystemUtils: FakeOperatingSystemUtils(hostPlatform: HostPlatform.darwin_x64),
        iosWorkflow: FakeIOSWorkflow(canListDevices: true),
      );
      expect(discoverer.supportsPlatform, isTrue);

      final List<Device> devices = await discoverer.devices;
      expect(devices, isEmpty);
    });

    testWithoutContext('no device on when iOS development off', () async {
      MacOSDesignedForIPadDevices.allowDiscovery = true;
      final MacOSDesignedForIPadDevices discoverer = MacOSDesignedForIPadDevices(
        platform: FakePlatform(operatingSystem: 'macos'),
        logger: BufferLogger.test(),
        processManager: FakeProcessManager.any(),
        fileSystem: MemoryFileSystem.test(),
        operatingSystemUtils: FakeOperatingSystemUtils(hostPlatform: HostPlatform.darwin_arm),
        iosWorkflow: FakeIOSWorkflow(canListDevices: false),
      );
      expect(discoverer.supportsPlatform, isTrue);

      final List<Device> devices = await discoverer.devices;
      expect(devices, isEmpty);
    });

    testWithoutContext('device discovery on arm', () async {
      MacOSDesignedForIPadDevices.allowDiscovery = true;
      final MacOSDesignedForIPadDevices discoverer = MacOSDesignedForIPadDevices(
        platform: FakePlatform(operatingSystem: 'macos'),
        logger: BufferLogger.test(),
        processManager: FakeProcessManager.any(),
        fileSystem: MemoryFileSystem.test(),
        operatingSystemUtils: FakeOperatingSystemUtils(hostPlatform: HostPlatform.darwin_arm),
        iosWorkflow: FakeIOSWorkflow(canListDevices: true),
      );
      expect(discoverer.supportsPlatform, isTrue);

      List<Device> devices = await discoverer.devices;
      expect(devices, hasLength(1));

      final Device device = devices.single;
      expect(device, isA<MacOSDesignedForIPadDevice>());
      expect(device.id, 'designed-for-ipad');

      // Timeout ignored.
      devices = await discoverer.discoverDevices(timeout: const Duration(seconds: 10));
      expect(devices, hasLength(1));
    });
  });

  testWithoutContext('MacOSDesignedForIPadDevice properties', () async {
    final MacOSDesignedForIPadDevice device = MacOSDesignedForIPadDevice(
      logger: BufferLogger.test(),
      processManager: FakeProcessManager.any(),
      fileSystem: MemoryFileSystem.test(),
      operatingSystemUtils: FakeOperatingSystemUtils(hostPlatform: HostPlatform.darwin_arm),
    );
    expect(device.id, 'designed-for-ipad');
    expect(await device.isLocalEmulator, isFalse);
    expect(device.name, 'Mac Designed for iPad');
    expect(device.portForwarder, isNot(isNull));
    expect(await device.targetPlatform, TargetPlatform.darwin);

    expect(await device.installApp(null), isTrue);
    expect(await device.isAppInstalled(null), isTrue);
    expect(await device.isLatestBuildInstalled(null), isTrue);
    expect(await device.uninstallApp(null), isTrue);

    expect(device.isSupported(), isTrue);
    expect(device.getLogReader(), isA<DesktopLogReader>());

     expect(await device.stopApp(null), isFalse);

    await expectLater(() => device.startApp(null, debuggingOptions: null), throwsA(isA<UnimplementedError>()));
    await expectLater(() => device.buildForDevice(null), throwsA(isA<UnimplementedError>()));
    expect(device.executablePathForDevice(null, null), null);
  });
}

class FakeIOSWorkflow extends Fake implements IOSWorkflow {
  FakeIOSWorkflow({@required this.canListDevices});

  @override
  final bool canListDevices;
}
