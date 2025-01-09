import 'package:app_ventas/features/products/domain/entities/entities.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}
