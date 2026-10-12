import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';
import '../core/app_colors.dart';

class RegisterLink extends StatelessWidget {
  final VoidCallback? onTap;

  const RegisterLink({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          style: inter(12, FontWeight.w400, AppPalette.textGrey),
          children: [
            const TextSpan(text: "Hisobingiz yo'qmi? "),
            TextSpan(
              text: "Ro'yxatdan o'ting",
              style: inter(12, FontWeight.w700, AppPalette.orange),
            ),
          ],
        ),
      ),
    );
  }
}