import 'package:app_ventas/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.description,
    required super.iconName,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      iconName: json['iconName'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt:
          json['deletedAt'] == null ? null : DateTime.parse(json['deletedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'description': super.description,
      'iconName': super.iconName,
      'createdAt': super.createdAt.toIso8601String(),
      'updatedAt': super.updatedAt.toIso8601String(),
      'deletedAt': super.deletedAt?.toIso8601String(),
    };
  }
}
