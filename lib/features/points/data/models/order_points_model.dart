import 'package:app_ventas/features/points/domain/domain.dart';

class OrderPointsModel extends OrderPointsEntity {
  OrderPointsModel(
      {required super.id,
      required super.total,
      required super.totalPoints,
      required super.status,
      required super.observations,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt});

  factory OrderPointsModel.fromJson(Map<String, dynamic> json) {
    return OrderPointsModel(
      id: json['id'],
      total: json['total'],
      totalPoints: json['total_points'],
      status: json['status'],
      observations: json['observations'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deletedAt'] == null ? null : DateTime.parse(json['deletedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'total': super.total,
      'total_points': super.totalPoints,
      'status': super.status,
      'observations': super.observations,
      'createdAt': super.createdAt.toIso8601String(),
      'updatedAt': super.updatedAt.toIso8601String(),
      'deletedAt': super.deletedAt?.toIso8601String(),
    };
  }
}
