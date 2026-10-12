



import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

/// Ikki bosqichli chiziq: 1 = Raqam, 2 = SMS kod.
class StepProgress extends StatelessWidget {
  final int step;

  const StepProgress({super.key, required this.step});

  Widget _bar(bool active) {
    return Container(
      height: 3,
      decoration: BoxDecoration(
        color: active ? AppPalette.orange : AppPalette.border,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _label(String text, bool active) {
    return Text(
      text,
      style: inter(
        10,
        FontWeight.w600,
        active ? AppPalette.orange : AppPalette.textGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _bar(true)),
            const SizedBox(width: 6),
            Expanded(child: _bar(step == 2)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _label('Raqam', step == 1),
            _label('SMS kod', step == 2),
          ],
        ),
      ],
    );
  }
}