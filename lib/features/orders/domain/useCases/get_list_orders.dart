import 'package:app_ventas/features/orders/domain/entities/entities.dart';
import 'package:app_ventas/features/orders/domain/repositories/repositories.dart';

class GetListOrders {
  final OrdersRepository repository;

  GetListOrders(this.repository);

  Future<List<OrderEntity>> call() async {
    return await repository.getListOrders();
  }
}
