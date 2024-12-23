import 'package:app_ventas/features/admin/presentation/pages/admin_page.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/pageIndex/page_index_cubit.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:app_ventas/features/home/presentation/pages/home_page.dart';
import 'package:app_ventas/features/orders/presentation/pages/orders_page.dart';
import 'package:app_ventas/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationPage extends StatelessWidget {
  final int pageIndex;
  const BottomNavigationPage({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final PageIndexCubit pageIndexCubit = context.read<PageIndexCubit>();

    final List<Widget> _pages = [
      HomePage(),
      AdminPage(),
      OrdersPage(),
      ProfilePage(),
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: IndexedStack(
        index: pageIndexCubit.state.pageIndexValue,
        children: _pages,
      ),
    );
  }
}
