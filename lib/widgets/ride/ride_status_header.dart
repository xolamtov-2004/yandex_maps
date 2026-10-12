

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class RideStatusHeader extends StatelessWidget {
  final bool isInProgress;
  final int etaMinutes;

  const RideStatusHeader({
    super.key,
    required this.isInProgress,
    required this.etaMinutes,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF16A34A);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFFDCFCE7),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.check_circle, size: 18, color: green),
              const SizedBox(width: 8),
              Text(
                'Haydovchi topildi!',
                style: inter(13, FontWeight.w700, green),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppPalette.orange,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                isInProgress ? 'Sayohat boshlandi' : "Haydovchi yo'lda",
                style: inter(12, FontWeight.w700, AppPalette.textDark),
              ),
              Text(
                isInProgress ? ' • ~12 daq' : ' • ~$etaMinutes daq',
                style: inter(12, FontWeight.w400, AppPalette.textGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}