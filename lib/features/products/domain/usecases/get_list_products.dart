import 'package:app_ventas/features/products/domain/domain.dart';

class GetListProducts {
  final ProductRepository repository;

  GetListProducts(this.repository);

  Future<List<ProductEntity>> call() async {
    return repository.getProducts();
  }
}
