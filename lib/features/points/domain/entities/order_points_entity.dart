class OrderPointsEntity {
  String id;
  int total;
  int totalPoints;
  String status;
  String observations;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  OrderPointsEntity({
    required this.id,
    required this.total,
    required this.totalPoints,
    required this.status,
    required this.observations,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
