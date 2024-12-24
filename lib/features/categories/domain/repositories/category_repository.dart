import 'package:app_ventas/features/categories/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
