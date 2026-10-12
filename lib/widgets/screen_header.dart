
import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeading;
  final IconData? trailingIcon;
  final VoidCallback? onTrailing;

  const ScreenHeader({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onLeading,
    this.trailingIcon,
    this.onTrailing,
  });

  Widget _side(IconData? icon, VoidCallback? onPressed) {
    if (icon == null) return const SizedBox(width: 48);
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 22, color: AppPalette.textDark),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _side(leadingIcon, onLeading),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: inter(16, FontWeight.w700, AppPalette.textDark),
          ),
        ),
        _side(trailingIcon, onTrailing),
      ],
    );
  }
}