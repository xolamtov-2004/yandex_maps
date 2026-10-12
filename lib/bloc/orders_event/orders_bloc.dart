
import 'package:flutter_bloc/flutter_bloc.dart';

import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(const OrdersState()) {
    on<OrdersFilterChanged>(
          (event, emit) =>
          emit(state.copyWith(filter: event.filter, showAll: false)),
    );
    on<OrdersShowMorePressed>(
          (event, emit) => emit(state.copyWith(showAll: true)),
    );
  }
}