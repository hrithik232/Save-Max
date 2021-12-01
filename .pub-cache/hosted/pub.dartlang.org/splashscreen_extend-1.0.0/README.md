# SplashScreen Extend

A Flutter package which provides a basic SplashScreen.

## Getting Started

Just use the SplashScreen widget in your MaterialApp, provide a future which delivers a widget and
that's it.

## Example

```dart
Future<Widget> loadAndLaunch() async {

  // Do some start up things or let the app just wait:
  await Future.delayed(const Duration(seconds: 2), () => "2");

  return MaterialApp(
    home: SafeArea(
      child: SomePage(),
    ),
  );
}

Future<void> main() async {
  runApp(
    MaterialApp(
      title: 'Demo',
      home: SafeArea(
        child: SplashScreen(
          widgetToNavigateAfterFuture: loadAndLaunch(),
          backgroundColor: Colors.red,
          logo: Image.asset(
            'assets/images/logo-splashscreen.png',
          ),
        ),
      ),
    ),
  );
}
```

## Features

* Provide Future<Widget> for redirect
* Provide Logo as Image, customize placement and size
* Provide Circular Progress Indicator, customize placement and size

## Why?

I made this package since the original [SplashScreenFlutterPackage](https://github.com/KarimMohamed20/SplashScreenFlutterPackage) got archived
