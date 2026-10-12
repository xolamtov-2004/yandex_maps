abstract class PromoEvent {}

class PromoCodeChanged extends PromoEvent {
  final String code;
  PromoCodeChanged(this.code);
}

/// "Qo'llash" bosildi.
class PromoApplied extends PromoEvent {}

/// "Cashback ishlatish" bosildi.
class PromoCashbackToggled extends PromoEvent {}