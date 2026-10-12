

abstract class OnboardingEvent {}

/// Foydalanuvchi sahifani barmoq bilan surdi.
class OnboardingPageChanged extends OnboardingEvent {
  final int index;
  OnboardingPageChanged(this.index);
}

/// "Davom etish" yoki "Boshlash" bosildi.
class OnboardingNextPressed extends OnboardingEvent {}

/// "O'tkazib yuborish" bosildi.
class OnboardingSkipPressed extends OnboardingEvent {}
