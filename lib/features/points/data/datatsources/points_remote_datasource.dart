import 'package:app_ventas/features/points/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class PointsRemoteDataSource {
  Future<List<PointModel>> getListPoints(String userId);
}

class PointsRemoteDataSourceImpl implements PointsRemoteDataSource {
  final Dio client;

  PointsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PointModel>> getListPoints(String userId) async {
    final response =
        await client.get('/points', queryParameters: {'idUser': userId});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => PointModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Categories list');
    }
  }
}
