import 'package:app_ventas/config/router/router.dart';

import 'features/bottomNavigation/bottom_navigation.dart';
import 'package:app_ventas/features/categories/categories.dart';
import 'package:app_ventas/features/products/products.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  // ---- Router ----
  getIt.registerSingleton<RouterCubit>(RouterCubit());

  // ---- Bottom navigation ----
  final PageIndexRepositoryImpl pageIndexRepository = PageIndexRepositoryImpl();
  getIt.registerSingleton<PageIndexCubit>(
      PageIndexCubit(pageIndexRepository: pageIndexRepository));

  // Register Dio instance
  getIt.registerLazySingleton<Dio>(() => Dio());

  // ---- Products ----
  // blocs
  getIt.registerFactory(() => ProductsBloc(getListProducts: getIt()));
  // useCases
  getIt.registerLazySingleton(() => GetListProducts(getIt()));
  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: getIt()),
  );
  // Datasources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: getIt()),
  );

  // ---- Categories ----
  // blocs
  getIt.registerFactory(() => CategoriesBloc(getListCategories: getIt()));
  // useCases
  getIt.registerLazySingleton(() => GetListCategories(getIt()));
  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: getIt()),
  );
  // Datasources
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: getIt()),
  );
}
