import 'package:app_ventas/features/auth/domain/entities/entities.dart';
import 'package:app_ventas/features/auth/domain/repositories/repositories.dart';

class GetUserData {
  final AuthRepository repository;

  GetUserData(this.repository);

  Future<CheckAuthStatusResponseEntity?> call() {
    return repository.checkAuthStatus();
  }
}
