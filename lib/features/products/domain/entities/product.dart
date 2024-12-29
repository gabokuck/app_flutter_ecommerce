import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String sku;
  final int price;
  final String ingredients;
  final String detail;
  final String slug;
  final int stock;
  final List<String> imageUrls;
  final List<String> categories;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const Product({
    required this.id,
    required this.title,
    required this.sku,
    required this.price,
    required this.ingredients,
    required this.detail,
    required this.slug,
    required this.stock,
    required this.imageUrls,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        sku,
        price,
        ingredients,
        detail,
        slug,
        stock,
        imageUrls,
        categories,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
