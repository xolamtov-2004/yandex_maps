
import 'package:flutter/material.dart';

class Place {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final double latitude;
  final double longitude;

  const Place({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.latitude,
    required this.longitude,
  });
}

/// Namuna ma'lumotlar. Keyin server yoki GPS bilan almashtiriladi.
const currentPlace = Place(
  title: "Amir Temur ko'chasi, 12-uy",
  subtitle: 'Toshkent',
  icon: Icons.my_location,
  color: Color(0xFF3B82F6),
  latitude: 41.3111,
  longitude: 69.2797,
);

const recentPlaces = [
  Place(
    title: 'Yunusobod metro',
    subtitle: 'Yunusobod tumani, Toshkent',
    icon: Icons.directions_subway_outlined,
    color: Color(0xFF3B82F6),
    latitude: 41.3676,
    longitude: 69.2889,
  ),
  Place(
    title: 'Chorsu bozori',
    subtitle: 'Shayxontohur tumani, Toshkent',
    icon: Icons.location_on_outlined,
    color: Color(0xFFF59E0B),
    latitude: 41.3267,
    longitude: 69.2350,
  ),
  Place(
    title: 'Toshkent shahar hokimligi',
    subtitle: 'Chilonzor tumani, Toshkent',
    icon: Icons.apartment_outlined,
    color: Color(0xFF3B82F6),
    latitude: 41.3119,
    longitude: 69.2787,
  ),
];

const favoritePlaces = [
  Place(
    title: 'Uy',
    subtitle: 'Mirzo Ulug\'bek tumani, Toshkent',
    icon: Icons.home_outlined,
    color: Color(0xFF10B981),
    latitude: 41.3385,
    longitude: 69.3345,
  ),
  Place(
    title: 'Ish',
    subtitle: 'Yakkasaroy tumani, Toshkent',
    icon: Icons.work_outline,
    color: Color(0xFF8B5CF6),
    latitude: 41.2858,
    longitude: 69.2573,
  ),
];