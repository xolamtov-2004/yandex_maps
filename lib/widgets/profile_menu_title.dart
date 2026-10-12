
import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? badge;
  final Widget? trailing; // berilmasa, o'ngda strelka chiqadi
  final Color color;
  final VoidCallback? onTap;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.badge,
    this.trailing,
    this.color = AppPalette.orange,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDanger = color != AppPalette.orange;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: color.withAlpha(26),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 18, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: inter(
                      13,
                      FontWeight.w700,
                      isDanger ? color : AppPalette.textDark,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: inter(10, FontWeight.w400, AppPalette.textGrey),
                    ),
                  ],
                ],
              ),
            ),
            if (badge != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppPalette.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badge!,
                  style: inter(10, FontWeight.w700, Colors.white),
                ),
              ),
              const SizedBox(width: 8),
            ],
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppPalette.textGrey,
                ),
          ],
        ),
      ),
    );
  }
}