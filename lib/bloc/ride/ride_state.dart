
enum RideStage {
  searching, // haydovchi qidirilmoqda
  driverComing, // haydovchi topildi, yo'lda
  inProgress, // safar boshlandi
  arrived, // manzilga yetdi, baholash
  finished, // baholandi, yakunlandi
  cancelled, // bekor qilindi
}

class RideState {
  final RideStage stage;
  final int rating;
  final String comment;
  final bool isSubmitting;

  const RideState({
    this.stage = RideStage.searching,
    this.rating = 0,
    this.comment = '',
    this.isSubmitting = false,
  });

  RideState copyWith({
    RideStage? stage,
    int? rating,
    String? comment,
    bool? isSubmitting,
  }) {
    return RideState(
      stage: stage ?? this.stage,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}