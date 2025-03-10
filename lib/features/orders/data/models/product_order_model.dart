import 'package:app_ventas/features/orders/domain/entities/entities.dart';

class ProductOrderModel extends ProductOrderEntity {
  ProductOrderModel(
      {required super.id,
      required super.title,
      required super.sku,
      required super.price,
      required super.ingredients,
      required super.detail,
      required super.slug,
      required super.stock,
      required super.points,
      required super.imageUrls,
      required super.categories,
      required super.createdAt,
      required super.updatedAt,
      required super.deletedAt});

  factory ProductOrderModel.fromJson(Map<String, dynamic> json) {
    return ProductOrderModel(
      id: json['id'],
      title: json['title'],
      sku: json['sku'],
      price: json['price'],
      ingredients: json['ingredients'],
      detail: json['detail'],
      slug: json['slug'],
      stock: json['stock'],
      points: json['points'],
      imageUrls: json["image_urls"] != null
          ? List<String>.from(json["image_urls"].map((x) => x))
          : [],
      categories: List<String>.from(json["categories"].map((x) => x)),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deletedAt'] == null ? null : DateTime.parse(json['deletedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'title': super.title,
      'sku': super.sku,
      'price': super.price,
      'ingredients': super.ingredients,
      'detail': super.detail,
      'slug': super.slug,
      'stock': super.stock,
      'points': super.points,
      "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
      "categories": List<dynamic>.from(categories.map((x) => x)),
      'createdAt': super.createdAt.toIso8601String(),
      'updatedAt': super.updatedAt.toIso8601String(),
      'deletedAt': super.deletedAt?.toIso8601String(),
    };
  }
}
