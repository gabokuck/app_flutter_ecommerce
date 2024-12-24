import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PageIndexCubit pageIndexCubit = context.watch<PageIndexCubit>();
    final RouterCubit routerCubit = context.watch<RouterCubit>();
    return BottomNavigationBar(
        onTap: (index) {
          pageIndexCubit.changePageIndexValue(index);
          routerCubit.goToHome(index);
        },
        currentIndex: pageIndexCubit.state.pageIndexValue,
        items: [
          BottomNavigationBarItem(
            icon: FlutterLogo(),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: FlutterLogo(),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: FlutterLogo(),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: FlutterLogo(),
            label: 'Mi Perfil',
          ),
        ]);
  }
}
