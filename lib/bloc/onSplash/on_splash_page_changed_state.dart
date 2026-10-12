
class OnboardingState {
  final int currentPage;
  final int pageCount;
  final bool isCompleted;

  const OnboardingState({
    this.currentPage = 0,
    required this.pageCount,
    this.isCompleted = false,
  });

  bool get isLastPage => currentPage == pageCount - 1;

  OnboardingState copyWith({int? currentPage, bool? isCompleted}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      pageCount: pageCount,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}