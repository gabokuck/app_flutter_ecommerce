import 'package:app_ventas/features/products/products.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<void> addProduct(AddProductModel product);
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteProduct(int id);
}
