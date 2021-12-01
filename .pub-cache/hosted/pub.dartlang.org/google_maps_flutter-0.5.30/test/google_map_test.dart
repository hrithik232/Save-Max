// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'fake_maps_controllers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final FakePlatformViewsController fakePlatformViewsController =
      FakePlatformViewsController();

  setUpAll(() {
    SystemChannels.platform_views.setMockMethodCallHandler(
        fakePlatformViewsController.fakePlatformViewsMethodHandler);
  });

  setUp(() {
    fakePlatformViewsController.reset();
  });

  testWidgets('Initial camera position', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.cameraPosition,
        const CameraPosition(target: LatLng(10.0, 15.0)));
  });

  testWidgets('Initial camera position change is a no-op',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
        ),
      ),
    );

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 16.0)),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.cameraPosition,
        const CameraPosition(target: LatLng(10.0, 15.0)));
  });

  testWidgets('Can update compassEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          compassEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.compassEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          compassEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.compassEnabled, true);
  });

  testWidgets('Can update mapToolbarEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          mapToolbarEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.mapToolbarEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          mapToolbarEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.mapToolbarEnabled, true);
  });

  testWidgets('Can update cameraTargetBounds', (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: LatLng(10.0, 15.0)),
          cameraTargetBounds: CameraTargetBounds(
            LatLngBounds(
              southwest: const LatLng(10.0, 20.0),
              northeast: const LatLng(30.0, 40.0),
            ),
          ),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(
        platformGoogleMap.cameraTargetBounds,
        CameraTargetBounds(
          LatLngBounds(
            southwest: const LatLng(10.0, 20.0),
            northeast: const LatLng(30.0, 40.0),
          ),
        ));

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: LatLng(10.0, 15.0)),
          cameraTargetBounds: CameraTargetBounds(
            LatLngBounds(
              southwest: const LatLng(16.0, 20.0),
              northeast: const LatLng(30.0, 40.0),
            ),
          ),
        ),
      ),
    );

    expect(
        platformGoogleMap.cameraTargetBounds,
        CameraTargetBounds(
          LatLngBounds(
            southwest: const LatLng(16.0, 20.0),
            northeast: const LatLng(30.0, 40.0),
          ),
        ));
  });

  testWidgets('Can update mapType', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          mapType: MapType.hybrid,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.mapType, MapType.hybrid);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          mapType: MapType.satellite,
        ),
      ),
    );

    expect(platformGoogleMap.mapType, MapType.satellite);
  });

  testWidgets('Can update minMaxZoom', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          minMaxZoomPreference: MinMaxZoomPreference(1.0, 3.0),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.minMaxZoomPreference,
        const MinMaxZoomPreference(1.0, 3.0));

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          minMaxZoomPreference: MinMaxZoomPreference.unbounded,
        ),
      ),
    );

    expect(
        platformGoogleMap.minMaxZoomPreference, MinMaxZoomPreference.unbounded);
  });

  testWidgets('Can update rotateGesturesEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          rotateGesturesEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.rotateGesturesEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          rotateGesturesEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.rotateGesturesEnabled, true);
  });

  testWidgets('Can update scrollGesturesEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          scrollGesturesEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.scrollGesturesEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          scrollGesturesEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.scrollGesturesEnabled, true);
  });

  testWidgets('Can update tiltGesturesEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          tiltGesturesEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.tiltGesturesEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          tiltGesturesEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.tiltGesturesEnabled, true);
  });

  testWidgets('Can update trackCameraPosition', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.trackCameraPosition, false);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: LatLng(10.0, 15.0)),
          onCameraMove: (CameraPosition position) {},
        ),
      ),
    );

    expect(platformGoogleMap.trackCameraPosition, true);
  });

  testWidgets('Can update zoomGesturesEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          zoomGesturesEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.zoomGesturesEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          zoomGesturesEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.zoomGesturesEnabled, true);
  });

  testWidgets('Can update zoomControlsEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          zoomControlsEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.zoomControlsEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          zoomControlsEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.zoomControlsEnabled, true);
  });

  testWidgets('Can update myLocationEnabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          myLocationEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.myLocationEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          myLocationEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.myLocationEnabled, true);
  });

  testWidgets('Can update myLocationButtonEnabled',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          myLocationEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.myLocationButtonEnabled, true);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          myLocationButtonEnabled: false,
        ),
      ),
    );

    expect(platformGoogleMap.myLocationButtonEnabled, false);
  });

  testWidgets('Is default padding 0', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.padding, <double>[0, 0, 0, 0]);
  });

  testWidgets('Can update padding', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.padding, <double>[0, 0, 0, 0]);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        ),
      ),
    );

    expect(platformGoogleMap.padding, <double>[20, 10, 40, 30]);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          padding: EdgeInsets.fromLTRB(50, 60, 70, 80),
        ),
      ),
    );

    expect(platformGoogleMap.padding, <double>[60, 50, 80, 70]);
  });

  testWidgets('Can update traffic', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          trafficEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.trafficEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          trafficEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.trafficEnabled, true);
  });

  testWidgets('Can update buildings', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          buildingsEnabled: false,
        ),
      ),
    );

    final FakePlatformGoogleMap platformGoogleMap =
        fakePlatformViewsController.lastCreatedView;

    expect(platformGoogleMap.buildingsEnabled, false);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(10.0, 15.0)),
          buildingsEnabled: true,
        ),
      ),
    );

    expect(platformGoogleMap.buildingsEnabled, true);
  });
}
