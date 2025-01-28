import 'package:app_ventas/features/auth/domain/entities/entities.dart';

class UserEntity {
  final String id;
  final String email;
  final String names;
  final String surnames;
  final String phone;
  final dynamic lastLoginDate;
  final String notificationToken;
  final bool isEmailConfirmed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final List<RoleEntity> roles;

  UserEntity(
      {required this.id,
      required this.email,
      required this.names,
      required this.surnames,
      required this.phone,
      required this.lastLoginDate,
      required this.notificationToken,
      required this.isEmailConfirmed,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.roles});

  static UserEntity reset() {
    return UserEntity(
      id: '',
      email: '',
      names: '',
      surnames: '',
      phone: '',
      lastLoginDate: '',
      notificationToken: '',
      isEmailConfirmed: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: '',
      roles: [],
    );
  }
}
