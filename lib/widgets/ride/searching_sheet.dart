
import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/Place.dart';
import 'package:yandex_map/widgets/sheet_container.dart';

class SearchingSheet extends StatelessWidget {
  final Place from;
  final Place to;
  final VoidCallback onCancel;

  const SearchingSheet({
    super.key,
    required this.from,
    required this.to,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFEF4444);

    return SheetContainer(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _LoadingDots(),
            const SizedBox(height: 14),
            Text(
              'Eng yaqin haydovchi\nqidirilmoqda...',
              textAlign: TextAlign.center,
              style: inter(18, FontWeight.w700, AppPalette.textDark, height: 1.3),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Divider(height: 1, color: AppPalette.border),
            ),
            _AddressRow(
              color: const Color(0xFF22C55E),
              label: 'Yuborish manzili (A)',
              address: from.title,
            ),
            const SizedBox(height: 10),
            _AddressRow(
              color: red,
              label: 'Boradigan manzil (B)',
              address: '${to.title}, ${to.subtitle}',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time,
                  size: 14,
                  color: AppPalette.textGrey,
                ),
                const SizedBox(width: 4),
                Text(
                  'Taxminiy kutish: 1-3 daqiqa',
                  style: inter(11, FontWeight.w500, AppPalette.textGrey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: onCancel,
                icon: const Icon(Icons.cancel_outlined, size: 18),
                label: Text(
                  'Bekor qilish',
                  style: inter(14, FontWeight.w700, red),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: red,
                  side: const BorderSide(color: red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressRow extends StatelessWidget {
  final Color color;
  final String label;
  final String address;

  const _AddressRow({
    required this.color,
    required this.label,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: inter(12, FontWeight.w700, AppPalette.textDark),
              ),
              const SizedBox(height: 2),
              Text(
                address,
                style: inter(10, FontWeight.w400, AppPalette.textGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Navbat bilan yonib turadigan uchta nuqta.
class _LoadingDots extends StatefulWidget {
  const _LoadingDots();

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final active = (_controller.value * 3).floor() % 3;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: index == active
                    ? AppPalette.orange
                    : AppPalette.orangeLight,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}