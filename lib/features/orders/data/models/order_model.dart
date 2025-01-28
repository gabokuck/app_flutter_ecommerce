import 'package:app_ventas/features/orders/data/models/models.dart';
import 'package:app_ventas/features/orders/domain/entities/entities.dart';

class OrderModel extends OrderEntity {
  OrderModel(
      {required super.id,
      required super.total,
      required super.totalPoints,
      required super.status,
      required super.observations,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt,
      required super.items});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      total: json['total'],
      totalPoints: json['totalPoints'],
      status: json['status'],
      observations: json['observations'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deleted_at'] == null ? '' : DateTime.parse(json['deletedAt']),
      items: List<ItemOrderEntity>.from(
          json["items"].map((x) => ItemOrderModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
      'totalPoints': totalPoints,
      'status': status,
      'observations': observations,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'items': List<dynamic>.from(
          (items as List<ItemOrderModel>).map((x) => x.toJson())),
    };
  }
}
