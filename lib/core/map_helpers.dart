import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../model/Place.dart';

Point pointOf(Place place) =>
    Point(latitude: place.latitude, longitude: place.longitude);

/// Xaritadagi rangli nuqta (rasm faylisiz ishlaydi).
CircleMapObject mapDot(String id, Place place, Color color) {
  return CircleMapObject(
    mapId: MapObjectId(id),
    circle: Circle(center: pointOf(place), radius: 60),
    fillColor: color,
    strokeColor: Colors.white,
    strokeWidth: 3,
  );
}

/// Ikki nuqta orasidagi to'g'ri chiziq.
PolylineMapObject mapLine(String id, Place from, Place to, Color color) {
  return PolylineMapObject(
    mapId: MapObjectId(id),
    polyline: Polyline(points: [pointOf(from), pointOf(to)]),
    strokeColor: color,
    strokeWidth: 4,
  );
}

Future<void> moveCameraTo(
    YandexMapController controller,
    double latitude,
    double longitude, {
      double zoom = 15,
    }) {
  return controller.moveCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(
        target: Point(latitude: latitude, longitude: longitude),
        zoom: zoom,
      ),
    ),
    animation: const MapAnimation(type: MapAnimationType.smooth, duration: 0.6),
  );
}