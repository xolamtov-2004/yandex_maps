class SplashState {
  final int activeIndex;
  final bool isCompleted;

  const SplashState({
    required this.activeIndex,
    this.isCompleted = false,
  });

  SplashState copyWith({
    int? activeIndex,
    bool? isCompleted,
  }) {
    return SplashState(
      activeIndex: activeIndex ?? this.activeIndex,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
