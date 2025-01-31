import 'package:app_ventas/features/auth/data/datasources/datasources.dart';
import 'package:app_ventas/features/auth/domain/entities/check_auth_status_response_entity.dart';
import 'package:app_ventas/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<bool> login(String email, String password) async {
    final response = await remoteDataSource.login(email, password);
    await localDataSource.cacheToken(response['token']);
    return true;
  }

  @override
  Future<String?> getLocalBearerToken() async {
    final token = await localDataSource.getToken();
    return token;
  }

  @override
  Future<CheckAuthStatusResponseEntity?> checkAuthStatus() async {
    return remoteDataSource.checkAuthStatus();
  }

  @override
  Future<bool> logout() {
    return localDataSource.logout();
  }

  @override
  Future<void> updateUserFirebasePushMessaging(String userId, String token) {
    return remoteDataSource.updateUserFirebasePushMessaging(userId, token);
  }
}
