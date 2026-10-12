

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

class WhereToCard extends StatelessWidget {
  final VoidCallback onTap;

  const WhereToCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Qayerga?',
                      style: inter(15, FontWeight.w700, AppPalette.textDark),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sayohatni boshlash uchun manzilni kiriting',
                      style: inter(11, FontWeight.w400, AppPalette.textGrey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.search, color: AppPalette.orange),
            ],
          ),
        ),
      ),
    );
  }
}