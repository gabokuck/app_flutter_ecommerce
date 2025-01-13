import 'package:app_ventas/config/constants/environment.dart';
import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/products/data/models/models.dart';

import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> addProduct(AddProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio client;
  final String bearerToken;

  ProductRemoteDataSourceImpl(
      {required this.bearerToken, required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response =
        await client.get('${Environment.envData.baseUrl}/products');
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
        '${Environment.envData.baseUrl}/products',
        data: product.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $bearerToken'},
        ),
      );
    } on DioException catch (e) {
      handleNetworkError(e);
      // mapToNetworkError(e);
      // throw Exception('Failed to load Categories list');
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
}
