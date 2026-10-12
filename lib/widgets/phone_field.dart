import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/core/uz_phone_formatter.dart';

import '../core/app_colors.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFocused;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmitted;

  const PhoneField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isFocused,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: isFocused ? AppPalette.orangeBg : AppPalette.greyBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isFocused ? AppPalette.orange : AppPalette.border,
          width: isFocused ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          const Text('🇺🇿', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text('+998', style: inter(15, FontWeight.w700, AppPalette.textDark)),
          const SizedBox(width: 10),
          Container(width: 1, height: 24, color: AppPalette.border),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [UzPhoneFormatter()],
              cursorColor: AppPalette.orange,
              style: inter(15, FontWeight.w600, AppPalette.textDark),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: '90 123 45 67',
                hintStyle: inter(15, FontWeight.w400, AppPalette.textGrey),
              ),
              onChanged: onChanged,
              onSubmitted: (_) => onSubmitted(),
            ),
          ),
        ],
      ),
    );
  }
}