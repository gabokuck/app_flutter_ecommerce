import 'package:app_ventas/features/products/domain/entities/entities.dart';

class AddProductModel extends AddProductEntity {
  const AddProductModel(
      {required super.title,
      required super.sku,
      required super.price,
      required super.ingredients,
      required super.detail,
      required super.points,
      required super.stock,
      required super.categories});

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      AddProductModel(
        title: json["title"],
        sku: json["sku"],
        price: json["price"],
        ingredients: json["ingredients"],
        detail: json["detail"],
        points: json["points"],
        stock: json["stock"],
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sku": sku,
        "price": price,
        "ingredients": ingredients,
        "detail": detail,
        "points": points,
        "stock": stock,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}
