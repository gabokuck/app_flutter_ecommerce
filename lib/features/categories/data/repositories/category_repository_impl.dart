import 'package:app_ventas/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:app_ventas/features/categories/domain/entities/category.dart';
import 'package:app_ventas/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    return await remoteDataSource.getCategories();
  }
}
