import 'package:app_ventas/features/admin/admin.dart';
import 'package:app_ventas/features/auth/presentation/pages/login_page.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/pages/scaffold_whit_bottom_navigation_bar_page.dart';
import 'package:app_ventas/features/home/presentation/pages/home_page.dart';
import 'package:app_ventas/features/orders/presentation/pages/orders_page.dart';
import 'package:app_ventas/features/points/points.dart';
import 'package:app_ventas/features/products/presentation/pages/product_detail_page.dart';
import 'package:app_ventas/features/profile/presentation/pages/profile_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// TODO: para implementar analytics
// FirebaseAnalytics analytics = FirebaseAnalytics.instance;
// FirebaseAnalyticsObserver observer =
//     FirebaseAnalyticsObserver(analytics: analytics);

final _publicRouter = GoRouter(initialLocation: '/home', routes: [
  ShellRoute(
      // observers: [observer], // TODO: observador para escuchar el cambio en las rutas
      builder: (context, state, child) {
        // FirebaseAnalytics.instance.logScreenView(screenName: '${state.uri}');
        return ScaffoldWithBottomNavBar(
          child: child,
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(path: '/admin', builder: (context, state) => AdminPage()),
        GoRoute(path: '/orders', builder: (context, state) => OrdersPage()),
        GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
        GoRoute(path: '/login', builder: (context, state) => LoginPage()),
        GoRoute(path: '/points', builder: (context, state) => PointsPage()),
        GoRoute(
            path: '/product-detail/:id',
            builder: (context, state) {
              final String id = state.pathParameters['id'] ?? '';
              return ProductDetailPage(idProduct: id);
            }),
        GoRoute(
            path: '/list-users',
            builder: (context, state) {
              return ListUsersPage();
            }),
        GoRoute(
            path: '/list-categories',
            builder: (context, state) {
              return ListCategoriesPage();
            }),
        GoRoute(
            path: '/list-products',
            builder: (context, state) {
              return ListProductsPage();
            }),
      ]),
]);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter);

  void goToHome() {
    state.go('/home');
  }

  void goToRouter(int pageIndex, {int? totalPages}) {
    final pages = totalPages == 4
        ? ['/home', '/admin', '/orders', '/profile']
        : ['/home', '/orders', '/profile'];

    state.go(pages[pageIndex]);
  }
}
