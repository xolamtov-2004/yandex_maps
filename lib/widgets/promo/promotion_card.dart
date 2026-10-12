

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

import '../../model/order.dart';

class PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback onTerms;

  const PromotionCard({
    super.key,
    required this.promotion,
    required this.onTerms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppPalette.orangeBg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  promotion.tag,
                  style: inter(10, FontWeight.w700, AppPalette.orange),
                ),
              ),
              const Spacer(),
              Text(
                promotion.deadline,
                style: inter(10, FontWeight.w400, AppPalette.textGrey),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            promotion.title,
            style: inter(14, FontWeight.w700, AppPalette.textDark),
          ),
          const SizedBox(height: 4),
          Text(
            promotion.description,
            style: inter(11, FontWeight.w400, AppPalette.textGrey, height: 1.4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '${promotion.current} / ${promotion.total} ${promotion.unit}',
                style: inter(10, FontWeight.w500, AppPalette.textGrey),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: promotion.progress,
                    minHeight: 4,
                    backgroundColor: AppPalette.border,
                    color: AppPalette.orange,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, color: AppPalette.border),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTerms,
              child: Text(
                'Shartlar →',
                style: inter(11, FontWeight.w700, AppPalette.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}