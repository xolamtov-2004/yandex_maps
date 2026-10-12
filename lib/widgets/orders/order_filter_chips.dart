import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';

import '../../bloc/orders_event/orders_state.dart';

class OrderFilterChips extends StatelessWidget {
  final OrderFilter selected;
  final ValueChanged<OrderFilter> onSelected;

   OrderFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

   final _labels = {
    OrderFilter.all: 'Hammasi',
    OrderFilter.taxi: 'Taxi',
    OrderFilter.delivery: 'Yetkazish',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final entry in _labels.entries) ...[
          GestureDetector(
            onTap: () => onSelected(entry.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: entry.key == selected
                    ? AppPalette.orange
                    : AppPalette.greyBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                entry.value,
                style: inter(
                  12,
                  FontWeight.w600,
                  entry.key == selected ? Colors.white : AppPalette.textDark,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }
}