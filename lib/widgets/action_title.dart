

import 'package:flutter/material.dart';
import 'package:yandex_map/widgets/tiles_text.dart';

import '../core/peyment.dart';
import 'icon_box.dart';



class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    this.badge,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;
  final String? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: const BorderSide(color: PaymentColors.border),
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              IconBox(icon: icon, color: iconColor, bg: iconBg),
              const SizedBox(width: 12),
              Expanded(
                child: TileTexts(
                  title: title,
                  subtitle: subtitle,
                  badge: badge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}