abstract class FareEvent {}

class FareTariffSelected extends FareEvent {
  final int index;
  FareTariffSelected(this.index);
}

class FareOrderSubmitted extends FareEvent {}