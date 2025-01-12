import 'package:app_ventas/features/products/data/datasources/datasources.dart';
import 'package:app_ventas/features/products/data/models/models.dart';
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

  @override
  Future<void> addProduct(ProductEntity product) async {
    final productModel = ProductModel(title: product.title);

    return await remoteDataSource.addProduct(productModel);
  }

  @override
  Future<void> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(ProductEntity product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
