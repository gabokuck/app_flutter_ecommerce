import 'package:app_ventas/features/products/domain/entities/entities.dart';
import 'package:app_ventas/features/products/domain/repositories/product_repository.dart';

class GetListProducts {
  final ProductRepository repository;

  GetListProducts(this.repository);

  Future<List<ProductEntity>> call() async {
    return repository.getProducts();
  }
}
