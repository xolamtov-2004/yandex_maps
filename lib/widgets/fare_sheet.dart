

import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_text.dart';

import 'package:yandex_map/screen/payment_screen.dart';
import 'package:yandex_map/widgets/payment_row.dart';
import 'package:yandex_map/widgets/primary_button.dart';
import 'package:yandex_map/widgets/sheet_container.dart';
import 'package:yandex_map/widgets/surge_banner.dart';
import 'package:yandex_map/widgets/traffic_card.dart';

import '../core/app_colors.dart';
import '../model/tariff_dart.dart';

class FareSheet extends StatelessWidget {
  final int selectedIndex;
  final bool isLoading;
  final ValueChanged<int> onSelected;
  final VoidCallback onOrder;

  const FareSheet({
    super.key,
    required this.selectedIndex,
    required this.isLoading,
    required this.onSelected,
    required this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SheetContainer(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Narx taxmini',
                  style: inter(16, FontWeight.w700, AppPalette.textDark),
                ),
                const Spacer(),
                const Icon(
                  Icons.access_time,
                  size: 14,
                  color: AppPalette.orange,
                ),
                const SizedBox(width: 4),
                Text(
                  'Jami: 18 daqiqa',
                  style: inter(11, FontWeight.w700, AppPalette.orange),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SurgeBanner(text: "Hozir talab ko'p — narx 1.2x yuqori"),
            const SizedBox(height: 10),
            for (var i = 0; i < tariffs.length; i++) ...[
              TariffCard(
                tariff: tariffs[i],
                isSelected: i == selectedIndex,
                onTap: () => onSelected(i),
              ),
              const SizedBox(height: 8),
            ],
            PaymentRow(
              cardType: 'HUMO',
              lastDigits: '5620',
              onChange: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethodsPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'Buyurtma berish',
              onPressed: onOrder,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
