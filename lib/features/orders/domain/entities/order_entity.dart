import 'item_order_entity.dart';

class OrderEntity {
  String id;
  int total;
  int totalPoints;
  String status;
  String observations;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<ItemOrderEntity> items;

  OrderEntity({
    required this.id,
    required this.total,
    required this.totalPoints,
    required this.status,
    required this.observations,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.items,
  });
}
