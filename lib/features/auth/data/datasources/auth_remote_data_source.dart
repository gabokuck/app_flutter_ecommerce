import 'package:app_ventas/config/constants/environment.dart';
import 'package:app_ventas/core/utils/utils.dart';
import 'package:app_ventas/features/auth/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<CheckAuthStatusResponseModel?> checkAuthStatus();
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

  @override
  Future<CheckAuthStatusResponseModel?> checkAuthStatus() async {
    try {
      final response = await apiClient.get(
        '${Environment.envData.baseUrl}/auth/check-auth-status',
      );

      return CheckAuthStatusResponseModel.fromJson(response.data);
    } catch (e) {
      handleNetworkError(e);
      return null;
    }
  }
}
