import 'package:app_ventas/features/auth/domain/repositories/repositories.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<bool> call(String email, String password) {
    return repository.login(email, password);
  }
}
