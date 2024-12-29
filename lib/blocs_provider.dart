import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
import 'package:app_ventas/features/categories/presentation/blocs/categories/categories_bloc.dart';
import 'package:app_ventas/features/products/presentation/blocs/products/products_bloc.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsProvider extends StatelessWidget {
  final Widget child;
  const BlocsProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<RouterCubit>()),
      BlocProvider(create: (_) => getIt<PageIndexCubit>()),
      BlocProvider(
        create: (_) => getIt<CategoriesBloc>()..add(LoadCategoriesEvent()),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => getIt<ProductsBloc>()..add(LoadProductsEvent()),
        lazy: false,
      ),
    ], child: child);
  }
}
