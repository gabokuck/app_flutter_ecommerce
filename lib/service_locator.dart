import 'package:app_ventas/config/config.dart';
import 'package:app_ventas/features/auth/auth.dart';
import 'package:app_ventas/features/notifications/notifications.dart';
import 'package:app_ventas/features/orders/orders.dart';
import 'package:app_ventas/features/points/points.dart';
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

  // ** Notifications **
  // blocs
  getIt.registerFactory(() => NotificationsBloc());

  // ** Bottom navigation **
  getIt.registerLazySingleton(() => PageIndexRepositoryImpl());
  getIt.registerLazySingleton<BottomNavigationBarCubit>(
      () => BottomNavigationBarCubit(
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
  getIt.registerFactory<AuthBloc>(() => AuthBloc(
        loginUseCase: getIt<LoginUseCase>(),
        logoutUseCase: getIt<LogoutUseCase>(),
        getLocalBearerToken: getIt<GetLocalBearerToken>(),
        getUserData: getIt<GetUserData>(),
        updateBearerTokenServiceLocator:
            getIt<UpdateBearerTokenServiceLocator>(),
        bottomNavigationBarCubit: getIt<BottomNavigationBarCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
      ));

  // Set AuthBloc in BottomNavigationBarCubit
  getIt<BottomNavigationBarCubit>().setAuthBloc(getIt<AuthBloc>());

  // ** Products **
  // blocs
  getIt.registerFactory(() => ProductsBloc(
        getListProducts: getIt<GetListProducts>(),
        searchByCategory: getIt<SearchByCategory>(),
        addProduct: getIt<AddProduct>(),
        routerCubit: getIt<RouterCubit>(),
        searchByQuery: getIt<SearchByQuery>(),
      ));

  // useCases
  getIt.registerLazySingleton<GetListProducts>(
      () => GetListProducts(getIt<ProductRepository>()));
  getIt.registerLazySingleton<AddProduct>(
      () => AddProduct(getIt<ProductRepository>()));
  getIt.registerLazySingleton<SearchByCategory>(
      () => SearchByCategory(getIt<ProductRepository>()));
  getIt.registerLazySingleton<SearchByQuery>(
      () => SearchByQuery(getIt<ProductRepository>()));
  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
        remoteDataSource: getIt<ProductRemoteDataSource>()),
  );
  // Datasources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: getIt<Dio>()),
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

  // ** Orders **
  // blocs
  getIt
      .registerFactory(() => OrdersBloc(getListOrders: getIt<GetListOrders>()));
  // useCases
  getIt.registerLazySingleton(() => GetListOrders(getIt<OrdersRepository>()));
  // Repositories
  getIt.registerLazySingleton<OrdersRepository>(
    () =>
        OrdersRepositoryImpl(remoteDataSource: getIt<OrdersRemoteDataSource>()),
  );
  // Datasources
  getIt.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(client: getIt<Dio>()),
  );

  // ** Points **
  // blocs
  getIt.registerFactory(() => PointsBloc(
      getListPoints: getIt<GetListPoints>(),
      getTotalPoints: getIt<GetTotalPoints>()));
  // useCases
  getIt.registerLazySingleton(() => GetListPoints(getIt<PointsRepository>()));
  getIt.registerLazySingleton(() => GetTotalPoints(getIt<PointsRepository>()));
  // Repositories
  getIt.registerLazySingleton<PointsRepository>(
    () => PointsRepositoryImpl(dataSource: getIt<PointsRemoteDataSource>()),
  );
  // Datasources
  getIt.registerLazySingleton<PointsRemoteDataSource>(
    () => PointsRemoteDataSourceImpl(client: getIt<Dio>()),
  );
}
