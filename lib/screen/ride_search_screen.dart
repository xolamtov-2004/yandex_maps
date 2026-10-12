
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/bloc/ride/ride_bloc.dart';
import 'package:yandex_map/bloc/ride/ride_event.dart';
import 'package:yandex_map/core/map_helpers.dart';
import 'package:yandex_map/model/Place.dart';
import 'package:yandex_map/model/tariff_dart.dart';
import 'package:yandex_map/widgets/app_map.dart';
import 'package:yandex_map/widgets/fare_top_bar.dart';
import 'package:yandex_map/widgets/ride/route_info_card.dart';
import 'package:yandex_map/widgets/ride/searching_sheet.dart';

class RideSearchScreen extends StatelessWidget {
  final Place destination;
  final Tariff tariff;

  const RideSearchScreen({
    super.key,
    required this.destination,
    required this.tariff,
  });

  @override
  Widget build(BuildContext context) {
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
              ],
              onMapCreated: (controller) => moveCameraTo(
                controller,
                currentPlace.latitude,
                currentPlace.longitude,
                zoom: 13,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                children: [
                  const FareTopBar(),
                  const SizedBox(height: 12),
                  RouteInfoCard(
                    title: '${tariff.name} sayohat',
                    from: currentPlace.title,
                    to: destination.title,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SearchingSheet(
              from: currentPlace,
              to: destination,
              onCancel: () => context.read<RideBloc>().add(RideCancelled()),
            ),
          ),
        ],
      ),
    );
  }
}