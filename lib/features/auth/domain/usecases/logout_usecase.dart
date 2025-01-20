import 'package:app_ventas/features/auth/domain/repositories/repositories.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<bool> call() {
    return repository.logout();
  }
}
