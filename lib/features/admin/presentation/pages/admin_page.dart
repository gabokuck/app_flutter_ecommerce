import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: GridViewAdminWidget()));
  }
}

class GridViewAdminWidget extends StatelessWidget {
  const GridViewAdminWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      children: [
        ItemAdminWidget(
          text: 'Usuarios',
          icon: Icons.people_alt,
          route: '/list-users',
        ),
        ItemAdminWidget(
          text: 'Categorias',
          icon: Icons.category_sharp,
          route: '/list-categories',
        ),
        ItemAdminWidget(
          text: 'Productos',
          icon: Icons.propane_tank_rounded,
          route: '/list-products',
        ),
        ItemAdminWidget(
          text: 'Pedidos',
          icon: Icons.all_inbox_rounded,
          route: '/list-products',
        ),
      ],
    );
  }
}

class ItemAdminWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;
  const ItemAdminWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(route);
      },
      child: Card(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
