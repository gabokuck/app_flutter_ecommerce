import 'package:app_ventas/features/orders/domain/entities/entities.dart';
import 'package:app_ventas/features/orders/domain/repositories/repositories.dart';

class GetListOrders {
  final OrdersRepository repository;

  GetListOrders(this.repository);

  Future<List<OrderEntity>> call(String userId) async {
    return await repository.getListOrders(userId);
  }
}
