// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PhysicalModel updates clipBehavior in updateRenderObject', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: PhysicalModel(color: Colors.red)),
    );

    final RenderPhysicalModel renderPhysicalModel = tester.allRenderObjects.whereType<RenderPhysicalModel>().first;

    expect(renderPhysicalModel.clipBehavior, equals(Clip.none));

    await tester.pumpWidget(
      const MaterialApp(home: PhysicalModel(clipBehavior: Clip.antiAlias, color: Colors.red)),
    );

    expect(renderPhysicalModel.clipBehavior, equals(Clip.antiAlias));
  });

  testWidgets('PhysicalShape updates clipBehavior in updateRenderObject', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: PhysicalShape(color: Colors.red, clipper: ShapeBorderClipper(shape: CircleBorder()))),
    );

    final RenderPhysicalShape renderPhysicalShape = tester.allRenderObjects.whereType<RenderPhysicalShape>().first;

    expect(renderPhysicalShape.clipBehavior, equals(Clip.none));

    await tester.pumpWidget(
      const MaterialApp(home: PhysicalShape(clipBehavior: Clip.antiAlias, color: Colors.red, clipper: ShapeBorderClipper(shape: CircleBorder()))),
    );

    expect(renderPhysicalShape.clipBehavior, equals(Clip.antiAlias));
  });

  testWidgets('PhysicalModel - creates a physical model layer when it needs compositing', (WidgetTester tester) async {
    debugDisableShadows = false;
    await tester.pumpWidget(
      MaterialApp(
        home: PhysicalModel(
          shape: BoxShape.rectangle,
          color: Colors.grey,
          shadowColor: Colors.red,
          elevation: 1.0,
          child: Material(child: TextField(controller: TextEditingController())),
        ),
      ),
    );
    await tester.pump();

    final RenderPhysicalModel renderPhysicalModel = tester.allRenderObjects.whereType<RenderPhysicalModel>().first;
    expect(renderPhysicalModel.needsCompositing, true);

    final PhysicalModelLayer physicalModelLayer = tester.layers.whereType<PhysicalModelLayer>().first;
    expect(physicalModelLayer.shadowColor, Colors.red);
    expect(physicalModelLayer.color, Colors.grey);
    expect(physicalModelLayer.elevation, 1.0);
    debugDisableShadows = true;
  });

  testWidgets('PhysicalModel - clips when overflows and elevation is 0', (WidgetTester tester) async {
    const Key key = Key('test');
    await tester.pumpWidget(
      MediaQuery(
        key: key,
        data: const MediaQueryData(devicePixelRatio: 1.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Row(
              children: const <Widget>[
                Material(child: Text('A long long long long long long long string')),
                Material(child: Text('A long long long long long long long string')),
                Material(child: Text('A long long long long long long long string')),
                Material(child: Text('A long long long long long long long string')),
              ],
            ),
          ),
        ),
      ),
    );

    final dynamic exception = tester.takeException();
    expect(exception, isFlutterError);
    // ignore: avoid_dynamic_calls
    expect(exception.diagnostics.first.level, DiagnosticLevel.summary);
    // ignore: avoid_dynamic_calls
    expect(exception.diagnostics.first.toString(), startsWith('A RenderFlex overflowed by '));
    await expectLater(
      find.byKey(key),
      matchesGoldenFile('physical_model_overflow.png'),
    );
  });
}
