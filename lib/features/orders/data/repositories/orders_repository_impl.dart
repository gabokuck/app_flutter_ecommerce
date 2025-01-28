import 'package:app_ventas/features/orders/data/datasources/data_sources.dart';
import 'package:app_ventas/features/orders/domain/entities/order_entity.dart';
import 'package:app_ventas/features/orders/domain/repositories/repositories.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<OrderEntity>> getListOrders(String userId) async {
    return await remoteDataSource.getOrders(userId);
  }
}
