import 'package:app_ventas/features/products/data/data.dart';
import 'package:app_ventas/features/products/domain/repositories/repositories.dart';

class AddProduct {
  final ProductRepository repository;

  AddProduct(this.repository);

  Future<void> call(AddProductModel product) async {
    if (product.title.isEmpty) {
      throw Exception('Product empty cannot empty');
    }

    await repository.addProduct(product);
  }
}
