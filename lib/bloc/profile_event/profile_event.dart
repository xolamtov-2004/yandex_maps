abstract class ProfileEvent {}

class ProfileNotificationsToggled extends ProfileEvent {
  final bool enabled;
  ProfileNotificationsToggled(this.enabled);
}