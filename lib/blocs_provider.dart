import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
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
      BlocProvider(create: (_) => getIt<PageIndexCubit>())
    ], child: child);
  }
}
