


abstract class LoginEvent {}

class LoginPhoneChanged extends LoginEvent {
  final String value;
  LoginPhoneChanged(this.value);
}

class LoginFocusChanged extends LoginEvent {
  final bool hasFocus;
  LoginFocusChanged(this.hasFocus);
}

class LoginSubmitted extends LoginEvent {}