import 'package:flutter/material.dart';
import '../core/peyment.dart';
class StatusBadge extends StatelessWidget {
  const StatusBadge(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: PaymentColors.greenSoft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: PaymentColors.green,
        ),
      ),
    );
  }
}