import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class DriverAvatar extends StatelessWidget {
  final String initial;
  final double size;

  const DriverAvatar({super.key, required this.initial, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppPalette.orangeBg,
        shape: BoxShape.circle,
        border: Border.all(color: AppPalette.orange, width: 1.5),
      ),
      child: Text(
        initial,
        style: inter(size * 0.4, FontWeight.w700, AppPalette.orange),
      ),
    );
  }
}