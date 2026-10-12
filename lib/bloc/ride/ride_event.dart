

abstract class RideEvent {}

class RideStarted extends RideEvent {}

class RideCancelled extends RideEvent {}

class RideRatingChanged extends RideEvent {
  final int stars;
  RideRatingChanged(this.stars);
}

class RideCommentChanged extends RideEvent {
  final String text;
  RideCommentChanged(this.text);
}

class RideFinished extends RideEvent {}