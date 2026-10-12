

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/widgets/round_icon_button.dart';
import '../core/app_colors.dart';
import 'band_logo.dart';

class FareTopBar extends StatelessWidget {
  const FareTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundIconButton(
          icon: Icons.arrow_back,
          onPressed: () => Navigator.maybePop(context),
        ),
        const Spacer(),
        const BrandLogo(),
        const Spacer(),
        CircleAvatar(
          radius: 18,
          backgroundColor: AppPalette.orange,
          child: Text('A', style: inter(14, FontWeight.w700, Colors.white)),
        ),
      ],
    );
  }
}