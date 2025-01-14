import 'package:app_ventas/features/auth/auth.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.email,
      required super.names,
      required super.surnames,
      required super.phone,
      required super.lastLoginDate,
      required super.notificationToken,
      required super.isEmailConfirmed,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt,
      required super.roles});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        names: json["names"],
        surnames: json["surnames"],
        phone: json["phone"],
        lastLoginDate: json["lastLoginDate"],
        notificationToken: json["notification_token"],
        isEmailConfirmed: json["isEmailConfirmed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        roles: List<RoleEntity>.from(
            json["roles"].map((x) => RoleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "names": names,
        "surnames": surnames,
        "phone": phone,
        "lastLoginDate": lastLoginDate,
        "notification_token": notificationToken,
        "isEmailConfirmed": isEmailConfirmed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "roles": roles.map((x) => (x as RoleModel).toJson()).toList(),
      };
}
