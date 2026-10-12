

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  static const int phoneLength = 9;

  final String phone; // faqat raqamlar, masalan 901234567
  final bool isFocused;
  final LoginStatus status;
  final String? error;

  const LoginState({
    this.phone = '',
    this.isFocused = false,
    this.status = LoginStatus.initial,
    this.error,
  });

  bool get isValid => phone.length == phoneLength;
  bool get isLoading => status == LoginStatus.loading;

  /// 90 123 45 67
  String get formattedPhone {
    final buffer = StringBuffer();
    for (var i = 0; i < phone.length; i++) {
      if (i == 2 || i == 5 || i == 7) buffer.write(' ');
      buffer.write(phone[i]);
    }
    return buffer.toString();
  }

  String get fullPhone => '+998 $formattedPhone';

  LoginState copyWith({
    String? phone,
    bool? isFocused,
    LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      isFocused: isFocused ?? this.isFocused,
      status: status ?? this.status,
      error: error,
    );
  }
}