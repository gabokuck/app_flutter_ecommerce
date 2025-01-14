class RoleEntity {
  String id;
  String name;
  String image;
  String route;
  DateTime createdAt;
  DateTime updatedAt;

  RoleEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.route,
    required this.createdAt,
    required this.updatedAt,
  });
}
