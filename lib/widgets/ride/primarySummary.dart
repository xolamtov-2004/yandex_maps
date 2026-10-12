
import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class PriceSummary extends StatelessWidget {
  final String priceText;
  final bool isCash;

  const PriceSummary({
    super.key,
    required this.priceText,
    required this.isCash,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppPalette.greyBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Jami narx',
                style: inter(12, FontWeight.w500, AppPalette.textGrey),
              ),
              const Spacer(),
              Text(
                priceText,
                style: inter(16, FontWeight.w700, AppPalette.textDark),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                isCash ? Icons.payments_outlined : Icons.credit_card,
                size: 16,
                color: const Color(0xFF16A34A),
              ),
              const SizedBox(width: 6),
              Text(
                isCash ? "Naqd to'lov" : 'Karta orqali',
                style: inter(12, FontWeight.w600, AppPalette.textDark),
              ),
            ],
          ),
        ],
      ),
    );
  }
}