import 'package:flutter/material.dart';

Future<Widget> loadAndLaunch() async {
  // Do some start up things or let the app just wait:
  await Future.delayed(const Duration(seconds: 3), () => "3 seconds passed");

  return MaterialApp(
    home: SafeArea(
      child: Center(
        child: Text('App loaded'),
      ),
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
