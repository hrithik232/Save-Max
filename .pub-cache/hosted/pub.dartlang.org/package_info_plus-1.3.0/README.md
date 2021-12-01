# PackageInfoPlus

[![Flutter Community: package_info_plus](https://fluttercommunity.dev/_github/header/package_info_plus)](https://github.com/fluttercommunity/community)

[![pub package](https://img.shields.io/pub/v/package_info_plus.svg)](https://pub.dev/packages/package_info_plus)

<p class="center">
<center><a href="https://flutter.dev/docs/development/packages-and-plugins/favorites" target="_blank" rel="noreferrer noopener"><img src="../../website/static/img/flutter-favorite-badge.png" width="100" alt="build"></a></center>
</p>
This Flutter plugin provides an API for querying information about an
application package.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

## Usage

You can use the PackageInfo to query information about the
application package. This works both on iOS and Android.

```dart
import 'package:package_info_plus/package_info_plus.dart';

PackageInfo packageInfo = await PackageInfo.fromPlatform();

String appName = packageInfo.appName;
String packageName = packageInfo.packageName;
String version = packageInfo.version;
String buildNumber = packageInfo.buildNumber;
```

## Known Issues

### iOS

As noted on [issue 20761](https://github.com/flutter/flutter/issues/20761#issuecomment-493434578), package_info on iOS
requires the Xcode build folder to be rebuilt after changes to the version string in `pubspec.yaml`.
Clean the Xcode build folder with:
`XCode Menu -> Product -> (Holding Option Key) Clean build folder`.

Check out our documentation website to learn more. [Plus plugins documentation](https://plus.fluttercommunity.dev/docs/overview)

### Android (and potentially all platforms)

Calling to `PackageInfo.fromPlatform()` before the `runApp()` call will cause an exception.
See https://github.com/fluttercommunity/plus_plugins/issues/309

**Important:** As of January 2021, the Flutter team is no longer accepting non-critical PRs for the original set of plugins in `flutter/plugins`, and instead they should be submitted in this project. [You can read more about this announcement here.](https://github.com/flutter/plugins/blob/master/CONTRIBUTING.md#important-note) as well as [in the Flutter 2 announcement blog post.](https://medium.com/flutter/whats-new-in-flutter-2-0-fe8e95ecc65)
