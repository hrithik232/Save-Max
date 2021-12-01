// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// This file is for testings that require a `LiveTestWidgetsFlutterBinding`
void main() {
  LiveTestWidgetsFlutterBinding();
  testWidgets('Input PointerAddedEvent', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Text('Test')));
    await tester.pump();
    final TestGesture gesture = await tester.createGesture();
    // This mimics the start of a gesture as seen on a device, where inputs
    // starts with a PointerAddedEvent.
    await gesture.addPointer();
    // The expected result of the test is not to trigger any assert.
  });

  testWidgets('Input PointerHoverEvent', (WidgetTester tester) async {
    PointerHoverEvent? hoverEvent;
    await tester.pumpWidget(MaterialApp(home: MouseRegion(
      child: const Text('Test'),
      onHover: (PointerHoverEvent event) {
        hoverEvent = event;
      },
    )));
    await tester.pump();
    final TestGesture gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    final Offset location = tester.getCenter(find.text('Test'));
    // for mouse input without a down event, moveTo generates a hover event
    await gesture.moveTo(location);
    expect(hoverEvent, isNotNull);
    expect(hoverEvent!.position, location);
    await gesture.removePointer();
  });

  testWidgets('hitTesting works when using setSurfaceSize', (WidgetTester tester) async {
    int invocations = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: GestureDetector(
            onTap: () {
              invocations++;
            },
            child: const Text('Test'),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(Text));
    await tester.pump();
    expect(invocations, 1);

    await tester.binding.setSurfaceSize(const Size(200, 300));
    await tester.pump();
    await tester.tap(find.byType(Text));
    await tester.pump();
    expect(invocations, 2);

    await tester.binding.setSurfaceSize(null);
    await tester.pump();
    await tester.tap(find.byType(Text));
    await tester.pump();
    expect(invocations, 3);
  });

  testWidgets('setSurfaceSize works', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Center(child: Text('Test'))));

    final Size windowCenter = tester.binding.window.physicalSize /
        tester.binding.window.devicePixelRatio /
        2;
    final double windowCenterX = windowCenter.width;
    final double windowCenterY = windowCenter.height;

    Offset widgetCenter = tester.getRect(find.byType(Text)).center;
    expect(widgetCenter.dx, windowCenterX);
    expect(widgetCenter.dy, windowCenterY);

    await tester.binding.setSurfaceSize(const Size(200, 300));
    await tester.pump();
    widgetCenter = tester.getRect(find.byType(Text)).center;
    expect(widgetCenter.dx, 100);
    expect(widgetCenter.dy, 150);

    await tester.binding.setSurfaceSize(null);
    await tester.pump();
    widgetCenter = tester.getRect(find.byType(Text)).center;
    expect(widgetCenter.dx, windowCenterX);
    expect(widgetCenter.dy, windowCenterY);
  });
}
