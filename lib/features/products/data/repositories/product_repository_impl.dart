import 'package:app_ventas/features/products/data/datasources/datasources.dart';
import 'package:app_ventas/features/products/domain/entities/entities.dart';
import 'package:app_ventas/features/products/domain/repositories/repositories.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
