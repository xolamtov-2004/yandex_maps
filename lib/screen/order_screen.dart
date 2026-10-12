import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_map/core/app_colors.dart';
import 'package:yandex_map/core/app_text.dart';
import 'package:yandex_map/model/order.dart';
import 'package:yandex_map/widgets/orders/order_filter_chips.dart';
import 'package:yandex_map/widgets/orders/order_tile.dart';
import 'package:yandex_map/widgets/screen_header.dart';

import '../bloc/nav/nav_bloc.dart';
import '../bloc/nav/nav_event.dart';
import '../bloc/orders_event/orders_bloc.dart';
import '../bloc/orders_event/orders_event.dart';
import '../bloc/orders_event/orders_state.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(),
      child: const _OrdersView(),
    );
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView();

  /// Buyurtmalarni kun sarlavhalari (BUGUN, KECHA ...) bilan ro'yxatga tizadi.
  List<Widget> _buildItems(List<Order> orders) {
    final items = <Widget>[];
    String? lastDay;
    for (final order in orders) {
      if (order.day != lastDay) {
        lastDay = order.day;
        items.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              order.day,
              style: inter(10, FontWeight.w700, AppPalette.textGrey),
            ),
          ),
        );
      }
      items.add(OrderTile(order: order));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OrdersBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            final orders = state.orders;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: ScreenHeader(
                    title: 'Buyurtmalar tarixi',
                    leadingIcon: Icons.arrow_back,
                    onLeading: () =>
                        context.read<NavBloc>().add(NavTabChanged(0)),
                    trailingIcon: Icons.filter_alt_outlined,
                    onTrailing: () =>
                        bloc.add(OrdersFilterChanged(OrderFilter.all)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
                  child: OrderFilterChips(
                    selected: state.filter,
                    onSelected: (filter) =>
                        bloc.add(OrdersFilterChanged(filter)),
                  ),
                ),
                const Divider(height: 1, color: AppPalette.border),
                Expanded(
                  child: orders.isEmpty
                      ? Center(
                    child: Text(
                      "Buyurtmalar yo'q",
                      style:
                      inter(13, FontWeight.w400, AppPalette.textGrey),
                    ),
                  )
                      : ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      ..._buildItems(orders),
                      if (state.hasMore)
                        TextButton(
                          onPressed: () =>
                              bloc.add(OrdersShowMorePressed()),
                          child: Text(
                            "Ko'proq ko'rsatish",
                            style: inter(
                              13,
                              FontWeight.w700,
                              AppPalette.orange,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}