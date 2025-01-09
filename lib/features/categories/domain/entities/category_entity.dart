import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props =>
      [id, name, description, iconName, createdAt, updatedAt, deletedAt];
}
