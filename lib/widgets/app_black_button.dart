import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AppBackButton extends StatelessWidget {
  final IconData icon;

  const AppBackButton({super.key, this.icon = Icons.chevron_left});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.greyBg,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.maybePop(context),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 22, color: AppPalette.textDark),
        ),
      ),
    );
  }
}















