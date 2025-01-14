import 'package:app_ventas/features/auth/domain/repositories/repositories.dart';

class GetLocalBearerToken {
  final AuthRepository repository;

  GetLocalBearerToken(this.repository);

  Future<String?> call() {
    return repository.getLocalBearerToken();
  }
}
