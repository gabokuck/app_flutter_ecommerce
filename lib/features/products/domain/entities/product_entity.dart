import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String title;
  final String? sku;
  final int? price;
  final String? ingredients;
  final String? detail;
  final String? slug;
  final int? stock;
  final int? points;
  final List<String> imageUrls;
  final List<String> categories;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const ProductEntity({
    this.id,
    this.title = '',
    this.sku,
    this.price,
    this.ingredients,
    this.detail,
    this.slug,
    this.stock,
    this.points,
    this.imageUrls = const [],
    this.categories = const [],
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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
        points,
        imageUrls,
        categories,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
