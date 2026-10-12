



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

/// To'q sariq asosiy tugma. onPressed null bo'lsa, kulrang va o'chiq.
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = onPressed != null;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: isActive
            ? const [
          BoxShadow(
            color: AppPalette.orangeShadow,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ]
            : null,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: FilledButton(
          onPressed: isActive && !isLoading ? onPressed : null,
          style: FilledButton.styleFrom(
            backgroundColor: AppPalette.orange,
            foregroundColor: Colors.white,
            disabledBackgroundColor:
            isActive ? AppPalette.orange : AppPalette.border,
            disabledForegroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: isLoading
              ? const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: Colors.white,
            ),
          )
              : Text(label, style:GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
