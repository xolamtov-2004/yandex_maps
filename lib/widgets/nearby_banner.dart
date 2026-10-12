

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

class NearbyBanner extends StatelessWidget {
  final String text;

  const NearbyBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppPalette.orangeBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.near_me_outlined, size: 16, color: AppPalette.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: inter(11, FontWeight.w700, AppPalette.orange),
            ),
          ),
        ],
      ),
    );
  }
}