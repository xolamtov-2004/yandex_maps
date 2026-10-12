class ProfileState {
  final bool notificationsEnabled;

  const ProfileState({this.notificationsEnabled = true});

  ProfileState copyWith({bool? notificationsEnabled}) {
    return ProfileState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}