import 'order_points_entity.dart';

class PointEntity {
  String id;
  int points;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  DateTime expirationDate;
  OrderPointsEntity order;

  PointEntity({
    required this.id,
    required this.points,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.expirationDate,
    required this.order,
  });
}
