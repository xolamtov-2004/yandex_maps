import 'package:flutter_bloc/flutter_bloc.dart';
import 'promo_event.dart';
import 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  // Namuna: amal qiladigan kodlar. Keyin server tekshiradi.
  static const _validCodes = {'YANGIGO': '10% chegirma'};

  PromoBloc() : super(const PromoState()) {
    on<PromoCodeChanged>(
          (event, emit) => emit(
        state.copyWith(
          code: event.code.trim().toUpperCase(),
          status: PromoStatus.initial,
          message: '',
        ),
      ),
    );
    on<PromoApplied>(_onApplied);
    on<PromoCashbackToggled>(
          (event, emit) => emit(state.copyWith(useCashback: !state.useCashback)),
    );
  }

  void _onApplied(PromoApplied event, Emitter<PromoState> emit) {
    if (state.code.isEmpty) return;
    final discount = _validCodes[state.code];
    if (discount == null) {
      emit(state.copyWith(
        status: PromoStatus.invalid,
        message: 'Bunday promo kod topilmadi',
      ));
    } else {
      emit(state.copyWith(
        status: PromoStatus.applied,
        message: "${state.code} — $discount qo'llanildi",
      ));
    }
  }
}