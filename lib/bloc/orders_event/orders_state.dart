
import 'package:yandex_map/model/order.dart';
enum OrderFilter { all, taxi, delivery }
class OrdersState {
  static const int previewCount = 4;
  final OrderFilter filter;
  final bool showAll;
  const OrdersState({this.filter = OrderFilter.all, this.showAll = false});

  List<Order> get _filtered {
    switch (filter) {
      case OrderFilter.all:
        return sampleOrders;
      case OrderFilter.taxi:
        return sampleOrders.where((o) => o.type == OrderType.taxi).toList();
      case OrderFilter.delivery:
        return sampleOrders
            .where((o) => o.type == OrderType.delivery)
            .toList();
    }
  }

  /// Ekranda ko'rsatiladigan buyurtmalar.
  List<Order> get orders =>
      showAll ? _filtered : _filtered.take(previewCount).toList();

  bool get hasMore => !showAll && _filtered.length > previewCount;

  OrdersState copyWith({OrderFilter? filter, bool? showAll}) {
    return OrdersState(
      filter: filter ?? this.filter,
      showAll: showAll ?? this.showAll,
    );
  }
}