



import '../../model/tariff_dart.dart';

enum FareStatus { initial, loading, success, failure }

class FareState {
  final int selectedIndex;
  final FareStatus status;

  const FareState({
    this.selectedIndex = 0,
    this.status = FareStatus.initial,
  });

  Tariff get selected => tariffs[selectedIndex];
  bool get isLoading => status == FareStatus.loading;

  FareState copyWith({int? selectedIndex, FareStatus? status}) {
    return FareState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      status: status ?? this.status,
    );
  }
}