import 'package:app_ventas/features/products/domain/entities/entities.dart';
import 'package:app_ventas/features/products/domain/repositories/repositories.dart';

class SearchByCategory {
  final ProductRepository repository;

  SearchByCategory(this.repository);

  Future<List<ProductEntity>> call(String category) async {
    return await repository.searchByCategory(category);
  }
}
