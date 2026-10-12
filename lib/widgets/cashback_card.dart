

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

class CashbackCard extends StatelessWidget {
  final String pointsText;
  final double progress;
  final String footnote;
  final VoidCallback onHistory;
  final String? buttonLabel;
  final VoidCallback? onButton;

  const CashbackCard({
    super.key,
    required this.pointsText,
    required this.progress,
    required this.footnote,
    required this.onHistory,
    this.buttonLabel,
    this.onButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF8A2B), Color(0xFFFF6B00)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40FF6B00),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.card_giftcard, size: 16, color: Colors.white),
              const SizedBox(width: 6),
              Text(
                'Cashback ballarim',
                style: inter(12, FontWeight.w600, Colors.white,),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onHistory,
                child: Text(
                  'Tarix →',
                  style: inter(11, FontWeight.w500, Colors.white70),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '$pointsText ball',
            style: inter(28, FontWeight.w800, Colors.white),
          ),
          Text(
            "= $pointsText so'm",
            style: inter(11, FontWeight.w400, Colors.white70),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: Colors.white24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(footnote, style: inter(10, FontWeight.w400, Colors.white70)),
          if (buttonLabel != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: OutlinedButton(
                onPressed: onButton,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white24,
                  side: const BorderSide(color: Colors.white54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  buttonLabel!,
                  style: inter(13, FontWeight.w700, Colors.white),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}