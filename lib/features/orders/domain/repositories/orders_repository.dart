import 'package:app_ventas/features/orders/domain/entities/entities.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> getListOrders();
}
