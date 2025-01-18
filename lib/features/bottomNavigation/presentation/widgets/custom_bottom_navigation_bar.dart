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
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings_rounded),
                label: 'Admin',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.all_inbox_rounded),
                label: 'Pedidos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Mi Perfil',
              ),
            ]);
      },
    );
  }
}
