import 'package:app_ventas/features/orders/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio client;

  OrdersRemoteDataSourceImpl({required this.client});
  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await client.get('/orders',
        queryParameters: {'idUser': 'd66c3c1d-e42a-44f5-ae7f-1f07692f3523'});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => OrderModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }
}
