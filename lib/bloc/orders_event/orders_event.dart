import 'orders_state.dart';

abstract class OrdersEvent {}

class OrdersFilterChanged extends OrdersEvent {
  final OrderFilter filter;
  OrdersFilterChanged(this.filter);
}

/// "Ko'proq ko'rsatish" bosildi.
class OrdersShowMorePressed extends OrdersEvent {}