import 'package:app_ventas/features/admin/presentation/pages/admin_page.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/pages/scaffold_whit_bottom_navigation_bar_page.dart';
import 'package:app_ventas/features/home/presentation/pages/home_page.dart';
import 'package:app_ventas/features/orders/presentation/pages/orders_page.dart';
import 'package:app_ventas/features/products/presentation/pages/product_detail_page.dart';
import 'package:app_ventas/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _publicRouter = GoRouter(initialLocation: '/home', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithBottomNavBar(
          child: child,
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(path: '/admin', builder: (context, state) => AdminPage()),
        GoRoute(path: '/orders', builder: (context, state) => OrdersPage()),
        GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
        GoRoute(
            path: '/product-detail/:id',
            builder: (context, state) {
              final String id = state.pathParameters['id'] ?? '';
              return ProductDetailPage(idProduct: id);
            }),
      ]),
]);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter);

  void goToHome(int pageIndex) {
    switch (pageIndex) {
      case 0:
        state.go('/home');
        break;
      case 1:
        state.go('/admin');
        break;
      case 2:
        state.go('/orders');
        break;
      case 3:
        state.go('/profile');
        break;
    }
  }
}
