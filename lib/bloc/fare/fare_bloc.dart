import 'package:flutter_bloc/flutter_bloc.dart';
import 'fare_event.dart';
import 'fare_status.dart';

class FareBloc extends Bloc<FareEvent, FareState> {
  FareBloc() : super(const FareState()) {
    on<FareTariffSelected>(
          (event, emit) => emit(
        state.copyWith(selectedIndex: event.index, status: FareStatus.initial),
      ),
    );
    on<FareOrderSubmitted>(_onOrderSubmitted);
  }

  Future<void> _onOrderSubmitted(
      FareOrderSubmitted event,
      Emitter<FareState> emit,
      ) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: FareStatus.loading));
    try {
      // TODO: shu yerda buyurtma serverga yuboriladi.
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FareStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FareStatus.failure));
    }
  }
}