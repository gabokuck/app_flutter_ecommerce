import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/features/bottomNavigation/data/repositories/page_index_repository_impl.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
import 'package:app_ventas/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:app_ventas/features/categories/data/repositories/category_repository_impl.dart';
import 'package:app_ventas/features/categories/domain/repositories/category_repository.dart';
import 'package:app_ventas/features/categories/domain/usecases/get_list_categories.dart';
import 'package:app_ventas/features/categories/presentation/blocs/categories/categories_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<RouterCubit>(RouterCubit());
  final PageIndexRepositoryImpl pageIndexRepository = PageIndexRepositoryImpl();
  getIt.registerSingleton<PageIndexCubit>(
      PageIndexCubit(pageIndexRepository: pageIndexRepository));

  // Register Dio instance
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Bloc
  getIt.registerFactory(() => CategoriesBloc(getListCategories: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetListCategories(getIt()));

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data Sources
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: getIt()),
  );
}
