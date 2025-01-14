import 'package:app_ventas/features/auth/data/models/models.dart';
import 'package:app_ventas/features/auth/domain/entities/entities.dart';

class CheckAuthStatusResponseModel extends CheckAuthStatusResponseEntity {
  CheckAuthStatusResponseModel({required super.user, required super.token});

  factory CheckAuthStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      CheckAuthStatusResponseModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": (user as UserModel).toJson(),
        "token": token,
      };
}
