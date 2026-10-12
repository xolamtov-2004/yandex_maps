
import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/driver.dart';
import 'package:yandex_map/widgets/ride/driver_avatar.dart';
import 'package:yandex_map/widgets/sheet_container.dart';

class DriverSheet extends StatelessWidget {
  final Driver driver;
  final String from;
  final String to;
  final bool isInProgress;
  final VoidCallback onCall;
  final VoidCallback onMessage;

  const DriverSheet({
    super.key,
    required this.driver,
    required this.from,
    required this.to,
    required this.isInProgress,
    required this.onCall,
    required this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    );

    return SheetContainer(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Color(0xFF3B82F6),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '$from → $to',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: inter(13, FontWeight.w700, AppPalette.textDark),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(height: 1, color: AppPalette.border),
            ),
            Row(
              children: [
                Column(
                  children: [
                    DriverAvatar(initial: driver.initial),
                    const SizedBox(height: 4),
                    Text(
                      '★ ${driver.rating}',
                      style: inter(10, FontWeight.w700, AppPalette.textDark),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driver.name,
                        style: inter(14, FontWeight.w700, AppPalette.textDark),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${driver.car} • ${driver.plate}',
                        style: inter(11, FontWeight.w400, AppPalette.textGrey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isInProgress
                            ? 'Sayohat davom etmoqda'
                            : '${driver.etaMinutes} daqiqada keladi',
                        style: inter(11, FontWeight.w700, AppPalette.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: onCall,
                      icon: const Icon(Icons.phone_outlined, size: 18),
                      label: Text(
                        "Qo'ng'iroq",
                        style: inter(13, FontWeight.w700, AppPalette.textDark),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppPalette.textDark,
                        side: const BorderSide(color: AppPalette.border),
                        shape: shape,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: FilledButton.icon(
                      onPressed: onMessage,
                      icon: const Icon(Icons.chat_bubble_outline, size: 18),
                      label: Text(
                        'Xabar',
                        style: inter(13, FontWeight.w700, Colors.white),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppPalette.orange,
                        foregroundColor: Colors.white,
                        shape: shape,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}