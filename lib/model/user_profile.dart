



import 'package:yandex_map/core/format.dart';

class UserProfile {
  final String name;
  final String phone;
  final double rating;
  final int rides;
  final int points;
  final int nextRewardIn;

  const UserProfile({
    required this.name,
    required this.phone,
    required this.rating,
    required this.rides,
    required this.points,
    required this.nextRewardIn,
  });

  String get initial => name.substring(0, 1);
  String get pointsText => formatNumber(points);
  double get rewardProgress => points / (points + nextRewardIn);
}

/// Namuna foydalanuvchi. Keyin serverdan keladi.
const sampleUser = UserProfile(
  name: 'Alisher Karimov',
  phone: '+998 90 123 45 67',
  rating: 4.9,
  rides: 47,
  points: 1250,
  nextRewardIn: 250,
);