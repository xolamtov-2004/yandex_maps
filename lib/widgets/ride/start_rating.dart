

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';

class StarRating extends StatelessWidget {
  final int value; // 0..5
  final ValueChanged<int> onChanged;

  const StarRating({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final star = index + 1;
        return IconButton(
          onPressed: () => onChanged(star),
          iconSize: 34,
          color: AppPalette.orange,
          icon: Icon(star <= value ? Icons.star : Icons.star_border),
        );
      }),
    );
  }
}