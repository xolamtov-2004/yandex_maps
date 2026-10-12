import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';
import '../core/app_colors.dart';
class PhoneHintRow extends StatelessWidget {
  final bool showCounter;
  final int count;
  final int max;

  const PhoneHintRow({
    super.key,
    required this.showCounter,
    required this.count,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.info_outline, size: 14, color: AppPalette.textGrey),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            'SMS orqali tasdiqlash kodi yuboriladi',
            style: inter(11, FontWeight.w400, AppPalette.textGrey),
          ),
        ),
        if (showCounter)
          Text(
            '$count/$max',
            style: inter(11, FontWeight.w600, AppPalette.orange),
          ),
      ],
    );
  }
}