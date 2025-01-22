import 'package:app_ventas/config/config.dart';
import 'package:app_ventas/features/auth/auth.dart';
import 'package:app_ventas/main.dart';

import 'features/bottomNavigation/bottom_navigation.dart';
import 'package:app_ventas/features/categories/categories.dart';
import 'package:app_ventas/features/products/products.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> serviceLocatorInit() async {
  // ** Registra el token con un nombre específico **
  getIt.registerLazySingleton<String>(
    () => '',
    instanceName: 'BearerToken',
  );

  // ** Register Dio instance **
  getIt.registerLazySingleton<Dio>(
    () {
      final dio = Dio();
      dio.options.baseUrl = Environment.envData.baseUrl;
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // Obtiene el token por nombre
          final token = getIt<String>(instanceName: 'BearerToken');
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ));
      return dio;
    },
  );

  // ** Router **
  getIt.registerSingleton<RouterCubit>(RouterCubit());

  // ** Bottom navigation **
  getIt.registerLazySingleton(() => PageIndexRepositoryImpl());
  getIt.registerLazySingleton<BottomNavigationBarCubit>(() => BottomNavigationBarCubit(
      pageIndexRepository: getIt<PageIndexRepositoryImpl>(),
      routerCubit: getIt<RouterCubit>(),
  ));

  // ** Auth **
  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => GetLocalBearerToken(getIt()));
  getIt.registerLazySingleton(() => GetUserData(getIt()));
  getIt.registerLazySingleton(() => UpdateBearerTokenServiceLocator());

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

  // BloC
  getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
            loginUseCase: getIt<LoginUseCase>(),
            logoutUseCase: getIt<LogoutUseCase>(),
            getLocalBearerToken: getIt<GetLocalBearerToken>(),
            getUserData: getIt<GetUserData>(),
            updateBearerTokenServiceLocator: getIt<UpdateBearerTokenServiceLocator>(),
            bottomNavigationBarCubit: getIt<BottomNavigationBarCubit>(),
          ));

  // Set AuthBloc in BottomNavigationBarCubit
  getIt<BottomNavigationBarCubit>().setAuthBloc(getIt<AuthBloc>());

  // ** Products **
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
    () => ProductRemoteDataSourceImpl(client: getIt<Dio>(), bearerToken: ''),
  );

  // ** Categories **
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
