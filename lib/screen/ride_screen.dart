import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/map_helpers.dart';
import 'package:yandex_map/model/Place.dart';
import 'package:yandex_map/model/driver.dart';
import 'package:yandex_map/widgets/app_map.dart';
import 'package:yandex_map/widgets/fare_top_bar.dart';
import 'package:yandex_map/widgets/ride/driver_sheet.dart';
import 'package:yandex_map/widgets/ride/ride_status_header.dart';

class RideScreen extends StatelessWidget {
  final Place destination;
  final bool isInProgress;

  const RideScreen({
    super.key,
    required this.destination,
    required this.isInProgress,
  });

  /// Yo'lning t qismidagi nuqta (0 = boshi, 1 = oxiri). Mashina belgisi uchun.
  Place _pointOnRoute(double t) {
    return Place(
      title: 'car',
      subtitle: '',
      icon: Icons.local_taxi,
      color: AppPalette.orange,
      latitude: currentPlace.latitude +
          (destination.latitude - currentPlace.latitude) * t,
      longitude: currentPlace.longitude +
          (destination.longitude - currentPlace.longitude) * t,
    );
  }

  void _showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    const driver = sampleDriver;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppMap(
              mapObjects: [
                mapLine(
                  'route',
                  currentPlace,
                  destination,
                  const Color(0xFF3B82F6),
                ),
                mapDot('from', currentPlace, const Color(0xFF22C55E)),
                mapDot('to', destination, const Color(0xFFEF4444)),
                mapDot(
                  'car',
                  _pointOnRoute(isInProgress ? 0.5 : 0.05),
                  AppPalette.orange,
                ),
              ],
              onMapCreated: (controller) => moveCameraTo(
                controller,
                (currentPlace.latitude + destination.latitude) / 2,
                (currentPlace.longitude + destination.longitude) / 2,
                zoom: 12,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: FareTopBar(),
                ),
                RideStatusHeader(
                  isInProgress: isInProgress,
                  etaMinutes: driver.etaMinutes,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DriverSheet(
              driver: driver,
              from: currentPlace.title,
              to: destination.title,
              isInProgress: isInProgress,
              onCall: () => _showMessage(context, 'Haydovchi: ${driver.phone}'),
              onMessage: () =>
                  _showMessage(context, 'Xabar yozish tez orada qo\'shiladi'),
            ),
          ),
        ],
      ),
    );
  }
}