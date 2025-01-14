import 'package:app_ventas/features/auth/domain/entities/entities.dart';

class CheckAuthStatusResponseEntity {
  UserEntity user;
  String token;

  CheckAuthStatusResponseEntity({required this.user, required this.token});
}
