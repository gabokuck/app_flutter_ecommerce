import 'package:app_ventas/features/bottomNavigation/presentation/pages/bottom_navigation_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _publicRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
    path: '/home/:page',
    name: 'Home',
    builder: (context, state) {
      final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
      return BottomNavigationPage(
        pageIndex: pageIndex,
      );
    },
  ),
]);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter) {}
}
