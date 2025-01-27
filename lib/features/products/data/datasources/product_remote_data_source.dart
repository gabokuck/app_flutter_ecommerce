import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/products/data/models/models.dart';

import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> addProduct(AddProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<List<ProductModel>> searchByCategory(String category);
  Future<List<ProductModel>> searchByQuery(String query);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get('/products');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }

  @override
  Future<void> addProduct(AddProductModel product) async {
    try {
      await client.post(
        '/products',
        data: product.toJson(),
      );
    } on DioException catch (e) {
      handleNetworkError(e);
    }
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(ProductModel product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> searchByCategory(String category) async {
    final response =
        await client.get('/products', queryParameters: {'category': category});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }

  @override
  Future<List<ProductModel>> searchByQuery(String query) async {
    final response =
        await client.get('/products', queryParameters: {'query': query});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }
}
