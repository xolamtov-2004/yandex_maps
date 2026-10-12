import 'package:bloc/bloc.dart';
import 'package:yandex_map/bloc/onSplash/on_splash_page_changed_event.dart';
import 'package:yandex_map/bloc/onSplash/on_splash_page_changed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/splash_screen_item.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(OnboardingState(pageCount: onboardingItems.length)) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextPressed>(_onNextPressed);
    on<OnboardingSkipPressed>(_onSkipPressed);
  }

  void _onPageChanged(
      OnboardingPageChanged event,
      Emitter<OnboardingState> emit,
      ) {
    if (event.index == state.currentPage) return;
    emit(state.copyWith(currentPage: event.index));
  }

  void _onNextPressed(
      OnboardingNextPressed event,
      Emitter<OnboardingState> emit,
      ) {
    if (state.isLastPage) {
      emit(state.copyWith(isCompleted: true));
    } else {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void _onSkipPressed(
      OnboardingSkipPressed event,
      Emitter<OnboardingState> emit,
      ) {
    emit(state.copyWith(isCompleted: true));
  }
}