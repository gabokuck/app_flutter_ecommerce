import 'package:app_ventas/features/points/data/data.dart';
import 'package:app_ventas/features/points/domain/domain.dart';

class PointsRepositoryImpl implements PointsRepository {
  final PointsRemoteDataSource dataSource;

  PointsRepositoryImpl({required this.dataSource});
  @override
  Future<List<PointEntity>> getListPoints(String userId) async {
    return await dataSource.getListPoints(userId);
  }
}
