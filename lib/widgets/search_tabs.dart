import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';
import '../core/app_colors.dart';

class SearchTabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;

  const SearchTabs({super.key, required this.index, required this.onChanged});

  Widget _tab(String label, int tabIndex) {
    final isActive = index == tabIndex;
    return Expanded(
      child: InkWell(
        onTap: () => onChanged(tabIndex),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? AppPalette.orange : AppPalette.border,
                width: isActive ? 2 : 1,
              ),
            ),
          ),
          child: Text(
            label,
            style: inter(
              12,
              FontWeight.w700,
              isActive ? AppPalette.orange : AppPalette.textGrey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [_tab('Yaqinda', 0), _tab('Sevimlilar', 1)]);
  }
}