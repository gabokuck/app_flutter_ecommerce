import 'package:app_ventas/features/points/domain/domain.dart';

import 'order_points_model.dart';

class PointModel extends PointEntity {
  PointModel(
      {required super.id,
      required super.points,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt,
      required super.expirationDate,
      required super.order});

  factory PointModel.fromJson(Map<String, dynamic> json) {
    return PointModel(
      id: json['id'],
      points: json['points'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deletedAt'] == null ? null : DateTime.parse(json['deletedAt']),
      expirationDate: DateTime.parse(json['expirationDate']),
      order: OrderPointsModel.fromJson(json['order']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'points': super.points,
      'createdAt': super.createdAt.toIso8601String(),
      'updatedAt': super.updatedAt.toIso8601String(),
      'deletedAt': super.deletedAt?.toIso8601String(),
      'expirationDate': super.expirationDate.toIso8601String(),
      'order': (super.order as OrderPointsModel).toJson(),
    };
  }
}
