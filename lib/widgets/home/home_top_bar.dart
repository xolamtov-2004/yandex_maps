


import 'package:flutter/material.dart';

import '../band_logo.dart';
import '../round_icon_button.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BrandLogo(),
        Spacer(),
        RoundIconButton(icon: Icons.notifications_none),
      ],
    );
  }
}