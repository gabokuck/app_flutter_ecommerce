import 'package:app_ventas/features/points/domain/entities/entities.dart';

abstract class PointsRepository {
  Future<List<PointEntity>> getListPoints(String userId);
}
