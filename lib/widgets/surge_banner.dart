
import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

class SurgeBanner extends StatelessWidget {
  final String text;

  const SurgeBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF16A34A);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFECFDF3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.trending_up, size: 16, color: green),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: inter(11, FontWeight.w600, green))),
        ],
      ),
    );
  }
}