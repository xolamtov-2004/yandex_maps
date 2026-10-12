enum PromoStatus { initial, applied, invalid }

class PromoState {
  final String code;
  final PromoStatus status;
  final String message;
  final bool useCashback;

  const PromoState({
    this.code = '',
    this.status = PromoStatus.initial,
    this.message = '',
    this.useCashback = false,
  });

  PromoState copyWith({
    String? code,
    PromoStatus? status,
    String? message,
    bool? useCashback,
  }) {
    return PromoState(
      code: code ?? this.code,
      status: status ?? this.status,
      message: message ?? this.message,
      useCashback: useCashback ?? this.useCashback,
    );
  }
}