

import 'package:flutter/material.dart';
import 'package:yandex_map/widgets/radio_dot.dart';
import 'package:yandex_map/widgets/tiles_text.dart';

import '../core/peyment.dart';
import '../model/payment_method.dart';
import 'icon_box.dart';

class MethodTile extends StatelessWidget {
  const MethodTile({
    super.key,
    required this.method,
    required this.selected,
    required this.onTap,
  });

  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: selected ? PaymentColors.orangeTint : Colors.white,
              borderRadius: radius,
              border: Border.all(
                color: selected ? PaymentColors.orange : PaymentColors.border,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                IconBox(
                  icon: method.icon,
                  color: method.iconColor,
                  bg: method.iconBg,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TileTexts(
                    title: method.title,
                    subtitle: method.subtitle,
                    badge: method.badge,
                  ),
                ),
                const SizedBox(width: 12),
                RadioDot(selected: selected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

