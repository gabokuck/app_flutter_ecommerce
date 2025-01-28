import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/bottomNavigationBarCubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        final items = [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          if (authBloc.state.isAdmin || authBloc.state.isMaster)
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
        ];

        return BottomNavigationBar(
            onTap: (index) => context
                .read<BottomNavigationBarCubit>()
                .changePageIndexValue(index, totalPages: items.length),
            currentIndex: state.pageIndexValue,
            items: items);
      },
    );
  }
}
