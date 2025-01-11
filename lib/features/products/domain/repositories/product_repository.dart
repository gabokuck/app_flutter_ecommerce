import 'package:app_ventas/features/products/domain/entities/entities.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<void> addProduct(ProductEntity product);
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteProduct(int id);
}
