

import 'package:flutter_bloc/flutter_bloc.dart';

import 'ride_event.dart';
import 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  // Namuna: har bir bosqichgacha qancha kutiladi.
  static const _steps = {
    RideStage.driverComing: Duration(seconds: 4),
    RideStage.inProgress: Duration(seconds: 5),
    RideStage.arrived: Duration(seconds: 6),
  };

  RideBloc() : super(const RideState()) {
    on<RideStarted>(_onStarted);
    on<RideCancelled>(
          (event, emit) => emit(state.copyWith(stage: RideStage.cancelled)),
    );
    on<RideRatingChanged>(
          (event, emit) => emit(state.copyWith(rating: event.stars)),
    );
    on<RideCommentChanged>(
          (event, emit) => emit(state.copyWith(comment: event.text)),
    );
    on<RideFinished>(_onFinished);
  }

  Future<void> _onStarted(RideStarted event, Emitter<RideState> emit) async {
    for (final step in _steps.entries) {
      await Future.delayed(step.value);
      if (isClosed || state.stage == RideStage.cancelled) return;
      emit(state.copyWith(stage: step.key));
    }
  }

  Future<void> _onFinished(RideFinished event, Emitter<RideState> emit) async {
    if (state.rating == 0 || state.isSubmitting) return;
    emit(state.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(seconds: 1));
    if (isClosed) return;
    emit(state.copyWith(isSubmitting: false, stage: RideStage.finished));
  }
}