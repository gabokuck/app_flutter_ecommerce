import 'package:app_ventas/core/core.dart';
import 'package:dio/dio.dart';

dynamic handleNetworkError(dynamic error) {
  if (error is DioException) {
    if (error.response?.statusCode == 401) {
      throw AppNetworkException(
          'No autorizado. Por favor inicia sesión nuevamente.');
    } else if (error.response?.statusCode == 400) {
      throw AppNetworkException('${error.response?.data}');
    } else if (error.response?.statusCode == 403) {
      throw AppNetworkException(
          'Prohibido. No tienes permisos para acceder a este recurso.');
    } else if (error.response?.statusCode == 404) {
      throw AppNetworkException('Recurso no encontrado.');
    } else if (error.type == DioExceptionType.connectionTimeout) {
      throw AppNetworkException('Error de conexión: El servidor no responde.');
    } else {
      throw AppNetworkException('Error inesperado: ${error.message}');
    }
  }

  throw AppNetworkException('Ocurrió un error desconocido.');
}
