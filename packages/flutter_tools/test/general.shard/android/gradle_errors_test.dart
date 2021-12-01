// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'package:file/memory.dart';
import 'package:file_testing/file_testing.dart';
import 'package:flutter_tools/src/android/gradle_errors.dart';
import 'package:flutter_tools/src/android/gradle_utils.dart';
import 'package:flutter_tools/src/base/file_system.dart';
import 'package:flutter_tools/src/base/platform.dart';
import 'package:flutter_tools/src/globals_null_migrated.dart' as globals;
import 'package:flutter_tools/src/project.dart';

import '../../src/common.dart';
import '../../src/context.dart';

void main() {
  group('gradleErrors', () {
    testWithoutContext('list of errors', () {
      // If you added a new Gradle error, please update this test.
      expect(gradleErrors,
        equals(<GradleHandledError>[
          licenseNotAcceptedHandler,
          networkErrorHandler,
          permissionDeniedErrorHandler,
          flavorUndefinedHandler,
          r8FailureHandler,
          minSdkVersion,
          transformInputIssue,
          lockFileDepMissing,
        ])
      );
    });
  });

  group('network errors', () {
    testUsingContext('retries and deletes zip if gradle fails to unzip', () async {
      globals.fs.file('foo/.gradle/fizz.zip').createSync(recursive: true);
      const String errorMessage = r'''
Exception in thread "main" java.util.zip.ZipException: error in opening zip file
at java.util.zip.ZipFile.open(Native Method)
at java.util.zip.ZipFile.(ZipFile.java:225)
at java.util.zip.ZipFile.(ZipFile.java:155)
at java.util.zip.ZipFile.(ZipFile.java:169)
at org.gradle.wrapper.Install.unzip(Install.java:214)
at org.gradle.wrapper.Install.access$600(Install.java:27)
at org.gradle.wrapper.Install$1.call(Install.java:74)
at org.gradle.wrapper.Install$1.call(Install.java:48)
at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
at org.gradle.wrapper.Install.createDist(Install.java:48)
at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)
[!] Gradle threw an error while trying to update itself. Retrying the update...
Exception in thread "main" java.util.zip.ZipException: error in opening zip file
at java.util.zip.ZipFile.open(Native Method)
at java.util.zip.ZipFile.(ZipFile.java:225)
at java.util.zip.ZipFile.(ZipFile.java:155)
at java.util.zip.ZipFile.(ZipFile.java:169)
at org.gradle.wrapper.Install.unzip(Install.java:214)
at org.gradle.wrapper.Install.access$600(Install.java:27)
at org.gradle.wrapper.Install$1.call(Install.java:74)
at org.gradle.wrapper.Install$1.call(Install.java:48)
at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
at org.gradle.wrapper.Install.createDist(Install.java:48)
at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)
''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));
      expect(globals.fs.file('foo/.gradle/fizz.zip'), isNot(exists));
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
      Platform: () => FakePlatform(environment: <String, String>{'HOME': 'foo/'}),
    });

    testUsingContext('retries if gradle fails while downloading', () async {
      const String errorMessage = r'''
Exception in thread "main" java.io.FileNotFoundException: https://downloads.gradle.org/distributions/gradle-4.1.1-all.zip
at sun.net.www.protocol.http.HttpURLConnection.getInputStream0(HttpURLConnection.java:1872)
at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1474)
at sun.net.www.protocol.https.HttpsURLConnectionImpl.getInputStream(HttpsURLConnectionImpl.java:254)
at org.gradle.wrapper.Download.downloadInternal(Download.java:58)
at org.gradle.wrapper.Download.download(Download.java:44)
at org.gradle.wrapper.Install$1.call(Install.java:61)
at org.gradle.wrapper.Install$1.call(Install.java:48)
at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
at org.gradle.wrapper.Install.createDist(Install.java:48)
at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if gradle fails downloading with proxy error', () async {
      const String errorMessage = r'''
Exception in thread "main" java.io.IOException: Unable to tunnel through proxy. Proxy returns "HTTP/1.1 400 Bad Request"
at sun.net.www.protocol.http.HttpURLConnection.doTunneling(HttpURLConnection.java:2124)
at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:183)
at sun.net.www.protocol.http.HttpURLConnection.getInputStream0(HttpURLConnection.java:1546)
at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1474)
at sun.net.www.protocol.https.HttpsURLConnectionImpl.getInputStream(HttpsURLConnectionImpl.java:254)
at org.gradle.wrapper.Download.downloadInternal(Download.java:58)
at org.gradle.wrapper.Download.download(Download.java:44)
at org.gradle.wrapper.Install$1.call(Install.java:61)
at org.gradle.wrapper.Install$1.call(Install.java:48)
at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
at org.gradle.wrapper.Install.createDist(Install.java:48)
at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if gradle times out waiting for exclusive access to zip', () async {
      const String errorMessage = '''
Exception in thread "main" java.lang.RuntimeException: Timeout of 120000 reached waiting for exclusive access to file: /User/documents/gradle-5.6.2-all.zip
	at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:61)
	at org.gradle.wrapper.Install.createDist(Install.java:48)
	at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
	at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if remote host closes connection', () async {
      const String errorMessage = r'''
Downloading https://services.gradle.org/distributions/gradle-5.6.2-all.zip
Exception in thread "main" javax.net.ssl.SSLHandshakeException: Remote host closed connection during handshake
	at sun.security.ssl.SSLSocketImpl.readRecord(SSLSocketImpl.java:994)
	at sun.security.ssl.SSLSocketImpl.performInitialHandshake(SSLSocketImpl.java:1367)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1395)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1379)
	at sun.net.www.protocol.https.HttpsClient.afterConnect(HttpsClient.java:559)
	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:185)
	at sun.net.www.protocol.http.HttpURLConnection.followRedirect0(HttpURLConnection.java:2729)
	at sun.net.www.protocol.http.HttpURLConnection.followRedirect(HttpURLConnection.java:2641)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream0(HttpURLConnection.java:1824)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1492)
	at sun.net.www.protocol.https.HttpsURLConnectionImpl.getInputStream(HttpsURLConnectionImpl.java:263)
	at org.gradle.wrapper.Download.downloadInternal(Download.java:58)
	at org.gradle.wrapper.Download.download(Download.java:44)
	at org.gradle.wrapper.Install$1.call(Install.java:61)
	at org.gradle.wrapper.Install$1.call(Install.java:48)
	at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
	at org.gradle.wrapper.Install.createDist(Install.java:48)
	at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
	at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if file opening fails', () async {
      const String errorMessage = r'''
Downloading https://services.gradle.org/distributions/gradle-3.5.0-all.zip
Exception in thread "main" java.io.FileNotFoundException: https://downloads.gradle-dn.com/distributions/gradle-3.5.0-all.zip
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream0(HttpURLConnection.java:1890)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1492)
	at sun.net.www.protocol.https.HttpsURLConnectionImpl.getInputStream(HttpsURLConnectionImpl.java:263)
	at org.gradle.wrapper.Download.downloadInternal(Download.java:58)
	at org.gradle.wrapper.Download.download(Download.java:44)
	at org.gradle.wrapper.Install$1.call(Install.java:61)
	at org.gradle.wrapper.Install$1.call(Install.java:48)
	at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
	at org.gradle.wrapper.Install.createDist(Install.java:48)
	at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
	at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if the connection is reset', () async {
      const String errorMessage = r'''
Downloading https://services.gradle.org/distributions/gradle-5.6.2-all.zip
Exception in thread "main" java.net.SocketException: Connection reset
	at java.net.SocketInputStream.read(SocketInputStream.java:210)
	at java.net.SocketInputStream.read(SocketInputStream.java:141)
	at sun.security.ssl.InputRecord.readFully(InputRecord.java:465)
	at sun.security.ssl.InputRecord.readV3Record(InputRecord.java:593)
	at sun.security.ssl.InputRecord.read(InputRecord.java:532)
	at sun.security.ssl.SSLSocketImpl.readRecord(SSLSocketImpl.java:975)
	at sun.security.ssl.SSLSocketImpl.performInitialHandshake(SSLSocketImpl.java:1367)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1395)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1379)
	at sun.net.www.protocol.https.HttpsClient.afterConnect(HttpsClient.java:559)
	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:185)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream0(HttpURLConnection.java:1564)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1492)
	at sun.net.www.protocol.https.HttpsURLConnectionImpl.getInputStream(HttpsURLConnectionImpl.java:263)
	at org.gradle.wrapper.Download.downloadInternal(Download.java:58)
	at org.gradle.wrapper.Download.download(Download.java:44)
	at org.gradle.wrapper.Install$1.call(Install.java:61)
	at org.gradle.wrapper.Install$1.call(Install.java:48)
	at org.gradle.wrapper.ExclusiveFileAccessManager.access(ExclusiveFileAccessManager.java:65)
	at org.gradle.wrapper.Install.createDist(Install.java:48)
	at org.gradle.wrapper.WrapperExecutor.execute(WrapperExecutor.java:128)
	at org.gradle.wrapper.GradleWrapperMain.main(GradleWrapperMain.java:61)''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if Gradle could not get a resource', () async {
      const String errorMessage = '''
A problem occurred configuring root project 'android'.
> Could not resolve all artifacts for configuration ':classpath'.
   > Could not resolve net.sf.proguard:proguard-gradle:6.0.3.
     Required by:
         project : > com.android.tools.build:gradle:3.3.0
      > Could not resolve net.sf.proguard:proguard-gradle:6.0.3.
         > Could not parse POM https://jcenter.bintray.com/net/sf/proguard/proguard-gradle/6.0.3/proguard-gradle-6.0.3.pom
            > Could not resolve net.sf.proguard:proguard-parent:6.0.3.
               > Could not resolve net.sf.proguard:proguard-parent:6.0.3.
                  > Could not get resource 'https://jcenter.bintray.com/net/sf/proguard/proguard-parent/6.0.3/proguard-parent-6.0.3.pom'.
                     > Could not GET 'https://jcenter.bintray.com/net/sf/proguard/proguard-parent/6.0.3/proguard-parent-6.0.3.pom'. Received status code 504 from server: Gateway Time-out''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });

    testUsingContext('retries if Gradle could not get a resource (non-Gateway)', () async {
      const String errorMessage = '''
* Error running Gradle:
Exit code 1 from: /home/travis/build/flutter/flutter sdk/examples/flutter_gallery/android/gradlew app:properties:
Starting a Gradle Daemon (subsequent builds will be faster)
Picked up _JAVA_OPTIONS: -Xmx2048m -Xms512m
FAILURE: Build failed with an exception.
* What went wrong:
A problem occurred configuring root project 'android'.
> Could not resolve all files for configuration ':classpath'.
   > Could not resolve com.android.tools.build:gradle:3.1.2.
     Required by:
         project :
      > Could not resolve com.android.tools.build:gradle:3.1.2.
         > Could not get resource 'https://dl.google.com/dl/android/maven2/com/android/tools/build/gradle/3.1.2/gradle-3.1.2.pom'.
            > Could not GET 'https://dl.google.com/dl/android/maven2/com/android/tools/build/gradle/3.1.2/gradle-3.1.2.pom'.
               > Remote host closed connection during handshake''';

      expect(formatTestErrorMessage(errorMessage, networkErrorHandler), isTrue);
      expect(await networkErrorHandler.handler(), equals(GradleBuildStatus.retry));

      expect(testLogger.errorText,
        contains(
          'Gradle threw an error while downloading artifacts from the network. '
          'Retrying to download...'
        )
      );
    }, overrides: <Type, Generator>{
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.any(),
    });
  });

  group('permission errors', () {
    testUsingContext('throws toolExit if gradle is missing execute permissions', () async {
      const String errorMessage = '''
Permission denied
Command: /home/android/gradlew assembleRelease
''';
      expect(formatTestErrorMessage(errorMessage, permissionDeniedErrorHandler), isTrue);
      expect(await permissionDeniedErrorHandler.handler(), equals(GradleBuildStatus.exit));

      expect(
        testLogger.statusText,
        contains('Gradle does not have execution permission.'),
      );
      expect(
        testLogger.statusText,
        contains(
          'You should change the ownership of the project directory to your user, '
          'or move the project to a directory with execute permissions.'
        )
      );
    });
  });

  group('permission errors', () {
    testUsingContext('pattern', () async {
      const String errorMessage = '''
Permission denied
Command: /home/android/gradlew assembleRelease
''';
      expect(formatTestErrorMessage(errorMessage, permissionDeniedErrorHandler), isTrue);
    });

    testUsingContext('handler', () async {
      expect(await permissionDeniedErrorHandler.handler(), equals(GradleBuildStatus.exit));

      expect(
        testLogger.statusText,
        contains('Gradle does not have execution permission.'),
      );
      expect(
        testLogger.statusText,
        contains(
          'You should change the ownership of the project directory to your user, '
          'or move the project to a directory with execute permissions.'
        )
      );
    });
  });

  group('license not accepted', () {
    testWithoutContext('pattern', () {
      expect(
        licenseNotAcceptedHandler.test(
          'You have not accepted the license agreements of the following SDK components'
        ),
        isTrue,
      );
    });

    testUsingContext('handler', () async {
      await licenseNotAcceptedHandler.handler(
        line: 'You have not accepted the license agreements of the following SDK components: [foo, bar]',
        project: FlutterProject.fromDirectoryTest(globals.fs.currentDirectory),
      );

      expect(
        testLogger.statusText,
        contains(
          'Unable to download needed Android SDK components, as the '
          'following licenses have not been accepted:\n'
          'foo, bar\n\n'
          'To resolve this, please run the following command in a Terminal:\n'
          'flutter doctor --android-licenses'
        )
      );
    });
  });

  group('flavor undefined', () {
    FakeProcessManager fakeProcessManager;

    setUp(() {
      fakeProcessManager = FakeProcessManager.empty();
    });

    testWithoutContext('pattern', () {
      expect(
        flavorUndefinedHandler.test(
          'Task assembleFooRelease not found in root project.'
        ),
        isTrue,
      );
      expect(
        flavorUndefinedHandler.test(
          'Task assembleBarRelease not found in root project.'
        ),
        isTrue,
      );
      expect(
        flavorUndefinedHandler.test(
          'Task assembleBar not found in root project.'
        ),
        isTrue,
      );
      expect(
        flavorUndefinedHandler.test(
          'Task assembleBar_foo not found in root project.'
        ),
        isTrue,
      );
    });

    testUsingContext('handler - with flavor', () async {
      fakeProcessManager.addCommand(const FakeCommand(
        command: <String>[
      'gradlew',
        'app:tasks' ,
        '--all',
        '--console=auto',
        ],
        stdout: '''
assembleRelease
assembleFlavor1
assembleFlavor1Release
assembleFlavor_2
assembleFlavor_2Release
assembleDebug
assembleProfile
assembles
assembleFooTest
          ''',
      ));

      await flavorUndefinedHandler.handler(
        project: FlutterProject.fromDirectoryTest(globals.fs.currentDirectory),
      );

      expect(
        testLogger.statusText,
        contains(
          'Gradle project does not define a task suitable '
          'for the requested build.'
        )
      );
      expect(
        testLogger.statusText,
        contains(
          'The android/app/build.gradle file defines product '
          'flavors: flavor1, flavor_2 '
          'You must specify a --flavor option to select one of them.'
        )
      );
      expect(fakeProcessManager.hasRemainingExpectations, isFalse);
    }, overrides: <Type, Generator>{
      GradleUtils: () => FakeGradleUtils(),
      Platform: () => fakePlatform('android'),
      ProcessManager: () => fakeProcessManager,
      FileSystem: () => MemoryFileSystem.test(),
    });

    testUsingContext('handler - without flavor', () async {
      fakeProcessManager.addCommand(const FakeCommand(
        command: <String>[
          'gradlew',
          'app:tasks' ,
          '--all',
          '--console=auto',
        ],
        stdout: '''
assembleRelease
assembleDebug
assembleProfile
          ''',
      ));

      await flavorUndefinedHandler.handler(
        project: FlutterProject.fromDirectoryTest(globals.fs.currentDirectory),
      );

      expect(
        testLogger.statusText,
        contains(
          'Gradle project does not define a task suitable '
          'for the requested build.'
        )
      );
      expect(
        testLogger.statusText,
        contains(
          'The android/app/build.gradle file does not define any custom product flavors. '
          'You cannot use the --flavor option.'
        )
      );
      expect(fakeProcessManager.hasRemainingExpectations, isFalse);
    }, overrides: <Type, Generator>{
      GradleUtils: () => FakeGradleUtils(),
      Platform: () => fakePlatform('android'),
      ProcessManager: () => fakeProcessManager,
      FileSystem: () => MemoryFileSystem.test(),
    });
  });

  group('higher minSdkVersion', () {
    const String stdoutLine = 'uses-sdk:minSdkVersion 16 cannot be smaller than version 19 declared in library [:webview_flutter] /tmp/cirrus-ci-build/all_plugins/build/webview_flutter/intermediates/library_manifest/release/AndroidManifest.xml as the library might be using APIs not available in 16';

    testWithoutContext('pattern', () {
      expect(
        minSdkVersion.test(stdoutLine),
        isTrue,
      );
    });

    testUsingContext('suggestion', () async {
      await minSdkVersion.handler(
        line: stdoutLine,
        project: FlutterProject.fromDirectoryTest(globals.fs.currentDirectory),
      );

      expect(
        testLogger.statusText,
        contains(
          '\n'
          'The plugin webview_flutter requires a higher Android SDK version.\n'
          'Fix this issue by adding the following to the file /android/app/build.gradle:\n'
          'android {\n'
          '  defaultConfig {\n'
          '    minSdkVersion 19\n'
          '  }\n'
          '}\n'
          '\n'
          "Note that your app won't be available to users running Android SDKs below 19.\n"
          'Alternatively, try to find a version of this plugin that supports these lower versions of the Android SDK.\n'
        )
      );
    }, overrides: <Type, Generator>{
      GradleUtils: () => FakeGradleUtils(),
      Platform: () => fakePlatform('android'),
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.empty(),
    });
  });

  // https://issuetracker.google.com/issues/141126614
  group('transform input issue', () {
    testWithoutContext('pattern', () {
      expect(
        transformInputIssue.test(
          'https://issuetracker.google.com/issues/158753935'
        ),
        isTrue,
      );
    });

    testUsingContext('suggestion', () async {
      await transformInputIssue.handler(
        project: FlutterProject.fromDirectoryTest(globals.fs.currentDirectory),
      );

      expect(
        testLogger.statusText,
        contains(
          '\n'
          'This issue appears to be https://github.com/flutter/flutter/issues/58247.\n'
          'Fix this issue by adding the following to the file /android/app/build.gradle:\n'
          'android {\n'
          '  lintOptions {\n'
          '    checkReleaseBuilds false\n'
          '  }\n'
          '}\n'
        )
      );
    }, overrides: <Type, Generator>{
      GradleUtils: () => FakeGradleUtils(),
      Platform: () => fakePlatform('android'),
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.empty(),
    });
  });

  group('Dependency mismatch', () {
    testWithoutContext('pattern', () {
      expect(
        lockFileDepMissing.test('''
* What went wrong:
Execution failed for task ':app:generateDebugFeatureTransitiveDeps'.
> Could not resolve all artifacts for configuration ':app:debugRuntimeClasspath'.
   > Resolved 'androidx.lifecycle:lifecycle-common:2.2.0' which is not part of the dependency lock state
   > Resolved 'androidx.customview:customview:1.0.0' which is not part of the dependency lock state'''
        ),
        isTrue,
      );
    });

    testUsingContext('suggestion', () async {
      await lockFileDepMissing.handler(
        project: FlutterProject.fromDirectoryTest(globals.fs.currentDirectory),
      );

      expect(
        testLogger.statusText,
        contains(
          '\n'
          'You need to update the lockfile, or disable Gradle dependency locking.\n'
          'To regenerate the lockfiles run: `./gradlew :generateLockfiles` in /android/build.gradle\n'
          'To remove dependency locking, remove the `dependencyLocking` from /android/build.gradle\n'
          '\n'
        )
      );
    }, overrides: <Type, Generator>{
      GradleUtils: () => FakeGradleUtils(),
      Platform: () => fakePlatform('android'),
      FileSystem: () => MemoryFileSystem.test(),
      ProcessManager: () => FakeProcessManager.empty(),
    });
  });
}

bool formatTestErrorMessage(String errorMessage, GradleHandledError error) {
  return errorMessage
    .split('\n')
    .any((String line) => error.test(line));
}

Platform fakePlatform(String name) {
  return FakePlatform(
    environment: <String, String>{
      'HOME': '/',
    },
    operatingSystem: name,
  );
}

class FakeGradleUtils extends GradleUtils {
  @override
  String getExecutable(FlutterProject project) {
    return 'gradlew';
  }
}
