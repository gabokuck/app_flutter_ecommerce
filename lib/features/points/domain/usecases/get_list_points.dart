import 'package:app_ventas/features/points/domain/domain.dart';

class GetListPoints {
  final PointsRepository repository;

  GetListPoints(this.repository);

  Future<List<PointEntity>> call(String userId) async {
    return await repository.getListPoints(userId);
  }
}
