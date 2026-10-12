import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

class RouteInfoCard extends StatelessWidget {
  final String title;
  final String from;
  final String to;

  const RouteInfoCard({
    super.key,
    required this.title,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF3B82F6);

    return Material(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.location_on, size: 18, color: blue),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: inter(12, FontWeight.w700, AppPalette.textDark),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'A: $from → B: $to',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: inter(10, FontWeight.w400, AppPalette.textGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}