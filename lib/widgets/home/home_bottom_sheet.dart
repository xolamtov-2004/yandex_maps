

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../../core/app_colors.dart';
import '../sheet_container.dart';

class HomeBottomSheet extends StatelessWidget {
  final String address;
  final VoidCallback onChange;

  const HomeBottomSheet({
    super.key,
    required this.address,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SheetContainer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppPalette.greyBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppPalette.orange,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SIZ SHU YERDAMISIZ?',
                        style: inter(9, FontWeight.w700, AppPalette.textGrey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        address,
                        style: inter(13, FontWeight.w700, AppPalette.textDark),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: onChange,
                  style: TextButton.styleFrom(
                    backgroundColor: AppPalette.orangeBg,
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "O'zgartirish",
                    style: inter(11, FontWeight.w700, AppPalette.orange),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              _QuickChip(emoji: '🏠', label: 'Uy'),
              SizedBox(width: 8),
              _QuickChip(emoji: '💼', label: 'Ish'),
              SizedBox(width: 8),
              _QuickChip(emoji: '⭐', label: 'Sevimlilar'),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  final String emoji;
  final String label;

  const _QuickChip({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppPalette.greyBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$emoji $label',
        style: inter(12, FontWeight.w600, AppPalette.textDark),
      ),
    );
  }
}