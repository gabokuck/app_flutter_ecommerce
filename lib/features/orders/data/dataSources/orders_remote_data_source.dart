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
        queryParameters: {'idUser': 'e274bdd9-148f-497f-b2a4-e9b0260db1e9'});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => OrderModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }
}
