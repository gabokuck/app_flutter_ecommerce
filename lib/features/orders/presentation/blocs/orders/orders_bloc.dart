import 'package:app_ventas/features/orders/domain/entities/entities.dart';
import 'package:app_ventas/features/orders/domain/useCases/use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetListOrders getListOrders;

  OrdersBloc({required this.getListOrders}) : super(OrdersState()) {
    on<LoadOrdersEvent>(_loadListOrdersEvent);
  }

  Future<void> _loadListOrdersEvent(
      LoadOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(status: OrderStatus.loading));
    try {
      final orders = await getListOrders(event.userId);
      emit(state.copyWith(status: OrderStatus.success, orders: orders));
    } catch (e) {
      emit(state.copyWith(
        status: OrderStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
