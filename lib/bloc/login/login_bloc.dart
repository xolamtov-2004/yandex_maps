


import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginPhoneChanged>(_onPhoneChanged);
    on<LoginFocusChanged>(_onFocusChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onPhoneChanged(LoginPhoneChanged event, Emitter<LoginState> emit) {
    var digits = event.value.replaceAll(RegExp(r'\D'), '');
    if (digits.length > LoginState.phoneLength) {
      digits = digits.substring(0, LoginState.phoneLength);
    }
    emit(state.copyWith(phone: digits, status: LoginStatus.initial));
  }

  void _onFocusChanged(LoginFocusChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(isFocused: event.hasFocus));
  }

  Future<void> _onSubmitted(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    if (!state.isValid || state.isLoading) return;
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      // TODO: shu yerda state.fullPhone raqamiga SMS yuborish so'rovi bo'ladi.
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, error: e.toString()));
    }
  }
}