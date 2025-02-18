import 'package:app_ventas/features/products/domain/domain.dart';

class GetProductById {
  final ProductRepository repository;

  GetProductById(this.repository);

  Future<ProductEntity> call(String id) async {
    return repository.getProductById(id);
  }
}
