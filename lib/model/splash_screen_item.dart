


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;
  final Color background;
  final IconData fallbackIcon;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.background,
    required this.fallbackIcon,
  });
}

const List<OnboardingItem> onboardingItems = [
  OnboardingItem(
    image: 'assets/images/onboarding_1.png',
    title: 'Buyurtma bering,\nhaydovchini kuzating!',
    subtitle: "Yaqin atrofdagi haydovchilar real vaqtda xaritada ko'rinadi",
    background: Color(0xFFEFF6FF),
    fallbackIcon: Icons.map_outlined,
  ),
  OnboardingItem(
    image: 'assets/images/onboarding_2.png',
    title: 'Adolatli narx, surge\nogohlantirish',
    subtitle: 'Narx oshishidan oldin ogohlantirilasiz — tanlov sizda',
    background: Color(0xFFFFF4EC),
    fallbackIcon: Icons.payments_outlined,
  ),
  OnboardingItem(
    image: 'assets/images/onboarding_3.png',
    title: 'Tasdiqlangan haydovchilar\nbilan xavfsiz safar',
    subtitle: 'Barcha haydovchilar tekshirilgan va reyting tizimida',
    background: Color(0xFFEFFAF1),
    fallbackIcon: Icons.verified_user_outlined,
  ),
];