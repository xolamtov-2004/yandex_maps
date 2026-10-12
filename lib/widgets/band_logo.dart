import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';
import '../core/app_colors.dart';
class BrandLogo extends StatelessWidget {
  final Color textColor;

  const BrandLogo({super.key, this.textColor = AppPalette.textDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppPalette.orange,
            shape: BoxShape.circle,
          ),
          child: Text('Y', style: inter(15, FontWeight.w800, Colors.white)),
        ),
        const SizedBox(width: 6),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Yangi',
                style: inter(18, FontWeight.w800, textColor),
              ),
              TextSpan(
                text: 'GO',
                style: inter(18, FontWeight.w800, AppPalette.orange),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
