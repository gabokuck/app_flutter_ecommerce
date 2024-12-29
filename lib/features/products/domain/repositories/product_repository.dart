import 'package:app_ventas/features/products/domain/entities/Product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
