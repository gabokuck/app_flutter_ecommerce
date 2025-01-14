import 'package:app_ventas/features/auth/domain/entities/entities.dart';

class RoleModel extends RoleEntity {
  RoleModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.route,
      required super.createdAt,
      required super.updatedAt});

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        route: json["route"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "route": route,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
