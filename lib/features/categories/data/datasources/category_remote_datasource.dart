import 'package:app_ventas/features/categories/data/models/category_model.dart';
import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio client;

  CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await client.get('http://10.0.2.2:3000/api/categories');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((pokemon) => CategoryModel.fromJson(pokemon))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }
}
