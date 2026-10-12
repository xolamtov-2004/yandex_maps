
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/bloc/ride/ride_bloc.dart';
import 'package:yandex_map/bloc/ride/ride_event.dart';
import 'package:yandex_map/bloc/ride/ride_state.dart';
import 'package:yandex_map/model/Place.dart';
import 'package:yandex_map/model/tariff_dart.dart';
import 'package:yandex_map/screen/rating_screen.dart';
import 'package:yandex_map/screen/ride_screen.dart';
import 'package:yandex_map/screen/ride_search_screen.dart';

class RideFlowScreen extends StatelessWidget {
  final Place destination;
  final Tariff tariff;
  final bool isCash;

  const RideFlowScreen({
    super.key,
    required this.destination,
    required this.tariff,
    required this.isCash,
  });

  void _onStageChanged(BuildContext context, RideState state) {
    if (state.stage == RideStage.cancelled) {
      Navigator.pop(context); // tarif sahifasiga qaytadi
    } else if (state.stage == RideStage.finished) {
      Navigator.popUntil(context, (route) => route.isFirst); // bosh sahifa
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideBloc()..add(RideStarted()),
      child: BlocConsumer<RideBloc, RideState>(
        listenWhen: (previous, current) => previous.stage != current.stage,
        listener: _onStageChanged,
        buildWhen: (previous, current) => previous.stage != current.stage,
        builder: (context, state) {
          final stage = state.stage;

          if (stage == RideStage.searching || stage == RideStage.cancelled) {
            return RideSearchScreen(destination: destination, tariff: tariff);
          }
          if (stage == RideStage.driverComing ||
              stage == RideStage.inProgress) {
            return RideScreen(
              destination: destination,
              isInProgress: stage == RideStage.inProgress,
            );
          }
          return RatingScreen(
            destination: destination,
            tariff: tariff,
            isCash: isCash,
          );
        },
      ),
    );
  }
}