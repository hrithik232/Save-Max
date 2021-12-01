// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:stream_transform/stream_transform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TestGoogleMapsFlutterPlatform platform;

  setUp(() {
    // Use a mock platform so we never need to hit the MethodChannel code.
    platform = TestGoogleMapsFlutterPlatform();
    GoogleMapsFlutterPlatform.instance = platform;
  });

  testWidgets('_webOnlyMapCreationId increments with each GoogleMap widget', (
    WidgetTester tester,
  ) async {
    // Inject two map widgets...
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: const [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(43.362, -5.849),
              ),
            ),
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(47.649, -122.350),
              ),
            ),
          ],
        ),
      ),
    );

    // Verify that each one was created with a different _webOnlyMapCreationId.
    expect(platform.createdIds.length, 2);
    expect(platform.createdIds[0], 0);
    expect(platform.createdIds[1], 1);
  });

  testWidgets('Calls platform.dispose when GoogleMap is disposed of', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(43.3608, -5.8702),
      ),
    ));

    // Now dispose of the map...
    await tester.pumpWidget(Container());

    expect(platform.disposed, true);
  });
}

// A dummy implementation of the platform interface for tests.
class TestGoogleMapsFlutterPlatform extends GoogleMapsFlutterPlatform {
  TestGoogleMapsFlutterPlatform();

  // The IDs passed to each call to buildView, in call order.
  List<int> createdIds = <int>[];

  // Whether `dispose` has been called.
  bool disposed = false;

  // Stream controller to inject events for testing.
  final StreamController<MapEvent> mapEventStreamController =
      StreamController<MapEvent>.broadcast();

  @override
  Future<void> init(int mapId) async {}

  @override
  Future<void> updateMapOptions(
    Map<String, dynamic> optionsUpdate, {
    required int mapId,
  }) async {}

  @override
  Future<void> updateMarkers(
    MarkerUpdates markerUpdates, {
    required int mapId,
  }) async {}

  @override
  Future<void> updatePolygons(
    PolygonUpdates polygonUpdates, {
    required int mapId,
  }) async {}

  @override
  Future<void> updatePolylines(
    PolylineUpdates polylineUpdates, {
    required int mapId,
  }) async {}

  @override
  Future<void> updateCircles(
    CircleUpdates circleUpdates, {
    required int mapId,
  }) async {}

  @override
  Future<void> updateTileOverlays({
    required Set<TileOverlay> newTileOverlays,
    required int mapId,
  }) async {}

  @override
  Future<void> clearTileCache(
    TileOverlayId tileOverlayId, {
    required int mapId,
  }) async {}

  @override
  Future<void> animateCamera(
    CameraUpdate cameraUpdate, {
    required int mapId,
  }) async {}

  @override
  Future<void> moveCamera(
    CameraUpdate cameraUpdate, {
    required int mapId,
  }) async {}

  @override
  Future<void> setMapStyle(
    String? mapStyle, {
    required int mapId,
  }) async {}

  @override
  Future<LatLngBounds> getVisibleRegion({
    required int mapId,
  }) async {
    return LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
  }

  @override
  Future<ScreenCoordinate> getScreenCoordinate(
    LatLng latLng, {
    required int mapId,
  }) async {
    return ScreenCoordinate(x: 0, y: 0);
  }

  @override
  Future<LatLng> getLatLng(
    ScreenCoordinate screenCoordinate, {
    required int mapId,
  }) async {
    return LatLng(0, 0);
  }

  @override
  Future<void> showMarkerInfoWindow(
    MarkerId markerId, {
    required int mapId,
  }) async {}

  @override
  Future<void> hideMarkerInfoWindow(
    MarkerId markerId, {
    required int mapId,
  }) async {}

  @override
  Future<bool> isMarkerInfoWindowShown(
    MarkerId markerId, {
    required int mapId,
  }) async {
    return false;
  }

  @override
  Future<double> getZoomLevel({
    required int mapId,
  }) async {
    return 0.0;
  }

  @override
  Future<Uint8List?> takeSnapshot({
    required int mapId,
  }) async {
    return null;
  }

  @override
  Stream<CameraMoveStartedEvent> onCameraMoveStarted({required int mapId}) {
    return mapEventStreamController.stream.whereType<CameraMoveStartedEvent>();
  }

  @override
  Stream<CameraMoveEvent> onCameraMove({required int mapId}) {
    return mapEventStreamController.stream.whereType<CameraMoveEvent>();
  }

  @override
  Stream<CameraIdleEvent> onCameraIdle({required int mapId}) {
    return mapEventStreamController.stream.whereType<CameraIdleEvent>();
  }

  @override
  Stream<MarkerTapEvent> onMarkerTap({required int mapId}) {
    return mapEventStreamController.stream.whereType<MarkerTapEvent>();
  }

  @override
  Stream<InfoWindowTapEvent> onInfoWindowTap({required int mapId}) {
    return mapEventStreamController.stream.whereType<InfoWindowTapEvent>();
  }

  @override
  Stream<MarkerDragStartEvent> onMarkerDragStart({required int mapId}) {
    return mapEventStreamController.stream.whereType<MarkerDragStartEvent>();
  }

  @override
  Stream<MarkerDragEvent> onMarkerDrag({required int mapId}) {
    return mapEventStreamController.stream.whereType<MarkerDragEvent>();
  }

  @override
  Stream<MarkerDragEndEvent> onMarkerDragEnd({required int mapId}) {
    return mapEventStreamController.stream.whereType<MarkerDragEndEvent>();
  }

  @override
  Stream<PolylineTapEvent> onPolylineTap({required int mapId}) {
    return mapEventStreamController.stream.whereType<PolylineTapEvent>();
  }

  @override
  Stream<PolygonTapEvent> onPolygonTap({required int mapId}) {
    return mapEventStreamController.stream.whereType<PolygonTapEvent>();
  }

  @override
  Stream<CircleTapEvent> onCircleTap({required int mapId}) {
    return mapEventStreamController.stream.whereType<CircleTapEvent>();
  }

  @override
  Stream<MapTapEvent> onTap({required int mapId}) {
    return mapEventStreamController.stream.whereType<MapTapEvent>();
  }

  @override
  Stream<MapLongPressEvent> onLongPress({required int mapId}) {
    return mapEventStreamController.stream.whereType<MapLongPressEvent>();
  }

  @override
  void dispose({required int mapId}) {
    disposed = true;
  }

  @override
  Widget buildView(
    int creationId,
    PlatformViewCreatedCallback onPlatformViewCreated, {
    required CameraPosition initialCameraPosition,
    Set<Marker> markers = const <Marker>{},
    Set<Polygon> polygons = const <Polygon>{},
    Set<Polyline> polylines = const <Polyline>{},
    Set<Circle> circles = const <Circle>{},
    Set<TileOverlay> tileOverlays = const <TileOverlay>{},
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers =
        const <Factory<OneSequenceGestureRecognizer>>{},
    Map<String, dynamic> mapOptions = const <String, dynamic>{},
  }) {
    onPlatformViewCreated(0);
    createdIds.add(creationId);
    return Container();
  }
}
