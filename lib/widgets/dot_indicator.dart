
import 'package:flutter/material.dart';

/// Nuqtali indikator: faol nuqta cho'zilib turadi.
class DotIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double activeWidth;
  final double spacing;

  const DotIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
    required this.activeColor,
    required this.inactiveColor,
    this.dotSize = 6,
    this.activeWidth = 20,
    this.spacing = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: spacing),
          height: dotSize,
          width: isActive ? activeWidth : dotSize,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        );
      }),
    );
  }
}