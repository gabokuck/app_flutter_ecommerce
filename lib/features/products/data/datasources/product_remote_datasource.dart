import 'package:app_ventas/config/constants/environment.dart';
import 'package:app_ventas/features/products/data/models/product_model.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> addProduct(ProductModel product);
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
  Future<void> addProduct(ProductModel product) async {
    try {
      await client.post(
        'https://api.example.com/products',
        data: product,
        options: Options(
          headers: {'Authorization': 'Bearer $bearerToken'},
        ),
      );
    } catch (e) {
      throw Exception('Error adding product: ${e.toString()}');
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
