class ProductOrderEntity {
  String id;
  String title;
  String sku;
  int price;
  String ingredients;
  String detail;
  String slug;
  int stock;
  int points;
  List<String> imageUrls;
  List<String> categories;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  ProductOrderEntity({
    required this.id,
    required this.title,
    required this.sku,
    required this.price,
    required this.ingredients,
    required this.detail,
    required this.slug,
    required this.stock,
    required this.points,
    required this.imageUrls,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
