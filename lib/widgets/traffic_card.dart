

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import '../core/app_colors.dart';
import '../model/tariff_dart.dart';

class TariffCard extends StatelessWidget {
  final Tariff tariff;
  final bool isSelected;
  final VoidCallback onTap;

  const TariffCard({
    super.key,
    required this.tariff,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppPalette.orange : AppPalette.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? AppPalette.orangeBg : AppPalette.greyBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.directions_car_outlined,
                size: 20,
                color: isSelected ? AppPalette.orange : AppPalette.textDark,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        tariff.name,
                        style: inter(14, FontWeight.w700, AppPalette.textDark),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppPalette.orangeBg
                              : AppPalette.greyBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${tariff.etaMinutes} daq',
                          style: inter(
                            9,
                            FontWeight.w700,
                            isSelected
                                ? AppPalette.orange
                                : AppPalette.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    tariff.description,
                    style: inter(10, FontWeight.w400, AppPalette.textGrey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              tariff.priceText,
              style: inter(
                14,
                FontWeight.w700,
                isSelected ? AppPalette.orange : AppPalette.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}