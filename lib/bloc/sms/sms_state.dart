


enum SmsStatus { initial, loading, success, failure }

class SmsState {
  static const int codeLength = 6;
  static const int resendSeconds = 105; // 01:45

  final String code;
  final int secondsLeft;
  final SmsStatus status;
  final String? error;

  const SmsState({
    this.code = '',
    this.secondsLeft = resendSeconds,
    this.status = SmsStatus.initial,
    this.error,
  });

  bool get isComplete => code.length == codeLength;
  bool get isLoading => status == SmsStatus.loading;
  bool get canResend => secondsLeft == 0;

  /// 01:45
  String get timerText {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  SmsState copyWith({
    String? code,
    int? secondsLeft,
    SmsStatus? status,
    String? error,
  }) {
    return SmsState(
      code: code ?? this.code,
      secondsLeft: secondsLeft ?? this.secondsLeft,
      status: status ?? this.status,
      error: error,
    );
  }
}