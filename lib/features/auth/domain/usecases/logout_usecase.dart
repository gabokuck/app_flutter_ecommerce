import 'package:app_ventas/features/auth/domain/repositories/repositories.dart';

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  Future<bool> call() {
    return repository.logout();
  }
}
