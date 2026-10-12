

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchInput({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppPalette.greyBg,
        borderRadius: BorderRadius.circular(12),
      ),
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
            child: TextField(
              autofocus: true,
              cursorColor: AppPalette.orange,
              style: inter(14, FontWeight.w600, AppPalette.textDark),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Qayerga?',
                hintStyle: inter(14, FontWeight.w600, AppPalette.textDark),
              ),
              onChanged: onChanged,
            ),
          ),
          const Icon(Icons.mic_none, color: AppPalette.orange, size: 20),
        ],
      ),
    );
  }
}