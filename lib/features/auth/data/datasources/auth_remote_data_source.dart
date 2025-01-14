import 'package:app_ventas/config/constants/environment.dart';
import 'package:app_ventas/core/utils/utils.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await apiClient
          .post('${Environment.envData.baseUrl}/auth/login', data: {
        'email': email,
        'password': password,
      });
      return response.data;
    } catch (e) {
      return handleNetworkError(e);
    }
  }
}
