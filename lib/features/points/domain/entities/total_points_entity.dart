import 'package:app_ventas/features/points/points.dart';

class TotalPointEntity {
  int totalPoints;
  List<PointEntity> points;

  TotalPointEntity({
    required this.totalPoints,
    required this.points,
  });
}
