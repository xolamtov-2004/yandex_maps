


import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPalette.orange,
      foregroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      title: Text('YangiGO', style: inter(18, FontWeight.w800, Colors.white)),
      actions: [
        Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ],
    );
  }
}