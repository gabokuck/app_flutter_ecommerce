import 'package:app_ventas/config/config.dart';
import 'package:dio/dio.dart';

class ApiClient {
  String baseUrl = Environment.envData.baseUrl;
  late Dio _dio;

  ApiClient() {
    _dio = _createDio();
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );
}
