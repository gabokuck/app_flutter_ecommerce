import 'package:equatable/equatable.dart';

class AddProductEntity extends Equatable {
  final String title;
  final String sku;
  final int price;
  final String ingredients;
  final String detail;
  final int points;
  final int stock;
  final List<String> categories;

  const AddProductEntity({
    required this.title,
    required this.sku,
    required this.price,
    required this.ingredients,
    required this.detail,
    required this.points,
    required this.stock,
    required this.categories,
  });

  @override
  List<Object?> get props =>
      [title, sku, price, ingredients, detail, points, stock, categories];
}
