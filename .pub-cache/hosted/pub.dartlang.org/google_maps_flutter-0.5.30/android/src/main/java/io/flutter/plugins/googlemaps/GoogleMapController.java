// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.googlemaps;

import static io.flutter.plugins.googlemaps.GoogleMapsPlugin.CREATED;
import static io.flutter.plugins.googlemaps.GoogleMapsPlugin.DESTROYED;
import static io.flutter.plugins.googlemaps.GoogleMapsPlugin.PAUSED;
import static io.flutter.plugins.googlemaps.GoogleMapsPlugin.RESUMED;
import static io.flutter.plugins.googlemaps.GoogleMapsPlugin.STARTED;
import static io.flutter.plugins.googlemaps.GoogleMapsPlugin.STOPPED;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.SnapshotReadyCallback;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.MapStyleOptions;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.Polyline;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/** Controller of a single GoogleMaps MapView instance. */
final class GoogleMapController
    implements Application.ActivityLifecycleCallbacks,
        DefaultLifecycleObserver,
        ActivityPluginBinding.OnSaveInstanceStateListener,
        GoogleMapOptionsSink,
        MethodChannel.MethodCallHandler,
        OnMapReadyCallback,
        GoogleMapListener,
        PlatformView {

  private static final String TAG = "GoogleMapController";
  private final int id;
  private final AtomicInteger activityState;
  private final MethodChannel methodChannel;
  private final GoogleMapOptions options;
  @Nullable private MapView mapView;
  private GoogleMap googleMap;
  private boolean trackCameraPosition = false;
  private boolean myLocationEnabled = false;
  private boolean myLocationButtonEnabled = false;
  private boolean zoomControlsEnabled = true;
  private boolean indoorEnabled = true;
  private boolean trafficEnabled = false;
  private boolean buildingsEnabled = true;
  private boolean disposed = false;
  private final float density;
  private MethodChannel.Result mapReadyResult;
  private final int
      activityHashCode; // Do not use directly, use getActivityHashCode() instead to get correct hashCode for both v1 and v2 embedding.
  private final Lifecycle lifecycle;
  private final Context context;
  private final Application
      mApplication; // Do not use direclty, use getApplication() instead to get correct application object for both v1 and v2 embedding.
  private final PluginRegistry.Registrar registrar; // For v1 embedding only.
  private final MarkersController markersController;
  private final PolygonsController polygonsController;
  private final PolylinesController polylinesController;
  private final CirclesController circlesController;
  private List<Object> initialMarkers;
  private List<Object> initialPolygons;
  private List<Object> initialPolylines;
  private List<Object> initialCircles;

  GoogleMapController(
      int id,
      Context context,
      AtomicInteger activityState,
      BinaryMessenger binaryMessenger,
      Application application,
      Lifecycle lifecycle,
      PluginRegistry.Registrar registrar,
      int registrarActivityHashCode,
      GoogleMapOptions options) {
    this.id = id;
    this.context = context;
    this.activityState = activityState;
    this.options = options;
    this.mapView = new MapView(context, options);
    this.density = context.getResources().getDisplayMetrics().density;
    methodChannel = new MethodChannel(binaryMessenger, "plugins.flutter.io/google_maps_" + id);
    methodChannel.setMethodCallHandler(this);
    mApplication = application;
    this.lifecycle = lifecycle;
    this.registrar = registrar;
    this.activityHashCode = registrarActivityHashCode;
    this.markersController = new MarkersController(methodChannel);
    this.polygonsController = new PolygonsController(methodChannel, density);
    this.polylinesController = new PolylinesController(methodChannel, density);
    this.circlesController = new CirclesController(methodChannel, density);
  }

  @Override
  public View getView() {
    return mapView;
  }

  void init() {
    switch (activityState.get()) {
      case STOPPED:
        mapView.onCreate(null);
        mapView.onStart();
        mapView.onResume();
        mapView.onPause();
        mapView.onStop();
        break;
      case PAUSED:
        mapView.onCreate(null);
        mapView.onStart();
        mapView.onResume();
        mapView.onPause();
        break;
      case RESUMED:
        mapView.onCreate(null);
        mapView.onStart();
        mapView.onResume();
        break;
      case STARTED:
        mapView.onCreate(null);
        mapView.onStart();
        break;
      case CREATED:
        mapView.onCreate(null);
        break;
      case DESTROYED:
        // Nothing to do, the activity has been completely destroyed.
        break;
      default:
        throw new IllegalArgumentException(
            "Cannot interpret " + activityState.get() + " as an activity state");
    }
    if (lifecycle != null) {
      lifecycle.addObserver(this);
    } else {
      getApplication().registerActivityLifecycleCallbacks(this);
    }
    mapView.getMapAsync(this);
  }

  private void moveCamera(CameraUpdate cameraUpdate) {
    googleMap.moveCamera(cameraUpdate);
  }

  private void animateCamera(CameraUpdate cameraUpdate) {
    googleMap.animateCamera(cameraUpdate);
  }

  private CameraPosition getCameraPosition() {
    return trackCameraPosition ? googleMap.getCameraPosition() : null;
  }

  @Override
  public void onMapReady(GoogleMap googleMap) {
    this.googleMap = googleMap;
    this.googleMap.setIndoorEnabled(this.indoorEnabled);
    this.googleMap.setTrafficEnabled(this.trafficEnabled);
    this.googleMap.setBuildingsEnabled(this.buildingsEnabled);
    googleMap.setOnInfoWindowClickListener(this);
    if (mapReadyResult != null) {
      mapReadyResult.success(null);
      mapReadyResult = null;
    }
    setGoogleMapListener(this);
    updateMyLocationSettings();
    markersController.setGoogleMap(googleMap);
    polygonsController.setGoogleMap(googleMap);
    polylinesController.setGoogleMap(googleMap);
    circlesController.setGoogleMap(googleMap);
    updateInitialMarkers();
    updateInitialPolygons();
    updateInitialPolylines();
    updateInitialCircles();
  }

  @Override
  public void onMethodCall(MethodCall call, MethodChannel.Result result) {
    switch (call.method) {
      case "map#waitForMap":
        if (googleMap != null) {
          result.success(null);
          return;
        }
        mapReadyResult = result;
        break;
      case "map#update":
        {
          Convert.interpretGoogleMapOptions(call.argument("options"), this);
          result.success(Convert.cameraPositionToJson(getCameraPosition()));
          break;
        }
      case "map#getVisibleRegion":
        {
          if (googleMap != null) {
            LatLngBounds latLngBounds = googleMap.getProjection().getVisibleRegion().latLngBounds;
            result.success(Convert.latlngBoundsToJson(latLngBounds));
          } else {
            result.error(
                "GoogleMap uninitialized",
                "getVisibleRegion called prior to map initialization",
                null);
          }
          break;
        }
      case "map#getScreenCoordinate":
        {
          if (googleMap != null) {
            LatLng latLng = Convert.toLatLng(call.arguments);
            Point screenLocation = googleMap.getProjection().toScreenLocation(latLng);
            result.success(Convert.pointToJson(screenLocation));
          } else {
            result.error(
                "GoogleMap uninitialized",
                "getScreenCoordinate called prior to map initialization",
                null);
          }
          break;
        }
      case "map#getLatLng":
        {
          if (googleMap != null) {
            Point point = Convert.toPoint(call.arguments);
            LatLng latLng = googleMap.getProjection().fromScreenLocation(point);
            result.success(Convert.latLngToJson(latLng));
          } else {
            result.error(
                "GoogleMap uninitialized", "getLatLng called prior to map initialization", null);
          }
          break;
        }
      case "map#takeSnapshot":
        {
          if (googleMap != null) {
            final MethodChannel.Result _result = result;
            googleMap.snapshot(
                new SnapshotReadyCallback() {
                  @Override
                  public void onSnapshotReady(Bitmap bitmap) {
                    ByteArrayOutputStream stream = new ByteArrayOutputStream();
                    bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream);
                    byte[] byteArray = stream.toByteArray();
                    bitmap.recycle();
                    _result.success(byteArray);
                  }
                });
          } else {
            result.error("GoogleMap uninitialized", "takeSnapshot", null);
          }
          break;
        }
      case "camera#move":
        {
          final CameraUpdate cameraUpdate =
              Convert.toCameraUpdate(call.argument("cameraUpdate"), density);
          moveCamera(cameraUpdate);
          result.success(null);
          break;
        }
      case "camera#animate":
        {
          final CameraUpdate cameraUpdate =
              Convert.toCameraUpdate(call.argument("cameraUpdate"), density);
          animateCamera(cameraUpdate);
          result.success(null);
          break;
        }
      case "markers#update":
        {
          Object markersToAdd = call.argument("markersToAdd");
          markersController.addMarkers((List<Object>) markersToAdd);
          Object markersToChange = call.argument("markersToChange");
          markersController.changeMarkers((List<Object>) markersToChange);
          Object markerIdsToRemove = call.argument("markerIdsToRemove");
          markersController.removeMarkers((List<Object>) markerIdsToRemove);
          result.success(null);
          break;
        }
      case "markers#showInfoWindow":
        {
          Object markerId = call.argument("markerId");
          markersController.showMarkerInfoWindow((String) markerId, result);
          break;
        }
      case "markers#hideInfoWindow":
        {
          Object markerId = call.argument("markerId");
          markersController.hideMarkerInfoWindow((String) markerId, result);
          break;
        }
      case "markers#isInfoWindowShown":
        {
          Object markerId = call.argument("markerId");
          markersController.isInfoWindowShown((String) markerId, result);
          break;
        }
      case "polygons#update":
        {
          Object polygonsToAdd = call.argument("polygonsToAdd");
          polygonsController.addPolygons((List<Object>) polygonsToAdd);
          Object polygonsToChange = call.argument("polygonsToChange");
          polygonsController.changePolygons((List<Object>) polygonsToChange);
          Object polygonIdsToRemove = call.argument("polygonIdsToRemove");
          polygonsController.removePolygons((List<Object>) polygonIdsToRemove);
          result.success(null);
          break;
        }
      case "polylines#update":
        {
          Object polylinesToAdd = call.argument("polylinesToAdd");
          polylinesController.addPolylines((List<Object>) polylinesToAdd);
          Object polylinesToChange = call.argument("polylinesToChange");
          polylinesController.changePolylines((List<Object>) polylinesToChange);
          Object polylineIdsToRemove = call.argument("polylineIdsToRemove");
          polylinesController.removePolylines((List<Object>) polylineIdsToRemove);
          result.success(null);
          break;
        }
      case "circles#update":
        {
          Object circlesToAdd = call.argument("circlesToAdd");
          circlesController.addCircles((List<Object>) circlesToAdd);
          Object circlesToChange = call.argument("circlesToChange");
          circlesController.changeCircles((List<Object>) circlesToChange);
          Object circleIdsToRemove = call.argument("circleIdsToRemove");
          circlesController.removeCircles((List<Object>) circleIdsToRemove);
          result.success(null);
          break;
        }
      case "map#isCompassEnabled":
        {
          result.success(googleMap.getUiSettings().isCompassEnabled());
          break;
        }
      case "map#isMapToolbarEnabled":
        {
          result.success(googleMap.getUiSettings().isMapToolbarEnabled());
          break;
        }
      case "map#getMinMaxZoomLevels":
        {
          List<Float> zoomLevels = new ArrayList<>(2);
          zoomLevels.add(googleMap.getMinZoomLevel());
          zoomLevels.add(googleMap.getMaxZoomLevel());
          result.success(zoomLevels);
          break;
        }
      case "map#isZoomGesturesEnabled":
        {
          result.success(googleMap.getUiSettings().isZoomGesturesEnabled());
          break;
        }
      case "map#isLiteModeEnabled":
        {
          result.success(options.getLiteMode());
          break;
        }
      case "map#isZoomControlsEnabled":
        {
          result.success(googleMap.getUiSettings().isZoomControlsEnabled());
          break;
        }
      case "map#isScrollGesturesEnabled":
        {
          result.success(googleMap.getUiSettings().isScrollGesturesEnabled());
          break;
        }
      case "map#isTiltGesturesEnabled":
        {
          result.success(googleMap.getUiSettings().isTiltGesturesEnabled());
          break;
        }
      case "map#isRotateGesturesEnabled":
        {
          result.success(googleMap.getUiSettings().isRotateGesturesEnabled());
          break;
        }
      case "map#isMyLocationButtonEnabled":
        {
          result.success(googleMap.getUiSettings().isMyLocationButtonEnabled());
          break;
        }
      case "map#isTrafficEnabled":
        {
          result.success(googleMap.isTrafficEnabled());
          break;
        }
      case "map#isBuildingsEnabled":
        {
          result.success(googleMap.isBuildingsEnabled());
          break;
        }
      case "map#getZoomLevel":
        {
          result.success(googleMap.getCameraPosition().zoom);
          break;
        }
      case "map#setStyle":
        {
          String mapStyle = (String) call.arguments;
          boolean mapStyleSet;
          if (mapStyle == null) {
            mapStyleSet = googleMap.setMapStyle(null);
          } else {
            mapStyleSet = googleMap.setMapStyle(new MapStyleOptions(mapStyle));
          }
          ArrayList<Object> mapStyleResult = new ArrayList<>(2);
          mapStyleResult.add(mapStyleSet);
          if (!mapStyleSet) {
            mapStyleResult.add(
                "Unable to set the map style. Please check console logs for errors.");
          }
          result.success(mapStyleResult);
          break;
        }
      default:
        result.notImplemented();
    }
  }

  @Override
  public void onMapClick(LatLng latLng) {
    final Map<String, Object> arguments = new HashMap<>(2);
    arguments.put("position", Convert.latLngToJson(latLng));
    methodChannel.invokeMethod("map#onTap", arguments);
  }

  @Override
  public void onMapLongClick(LatLng latLng) {
    final Map<String, Object> arguments = new HashMap<>(2);
    arguments.put("position", Convert.latLngToJson(latLng));
    methodChannel.invokeMethod("map#onLongPress", arguments);
  }

  @Override
  public void onCameraMoveStarted(int reason) {
    final Map<String, Object> arguments = new HashMap<>(2);
    boolean isGesture = reason == GoogleMap.OnCameraMoveStartedListener.REASON_GESTURE;
    arguments.put("isGesture", isGesture);
    methodChannel.invokeMethod("camera#onMoveStarted", arguments);
  }

  @Override
  public void onInfoWindowClick(Marker marker) {
    markersController.onInfoWindowTap(marker.getId());
  }

  @Override
  public void onCameraMove() {
    if (!trackCameraPosition) {
      return;
    }
    final Map<String, Object> arguments = new HashMap<>(2);
    arguments.put("position", Convert.cameraPositionToJson(googleMap.getCameraPosition()));
    methodChannel.invokeMethod("camera#onMove", arguments);
  }

  @Override
  public void onCameraIdle() {
    methodChannel.invokeMethod("camera#onIdle", Collections.singletonMap("map", id));
  }

  @Override
  public boolean onMarkerClick(Marker marker) {
    return markersController.onMarkerTap(marker.getId());
  }

  @Override
  public void onMarkerDragStart(Marker marker) {}

  @Override
  public void onMarkerDrag(Marker marker) {}

  @Override
  public void onMarkerDragEnd(Marker marker) {
    markersController.onMarkerDragEnd(marker.getId(), marker.getPosition());
  }

  @Override
  public void onPolygonClick(Polygon polygon) {
    polygonsController.onPolygonTap(polygon.getId());
  }

  @Override
  public void onPolylineClick(Polyline polyline) {
    polylinesController.onPolylineTap(polyline.getId());
  }

  @Override
  public void onCircleClick(Circle circle) {
    circlesController.onCircleTap(circle.getId());
  }

  @Override
  public void dispose() {
    if (disposed) {
      return;
    }
    disposed = true;
    methodChannel.setMethodCallHandler(null);
    setGoogleMapListener(null);
    destroyMapViewIfNecessary();
    getApplication().unregisterActivityLifecycleCallbacks(this);
  }

  private void setGoogleMapListener(@Nullable GoogleMapListener listener) {
    googleMap.setOnCameraMoveStartedListener(listener);
    googleMap.setOnCameraMoveListener(listener);
    googleMap.setOnCameraIdleListener(listener);
    googleMap.setOnMarkerClickListener(listener);
    googleMap.setOnMarkerDragListener(listener);
    googleMap.setOnPolygonClickListener(listener);
    googleMap.setOnPolylineClickListener(listener);
    googleMap.setOnCircleClickListener(listener);
    googleMap.setOnMapClickListener(listener);
    googleMap.setOnMapLongClickListener(listener);
  }

  // @Override
  // The minimum supported version of Flutter doesn't have this method on the PlatformView interface, but the maximum
  // does. This will override it when available even with the annotation commented out.
  public void onInputConnectionLocked() {
    // TODO(mklim): Remove this empty override once https://github.com/flutter/flutter/issues/40126 is fixed in stable.
  };

  // @Override
  // The minimum supported version of Flutter doesn't have this method on the PlatformView interface, but the maximum
  // does. This will override it when available even with the annotation commented out.
  public void onInputConnectionUnlocked() {
    // TODO(mklim): Remove this empty override once https://github.com/flutter/flutter/issues/40126 is fixed in stable.
  };

  // Application.ActivityLifecycleCallbacks methods
  @Override
  public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    mapView.onCreate(savedInstanceState);
  }

  @Override
  public void onActivityStarted(Activity activity) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    mapView.onStart();
  }

  @Override
  public void onActivityResumed(Activity activity) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    mapView.onResume();
  }

  @Override
  public void onActivityPaused(Activity activity) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    mapView.onPause();
  }

  @Override
  public void onActivityStopped(Activity activity) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    mapView.onStop();
  }

  @Override
  public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    mapView.onSaveInstanceState(outState);
  }

  @Override
  public void onActivityDestroyed(Activity activity) {
    if (disposed || activity.hashCode() != getActivityHashCode()) {
      return;
    }
    destroyMapViewIfNecessary();
  }

  // DefaultLifecycleObserver and OnSaveInstanceStateListener

  @Override
  public void onCreate(@NonNull LifecycleOwner owner) {
    if (disposed) {
      return;
    }
    mapView.onCreate(null);
  }

  @Override
  public void onStart(@NonNull LifecycleOwner owner) {
    if (disposed) {
      return;
    }
    mapView.onStart();
  }

  @Override
  public void onResume(@NonNull LifecycleOwner owner) {
    if (disposed) {
      return;
    }
    mapView.onResume();
  }

  @Override
  public void onPause(@NonNull LifecycleOwner owner) {
    if (disposed) {
      return;
    }
    mapView.onResume();
  }

  @Override
  public void onStop(@NonNull LifecycleOwner owner) {
    if (disposed) {
      return;
    }
    mapView.onStop();
  }

  @Override
  public void onDestroy(@NonNull LifecycleOwner owner) {
    if (disposed) {
      return;
    }
    destroyMapViewIfNecessary();
  }

  @Override
  public void onRestoreInstanceState(Bundle bundle) {
    if (disposed) {
      return;
    }
    mapView.onCreate(bundle);
  }

  @Override
  public void onSaveInstanceState(Bundle bundle) {
    if (disposed) {
      return;
    }
    mapView.onSaveInstanceState(bundle);
  }

  // GoogleMapOptionsSink methods

  @Override
  public void setCameraTargetBounds(LatLngBounds bounds) {
    googleMap.setLatLngBoundsForCameraTarget(bounds);
  }

  @Override
  public void setCompassEnabled(boolean compassEnabled) {
    googleMap.getUiSettings().setCompassEnabled(compassEnabled);
  }

  @Override
  public void setMapToolbarEnabled(boolean mapToolbarEnabled) {
    googleMap.getUiSettings().setMapToolbarEnabled(mapToolbarEnabled);
  }

  @Override
  public void setMapType(int mapType) {
    googleMap.setMapType(mapType);
  }

  @Override
  public void setTrackCameraPosition(boolean trackCameraPosition) {
    this.trackCameraPosition = trackCameraPosition;
  }

  @Override
  public void setRotateGesturesEnabled(boolean rotateGesturesEnabled) {
    googleMap.getUiSettings().setRotateGesturesEnabled(rotateGesturesEnabled);
  }

  @Override
  public void setScrollGesturesEnabled(boolean scrollGesturesEnabled) {
    googleMap.getUiSettings().setScrollGesturesEnabled(scrollGesturesEnabled);
  }

  @Override
  public void setTiltGesturesEnabled(boolean tiltGesturesEnabled) {
    googleMap.getUiSettings().setTiltGesturesEnabled(tiltGesturesEnabled);
  }

  @Override
  public void setMinMaxZoomPreference(Float min, Float max) {
    googleMap.resetMinMaxZoomPreference();
    if (min != null) {
      googleMap.setMinZoomPreference(min);
    }
    if (max != null) {
      googleMap.setMaxZoomPreference(max);
    }
  }

  @Override
  public void setPadding(float top, float left, float bottom, float right) {
    if (googleMap != null) {
      googleMap.setPadding(
          (int) (left * density),
          (int) (top * density),
          (int) (right * density),
          (int) (bottom * density));
    }
  }

  @Override
  public void setZoomGesturesEnabled(boolean zoomGesturesEnabled) {
    googleMap.getUiSettings().setZoomGesturesEnabled(zoomGesturesEnabled);
  }

  /** This call will have no effect on already created map */
  @Override
  public void setLiteModeEnabled(boolean liteModeEnabled) {
    options.liteMode(liteModeEnabled);
  }

  @Override
  public void setMyLocationEnabled(boolean myLocationEnabled) {
    if (this.myLocationEnabled == myLocationEnabled) {
      return;
    }
    this.myLocationEnabled = myLocationEnabled;
    if (googleMap != null) {
      updateMyLocationSettings();
    }
  }

  @Override
  public void setMyLocationButtonEnabled(boolean myLocationButtonEnabled) {
    if (this.myLocationButtonEnabled == myLocationButtonEnabled) {
      return;
    }
    this.myLocationButtonEnabled = myLocationButtonEnabled;
    if (googleMap != null) {
      updateMyLocationSettings();
    }
  }

  @Override
  public void setZoomControlsEnabled(boolean zoomControlsEnabled) {
    if (this.zoomControlsEnabled == zoomControlsEnabled) {
      return;
    }
    this.zoomControlsEnabled = zoomControlsEnabled;
    if (googleMap != null) {
      googleMap.getUiSettings().setZoomControlsEnabled(zoomControlsEnabled);
    }
  }

  @Override
  public void setInitialMarkers(Object initialMarkers) {
    this.initialMarkers = (List<Object>) initialMarkers;
    if (googleMap != null) {
      updateInitialMarkers();
    }
  }

  private void updateInitialMarkers() {
    markersController.addMarkers(initialMarkers);
  }

  @Override
  public void setInitialPolygons(Object initialPolygons) {
    this.initialPolygons = (List<Object>) initialPolygons;
    if (googleMap != null) {
      updateInitialPolygons();
    }
  }

  private void updateInitialPolygons() {
    polygonsController.addPolygons(initialPolygons);
  }

  @Override
  public void setInitialPolylines(Object initialPolylines) {
    this.initialPolylines = (List<Object>) initialPolylines;
    if (googleMap != null) {
      updateInitialPolylines();
    }
  }

  private void updateInitialPolylines() {
    polylinesController.addPolylines(initialPolylines);
  }

  @Override
  public void setInitialCircles(Object initialCircles) {
    this.initialCircles = (List<Object>) initialCircles;
    if (googleMap != null) {
      updateInitialCircles();
    }
  }

  private void updateInitialCircles() {
    circlesController.addCircles(initialCircles);
  }

  @SuppressLint("MissingPermission")
  private void updateMyLocationSettings() {
    if (hasLocationPermission()) {
      // The plugin doesn't add the location permission by default so that apps that don't need
      // the feature won't require the permission.
      // Gradle is doing a static check for missing permission and in some configurations will
      // fail the build if the permission is missing. The following disables the Gradle lint.
      //noinspection ResourceType
      googleMap.setMyLocationEnabled(myLocationEnabled);
      googleMap.getUiSettings().setMyLocationButtonEnabled(myLocationButtonEnabled);
    } else {
      // TODO(amirh): Make the options update fail.
      // https://github.com/flutter/flutter/issues/24327
      Log.e(TAG, "Cannot enable MyLocation layer as location permissions are not granted");
    }
  }

  private boolean hasLocationPermission() {
    return checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
            == PackageManager.PERMISSION_GRANTED
        || checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION)
            == PackageManager.PERMISSION_GRANTED;
  }

  private int checkSelfPermission(String permission) {
    if (permission == null) {
      throw new IllegalArgumentException("permission is null");
    }
    return context.checkPermission(
        permission, android.os.Process.myPid(), android.os.Process.myUid());
  }

  private int getActivityHashCode() {
    if (registrar != null && registrar.activity() != null) {
      return registrar.activity().hashCode();
    } else {
      return activityHashCode;
    }
  }

  private Application getApplication() {
    if (registrar != null && registrar.activity() != null) {
      return registrar.activity().getApplication();
    } else {
      return mApplication;
    }
  }

  private void destroyMapViewIfNecessary() {
    if (mapView == null) {
      return;
    }
    mapView.onDestroy();
    mapView = null;
  }

  public void setIndoorEnabled(boolean indoorEnabled) {
    this.indoorEnabled = indoorEnabled;
  }

  public void setTrafficEnabled(boolean trafficEnabled) {
    this.trafficEnabled = trafficEnabled;
    if (googleMap == null) {
      return;
    }
    googleMap.setTrafficEnabled(trafficEnabled);
  }

  public void setBuildingsEnabled(boolean buildingsEnabled) {
    this.buildingsEnabled = buildingsEnabled;
  }
}

interface GoogleMapListener
    extends GoogleMap.OnCameraIdleListener,
        GoogleMap.OnCameraMoveListener,
        GoogleMap.OnCameraMoveStartedListener,
        GoogleMap.OnInfoWindowClickListener,
        GoogleMap.OnMarkerClickListener,
        GoogleMap.OnPolygonClickListener,
        GoogleMap.OnPolylineClickListener,
        GoogleMap.OnCircleClickListener,
        GoogleMap.OnMapClickListener,
        GoogleMap.OnMapLongClickListener,
        GoogleMap.OnMarkerDragListener {}
