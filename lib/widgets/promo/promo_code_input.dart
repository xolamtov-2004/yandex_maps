import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class PromoCodeInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onApply;

  const PromoCodeInput({
    super.key,
    required this.onChanged,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppPalette.greyBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppPalette.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.local_offer_outlined,
                  size: 18,
                  color: AppPalette.textGrey,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.characters,
                    cursorColor: AppPalette.orange,
                    style: inter(14, FontWeight.w600, AppPalette.textDark),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: 'PROMOKOD',
                      hintStyle:
                      inter(14, FontWeight.w500, AppPalette.textGrey),
                    ),
                    onChanged: onChanged,
                    onSubmitted: (_) => onApply(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 48,
          child: FilledButton(
            onPressed: onApply,
            style: FilledButton.styleFrom(
              backgroundColor: AppPalette.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Qo'llash",
              style: inter(13, FontWeight.w700, Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}