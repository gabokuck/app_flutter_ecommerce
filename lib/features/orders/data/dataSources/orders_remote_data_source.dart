import 'package:app_ventas/features/orders/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders(String userId);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio client;

  OrdersRemoteDataSourceImpl({required this.client});
  @override
  Future<List<OrderModel>> getOrders(String userId) async {
    final response =
        await client.get('/orders', queryParameters: {'idUser': userId});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => OrderModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Points list');
    }
  }
}
