import 'package:app_ventas/features/categories/domain/entities/category.dart';
import 'package:app_ventas/features/categories/domain/repositories/category_repository.dart';

class GetListCategories {
  final CategoryRepository repository;

  GetListCategories(this.repository);

  Future<List<Category>> call() async {
    return repository.getCategories();
  }
}
