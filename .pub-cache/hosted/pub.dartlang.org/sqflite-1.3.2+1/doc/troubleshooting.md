# Troubleshooting

If you ran into build/runtime issues, please try the following:

* Update flutter to the latest version (`flutter upgrade`)
* Update sqflite dependencies to the latest version in your `pubspec.yaml` 
(`sqflite >= X.Y.Z`)
* Update dependencies (`flutter packages upgrade`)
* try `flutter clean`
* Try deleting the flutter cache folder (which will 
downloaded again automatically) from your flutter installation folder `$FLUTTER_TOP/bin/cache`

# Recommendations

* Enable strong-mode
* Disable implicit casts

Sample `analysis_options.yaml` file:

```
analyzer:
  strong-mode:
    implicit-casts: false
```

# Common issues

## Cast error

```
Unhandled exception: type '_InternalLinkedHashMap' is not a subtype of type 'Map<String, dynamic>'
 where
  _InternalLinkedHashMap is from dart:collection
  Map is from dart:core
  String is from dart:core
```

Make sure you create object of type `Map<String, dynamic>` and not simply `Map` for records you
insert and update. The option `implicit-casts: false` explained above helps to find such issues

## MissingPluginException

This error is typically a build/setup error after adding the dependency.

- Try all the steps defined at the top of the documents
- Make sure you stop the current running application if any (hot restart/reload won't work)
- Force a `flutter packages get`
- Try to clean your build folder `flutter clean`
- On iOS, you can try to force a `pod install` / `pod update`
- Follow the [using package flutter guide](https://flutter.dev/docs/development/packages-and-plugins/using-packages)
- Search for [other bugs in flutter](https://github.com/flutter/flutter/search?q=MissingPluginException&type=Issues) 
  like this, other people face the same issue with other plugins so it is likely not sqflite related 

Advanced checks:
- If you are using sqflite in a FCM Messaging context, you might need to [register the plugin earlier](https://github.com/tekartik/sqflite/issues/446).
- if the project was generated a long time ago (2019), you might have to follow the [plugin migration guide](https://flutter.dev/docs/development/packages-and-plugins/plugin-api-migration)
- Check the GeneratedPluginRegistrant file that flutter run should have generated in your project contains
  a line registering the plugin.
  
  Android:
  ```java
  SqflitePlugin.registerWith(registry.registrarFor("com.tekartik.sqflite.SqflitePlugin"));
  ```
  iOS:
  ```objective-c
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  ```
- Check MainActivity.java (Android) contains a call to 
  GeneratedPluginRegistrant asking it to register itself. This call should be made from the app
  launch method (onCreate).
  ```java
  public class MainActivity extends FlutterActivity {
      @Override
      protected void onCreate(Bundle savedInstanceState) {
          super.onCreate(savedInstanceState);
          GeneratedPluginRegistrant.registerWith(this);
      }
  }
  ```
- Check AppDelegate.m (iOS) contains a call to 
  GeneratedPluginRegistrant asking it to register itself. This call should be made from the app
  launch method (application:didFinishLaunchingWithOptions:).
  ```objective-c
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
  }
  ```
- If it happens to Android release mode, make sure to [remove shrinkResources 
  true and minifyEnabled true lines in build.gradle](https://github.com/tekartik/sqflite/issues/452#issuecomment-655602329) to solve the problem.

Before raising this issue, try adding another well established plugin (the simplest being 
`path_provider` or `shared_preferences`) to see if you get the error here as well.

## Debugging SQL commands

A quick way to view SQL commands printed out is to call before opening any database

```dart
await Sqflite.devSetDebugModeOn(true);
```

This call is on purpose deprecated to force removing it once the SQL issues has been resolved.

## iOS build issue

I'm not an expert on iOS so it is hard for me reply to issues you encounter especially when you integrate
into your app. Good if you can validate that you have no issue with other plugin such as `path_provider` and that
the example app work with your setup.

I test mainly with the beta channel. Good if you can try if the example work with your setup

```bash
# Switch to beta
flutter channel beta
flutter upgrade

# Get the project and build/run the example
git clone https://github.com/tekartik/sqflite.git
cd sqflite/example

flutter packages get
# build for iOS
flutter build ios
# run!
flutter run
```

If you want to use master, please try the following to see if it works with your setup

```bash
# Switch to master
flutter channel master
flutter upgrade

# Get the project and build/run the example
git clone https://github.com/tekartik/sqflite.git
cd sqflite/example

flutter packages get
# build for iOS
flutter build ios
# run!
flutter run
```

In the worst case, you can also re-create your ios project by deleting the ios/folder and running `flutter create .`

## Error in Flutter web

As far as i know, the web does not support sqlite in any acceptable ways (yes there are in memory solution but no 
persistency, see https://github.com/tekartik/sqflite/issues/212).

Since there is no decent solution on the web, as of today, support is not planned.

IndexedDB or any solution on top of it should be considered for storage on the Web.

