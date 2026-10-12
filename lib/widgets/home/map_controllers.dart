

import 'package:flutter/material.dart';

import '../round_icon_button.dart';

class MapControls extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onLocate;

  const MapControls({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onLocate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundIconButton(icon: Icons.zoom_in, onPressed: onZoomIn),
            const SizedBox(height: 10),
            RoundIconButton(icon: Icons.zoom_out, onPressed: onZoomOut),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundIconButton(
              icon: Icons.location_on_outlined,
              onPressed: onLocate,
            ),
            const SizedBox(height: 10),
            const RoundIconButton(icon: Icons.layers_outlined),
          ],
        ),
      ],
    );
  }
}