import 'package:app_ventas/features/products/data/datasources/product_remote_datasource.dart';
import 'package:app_ventas/features/products/domain/entities/Product.dart';
import 'package:app_ventas/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
