import 'package:app_ventas/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:app_ventas/features/categories/domain/entities/category_entity.dart';
import 'package:app_ventas/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await remoteDataSource.getCategories();
  }
}
