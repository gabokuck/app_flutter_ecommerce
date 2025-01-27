import 'package:app_ventas/features/orders/data/models/models.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  @override
  Future<List<OrderModel>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}
