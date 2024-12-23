import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/features/bottomNavigation/data/repositories/page_index_repository_impl.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<RouterCubit>(RouterCubit());
  final PageIndexRepositoryImpl pageIndexRepository = PageIndexRepositoryImpl();
  getIt.registerSingleton<PageIndexCubit>(
      PageIndexCubit(pageIndexRepository: pageIndexRepository));
}
