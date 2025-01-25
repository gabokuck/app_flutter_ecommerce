import 'package:app_ventas/features/products/products.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> searchByCategory(String category);
  Future<List<ProductEntity>> searchByQuery(String query);
  Future<void> addProduct(AddProductModel product);
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteProduct(int id);
}
