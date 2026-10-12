


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'sms_event.dart';
import 'sms_state.dart';

class SmsBloc extends Bloc<SmsEvent, SmsState> {
  final String phone;
  StreamSubscription<int>? _ticker;

  SmsBloc({required this.phone}) : super(const SmsState()) {
    on<SmsStarted>(_onStarted);
    on<SmsTicked>(_onTicked);
    on<SmsCodeChanged>(_onCodeChanged);
    on<SmsResendPressed>(_onResendPressed);
    on<SmsSubmitted>(_onSubmitted);
  }

  void _startTimer() {
    _ticker?.cancel();
    _ticker = Stream.periodic(
      const Duration(seconds: 1),
          (tick) => SmsState.resendSeconds - tick - 1,
    ).take(SmsState.resendSeconds).listen((seconds) => add(SmsTicked(seconds)));
  }

  void _onStarted(SmsStarted event, Emitter<SmsState> emit) {
    emit(state.copyWith(secondsLeft: SmsState.resendSeconds));
    _startTimer();
  }

  void _onTicked(SmsTicked event, Emitter<SmsState> emit) {
    emit(state.copyWith(secondsLeft: event.secondsLeft, error: state.error));
  }

  void _onCodeChanged(SmsCodeChanged event, Emitter<SmsState> emit) {
    var digits = event.value.replaceAll(RegExp(r'\D'), '');
    if (digits.length > SmsState.codeLength) {
      digits = digits.substring(0, SmsState.codeLength);
    }
    emit(state.copyWith(code: digits, status: SmsStatus.initial));
  }

  void _onResendPressed(SmsResendPressed event, Emitter<SmsState> emit) {
    if (!state.canResend) return;
    // TODO: shu yerda SMS qayta yuboriladi.
    emit(state.copyWith(
      code: '',
      secondsLeft: SmsState.resendSeconds,
      status: SmsStatus.initial,
    ));
    _startTimer();
  }

  Future<void> _onSubmitted(
      SmsSubmitted event,
      Emitter<SmsState> emit,
      ) async {
    if (!state.isComplete || state.isLoading) return;
    emit(state.copyWith(status: SmsStatus.loading));
    try {
      // TODO: shu yerda state.code serverda tekshiriladi.
      await Future.delayed(const Duration(seconds: 1));
      await _ticker?.cancel();
      emit(state.copyWith(status: SmsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SmsStatus.failure, error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}