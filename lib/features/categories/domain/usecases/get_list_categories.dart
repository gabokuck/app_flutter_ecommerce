import 'package:app_ventas/features/categories/domain/entities/category_entity.dart';
import 'package:app_ventas/features/categories/domain/repositories/category_repository.dart';

class GetListCategories {
  final CategoryRepository repository;

  GetListCategories(this.repository);

  Future<List<CategoryEntity>> call() async {
    return repository.getCategories();
  }
}
