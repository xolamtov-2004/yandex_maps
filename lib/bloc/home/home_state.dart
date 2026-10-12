class HomeState {
  final int tabIndex;

  const HomeState({this.tabIndex = 0});

  HomeState copyWith({int? tabIndex}) {
    return HomeState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}
