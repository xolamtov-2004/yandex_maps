

abstract class SmsEvent {}

class SmsStarted extends SmsEvent {}

class SmsCodeChanged extends SmsEvent {
  final String value;
  SmsCodeChanged(this.value);
}

class SmsResendPressed extends SmsEvent {}

class SmsSubmitted extends SmsEvent {}

/// Ichki hodisa: taymer har soniyada yuboradi.
class SmsTicked extends SmsEvent {
  final int secondsLeft;
  SmsTicked(this.secondsLeft);
}