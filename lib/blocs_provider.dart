import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/bottomNavigationBarCubit/bottom_navigation_bar_cubit.dart';
import 'package:app_ventas/features/categories/presentation/blocs/categories/categories_bloc.dart';
import 'package:app_ventas/features/orders/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/points/presentation/blocs/blocs.dart';
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
      BlocProvider(
        create: (_) => getIt<AuthBloc>(),
        lazy: false,
      ),
      BlocProvider(create: (_) => getIt<BottomNavigationBarCubit>()),
      BlocProvider(
        create: (_) => getIt<CategoriesBloc>()..add(LoadCategoriesEvent()),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => getIt<ProductsBloc>()..add(LoadProductsEvent()),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => getIt<OrdersBloc>(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => getIt<PointsBloc>(),
        lazy: true,
      ),
    ], child: child);
  }
}
