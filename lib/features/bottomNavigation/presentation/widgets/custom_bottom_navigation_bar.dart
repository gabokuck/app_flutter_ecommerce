import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageIndexCubit, PageIndexState>(
      builder: (context, state) {
        return BottomNavigationBar(
            onTap: (index) {
              context.read<PageIndexCubit>().changePageIndexValue(index);
            },
            currentIndex: state.pageIndexValue,
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
      },
    );
  }
}
