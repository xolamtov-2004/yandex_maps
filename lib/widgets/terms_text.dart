import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: inter(11, FontWeight.w400, AppPalette.textGrey),
        children: [
          const TextSpan(text: 'Davom etib, '),
          TextSpan(
            text: 'Foydalanish shartlariga',
            style: inter(11, FontWeight.w600, AppPalette.orange),
          ),
          const TextSpan(text: ' rozilik bildirasiz'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}