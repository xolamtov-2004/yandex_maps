

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

class PaymentRow extends StatelessWidget {
  final String cardType;
  final String lastDigits;
  final VoidCallback? onChange;

  const PaymentRow({
    super.key,
    required this.cardType,
    required this.lastDigits,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            color: AppPalette.textDark,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(cardType, style: inter(9, FontWeight.w800, Colors.white)),
        ),
        const SizedBox(width: 8),
        Text(
          '•••• $lastDigits',
          style: inter(13, FontWeight.w700, AppPalette.textDark),
        ),
        const Spacer(),
        TextButton(
          onPressed: onChange,
          style: TextButton.styleFrom(
            backgroundColor: AppPalette.orangeBg,
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Almashtirish',
            style: inter(11, FontWeight.w700, AppPalette.orange),
          ),
        ),
      ],
    );
  }
}