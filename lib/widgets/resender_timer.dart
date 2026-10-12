


import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

/// "Qayta yuborish: 01:45". Vaqt tugagach bosiladigan tugmaga aylanadi.
class ResendTimer extends StatelessWidget {
  final bool canResend;
  final String timerText;
  final VoidCallback onResend;

  const ResendTimer({
    super.key,
    required this.canResend,
    required this.timerText,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    if (canResend) {
      return TextButton(
        onPressed: onResend,
        child: Text(
          'Qayta yuborish',
          style: inter(13, FontWeight.w700, AppPalette.orange),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.access_time, size: 14, color: AppPalette.textGrey),
        const SizedBox(width: 4),
        Text.rich(
          TextSpan(
            style: inter(12, FontWeight.w400, AppPalette.textGrey),
            children: [
              const TextSpan(text: 'Qayta yuborish: '),
              TextSpan(
                text: timerText,
                style: inter(12, FontWeight.w700, AppPalette.orange),
              ),
            ],
          ),
        ),
      ],
    );
  }
}