import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  Timer? _timer;
  int _tickCount = 0;

  SplashBloc() : super(const SplashState(activeIndex: 0)) {
    on<StartSplashEvent>(_onStartSplash);
    on<TickSplashEvent>(_onTickSplash);
  }

  void _onStartSplash(StartSplashEvent event, Emitter<SplashState> emit) {
    _timer?.cancel();
    _tickCount = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      _tickCount++;
      // Masalan, 8 marta aylanib (~3 soniya) keyingi sahifaga o'tadi
      if (_tickCount >= 8) {
        _timer?.cancel();
        add(TickSplashEvent(state.activeIndex, isCompleted: true));
      } else {
        final nextIndex = (state.activeIndex + 1) % 4;
        add(TickSplashEvent(nextIndex, isCompleted: false));
      }
    });
  }

  void _onTickSplash(TickSplashEvent event, Emitter<SplashState> emit) {
    emit(state.copyWith(
      activeIndex: event.activeIndex,
      isCompleted: event.isCompleted,
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
