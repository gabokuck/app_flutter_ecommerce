import 'package:app_ventas/config/router/router.dart';
import 'package:app_ventas/core/network/network.dart';
import 'package:app_ventas/features/auth/auth.dart';
import 'package:app_ventas/main.dart';

import 'features/bottomNavigation/bottom_navigation.dart';
import 'package:app_ventas/features/categories/categories.dart';
import 'package:app_ventas/features/products/products.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> serviceLocatorInit() async {
  // ---- Router ----
  getIt.registerSingleton<RouterCubit>(RouterCubit());

// ---- Auth ----
  // BloC
  getIt.registerFactory(() => AuthBloc(getIt()));

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sharedPref),
  );

  // ---- Bottom navigation ----
  final PageIndexRepositoryImpl pageIndexRepository = PageIndexRepositoryImpl();
  getIt.registerSingleton<PageIndexCubit>(
      PageIndexCubit(pageIndexRepository: pageIndexRepository));

  // Register Dio instance
  getIt.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(connectTimeout: Duration(seconds: 10))));

  // ---- Products ----
  // blocs
  getIt.registerFactory(() => ProductsBloc(
        getListProducts: getIt<GetListProducts>(),
        addProduct: getIt<AddProduct>(),
        routerCubit: getIt<RouterCubit>(),
      ));

  // useCases
  getIt.registerLazySingleton<GetListProducts>(
      () => GetListProducts(getIt<ProductRepository>()));
  getIt.registerLazySingleton<AddProduct>(
      () => AddProduct(getIt<ProductRepository>()));
  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
        remoteDataSource: getIt<ProductRemoteDataSource>()),
  );
  // Datasources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
        client: getIt<Dio>(),
        bearerToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQ2NmMzYzFkLWU0MmEtNDRmNS1hZTdmLTFmMDc2OTJmMzUyMyIsImlhdCI6MTczNjcxOTk2NSwiZXhwIjoxNzM2NzI3MTY1fQ.Hr2IUV34YafVKGLJQBXSWRV3MBuGbixO1V7TbCxFvKs'),
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
