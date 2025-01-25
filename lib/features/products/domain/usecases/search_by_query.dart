import 'package:app_ventas/features/products/domain/entities/entities.dart';
import 'package:app_ventas/features/products/domain/repositories/repositories.dart';

class SearchByQuery {
  final ProductRepository _productRepository;

  SearchByQuery(this._productRepository);

  Future<List<ProductEntity>> call(String query) async {
    return await _productRepository.searchByQuery(query);
  }
}
