

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yandex_map/core/map_helpers.dart';
import 'package:yandex_map/screen/ride_flow_screen.dart';

import '../bloc/fare/fare_bloc.dart';
import '../bloc/fare/fare_event.dart';
import '../bloc/fare/fare_status.dart';
import '../model/Place.dart';
import '../widgets/app_map.dart';
import '../widgets/fare_sheet.dart';
import '../widgets/fare_top_bar.dart';

class FareScreen extends StatelessWidget {
  final Place destination;

  const FareScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FareBloc(),
      child: _FareView(destination: destination),
    );
  }
}

class _FareView extends StatelessWidget {
  final Place destination;

  const _FareView({required this.destination});

  void _onStatusChanged(BuildContext context, FareState state) async {
    if (state.status == FareStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${state.selected.name}: buyurtma qabul qilindi'),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) =>RideFlowScreen(destination: destination, tariff: state.selected, isCash: true)));
      
    } else if (state.status == FareStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Buyurtma yuborilmadi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FareBloc>();

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
                (currentPlace.latitude + destination.latitude) / 2,
                (currentPlace.longitude + destination.longitude) / 2,
                zoom: 12,
              ),
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: FareTopBar(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocConsumer<FareBloc, FareState>(
              listenWhen: (previous, current) =>
              previous.status != current.status,
              listener: _onStatusChanged,
              builder: (context, state) => FareSheet(
                selectedIndex: state.selectedIndex,
                isLoading: state.isLoading,
                onSelected: (index) => bloc.add(FareTariffSelected(index)),
                onOrder: () => bloc.add(FareOrderSubmitted()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}