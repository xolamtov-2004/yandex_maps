
import 'package:flutter/material.dart';

class PaymentMethod {
  const PaymentMethod({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    this.badge,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String? badge;

  /// Pastki panel uchun: "Uzcard •••• 4521" -> "Uzcard 4521"
  String get shortTitle => title.replaceAll('•••• ', '');
}