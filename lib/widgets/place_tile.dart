

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';
import '../model/Place.dart';

class PlaceTile extends StatelessWidget {
  final Place place;
  final VoidCallback onTap;

  const PlaceTile({super.key, required this.place, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: place.color.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: Icon(place.icon, size: 18, color: place.color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    style: inter(13, FontWeight.w700, AppPalette.textDark),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    place.subtitle,
                    style: inter(11, FontWeight.w400, AppPalette.textGrey),
                  ),
                ],
              ),
            ),
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