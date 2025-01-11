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
  getIt.registerFactory(
      () => ProductsBloc(getListProducts: getIt<GetListProducts>()));
  // useCases
  getIt
      .registerLazySingleton(() => GetListProducts(getIt<ProductRepository>()));
  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
        remoteDataSource: getIt<ProductRemoteDataSource>()),
  );
  // Datasources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: getIt<Dio>(), bearerToken: ''),
  );

  // ---- Categories ----
  // blocs
  getIt.registerFactory(
      () => CategoriesBloc(getListCategories: getIt<GetListCategories>()));
  // useCases
  getIt.registerLazySingleton(
      () => GetListCategories(getIt<CategoryRepository>()));
  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
        remoteDataSource: getIt<CategoryRemoteDataSource>()),
  );
  // Datasources
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: getIt<Dio>()),
  );
}
