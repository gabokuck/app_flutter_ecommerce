part of 'orders_bloc.dart';

enum OrderStatus {
  initial,
  loading,
  success,
  error,
}

class OrdersState extends Equatable {
  final OrderStatus status;
  final String? errorMessage;
  final List<OrderEntity>? orders;

  const OrdersState(
      {this.status = OrderStatus.initial, this.errorMessage, this.orders});

  OrdersState copyWith({
    OrderStatus? status,
    String? errorMessage,
    List<OrderEntity>? orders,
  }) {
    return OrdersState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, orders];
}
