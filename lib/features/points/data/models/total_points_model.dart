import 'package:app_ventas/features/points/data/models/models.dart';
import 'package:app_ventas/features/points/domain/entities/entities.dart';

class TotalPointsModel extends TotalPointEntity {
  TotalPointsModel({required super.totalPoints, required super.points});

  factory TotalPointsModel.fromJson(Map<String, dynamic> json) {
    return TotalPointsModel(
      totalPoints: json['totalPoints'],
      points: (json['points'] as List)
          .map((point) => PointModel.fromJson(point))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPoints': totalPoints,
      'points':
          (points as List<PointModel>).map((point) => point.toJson()).toList(),
    };
  }
}
