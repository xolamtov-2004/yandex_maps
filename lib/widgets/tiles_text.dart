import 'package:flutter/material.dart';
import 'package:yandex_map/widgets/status_badge.dart';

import '../core/peyment.dart';



class TileTexts extends StatelessWidget {
  const TileTexts({
    super.key,
    required this.title,
    required this.subtitle,
    this.badge,
  });

  final String title;
  final String subtitle;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: PaymentColors.text,
                ),
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 8),
              StatusBadge(badge!),
            ],
          ],
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13, color: PaymentColors.muted),
        ),
      ],
    );
  }
}