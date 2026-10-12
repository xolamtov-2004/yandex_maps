abstract class SplashEvent {}

class StartSplashEvent extends SplashEvent {}

class TickSplashEvent extends SplashEvent {
  final int activeIndex;
  final bool isCompleted;

  TickSplashEvent(this.activeIndex, {this.isCompleted = false});
}
