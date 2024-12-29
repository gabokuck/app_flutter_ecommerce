import 'package:app_ventas/features/products/data/models/product_model.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get('http://10.0.2.2:3000/api/products');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }
}
