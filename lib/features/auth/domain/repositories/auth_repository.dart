import 'package:app_ventas/features/auth/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<String?> getLocalBearerToken();
  Future<CheckAuthStatusResponseEntity?> checkAuthStatus();
  Future<bool> logout();
  Future<void> updateUserFirebasePushMessaging(String userId, String token);
}
