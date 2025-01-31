import 'package:app_ventas/features/auth/auth.dart';

class UpdateUserFirebasePushMessaging {
  final AuthRepository _userRepository;

  UpdateUserFirebasePushMessaging(this._userRepository);

  Future<void> call(String userId, String token) async {
    return await _userRepository.updateUserFirebasePushMessaging(userId, token);
  }
}
