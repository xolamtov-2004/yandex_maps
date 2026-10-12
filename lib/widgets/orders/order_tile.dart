import 'package:flutter/material.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({super.key, required this.order});

  Color get _iconColor {
    if (order.status == OrderStatus.cancelled) return const Color(0xFF9CA3AF);
    return order.type == OrderType.taxi
        ? AppPalette.orange
        : const Color(0xFF22C55E);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppPalette.border),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _iconColor.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              order.type == OrderType.taxi
                  ? Icons.local_taxi
                  : Icons.shopping_bag_outlined,
              size: 18,
              color: _iconColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: inter(13, FontWeight.w700, AppPalette.textDark),
                ),
                const SizedBox(height: 2),
                Text(
                  order.subtitle,
                  style: inter(10, FontWeight.w400, AppPalette.textGrey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                order.priceText,
                style: inter(13, FontWeight.w700, AppPalette.textDark),
              ),
              const SizedBox(height: 4),
              _StatusBadge(status: order.status),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final String label;
    final Color color;
    switch (status) {
      case OrderStatus.complate:
        label = 'Yakunlandi';
        color = const Color(0xFF16A34A);
      case OrderStatus.delivered:
        label = 'Yetkazildi';
        color = const Color(0xFF2563EB);
      case OrderStatus.cancelled:
        label = 'Bekor qilindi';
        color = const Color(0xFFDC2626);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: inter(9, FontWeight.w700, color)),
    );
  }
}