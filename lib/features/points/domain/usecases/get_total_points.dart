import 'package:app_ventas/features/points/domain/entities/entities.dart';
import 'package:app_ventas/features/points/domain/repositories/repositories.dart';

class GetTotalPoints {
  final PointsRepository _repository;

  GetTotalPoints(this._repository);

  Future<TotalPointEntity> call(String userId) async {
    return await _repository.getTotalPoints(userId);
  }
}
