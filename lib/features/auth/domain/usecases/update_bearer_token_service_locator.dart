import 'package:get_it/get_it.dart';

class UpdateBearerTokenServiceLocator {
  void call(String newToken) {
    final sl = GetIt.instance;

    if (sl.isRegistered<String>(instanceName: 'BearerToken')) {
      // Reemplaza el token existente con el nuevo valor
      sl.unregister<String>(instanceName: 'BearerToken');
      sl.registerLazySingleton<String>(() => newToken,
          instanceName: 'BearerToken');
    } else {
      // Registra el token si aún no existe
      sl.registerLazySingleton<String>(
        () => newToken,
        instanceName: 'BearerToken',
      );
    }
  }
}
