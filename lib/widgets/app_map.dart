
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AppMap extends StatelessWidget {
  final List<MapObject> mapObjects;
  final ValueChanged<YandexMapController> onMapCreated;

  const AppMap({
    super.key,
    this.mapObjects = const [],
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return YandexMap(mapObjects: mapObjects, onMapCreated: onMapCreated);
  }
}