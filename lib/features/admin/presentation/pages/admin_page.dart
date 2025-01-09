import 'package:flutter/material.dart';

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
        ),
        ItemAdminWidget(
          text: 'Categorias',
          icon: Icons.category_sharp,
        ),
        ItemAdminWidget(
          text: 'Productos',
          icon: Icons.propane_tank_rounded,
        ),
      ],
    );
  }
}

class ItemAdminWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const ItemAdminWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(text)
        ],
      ),
    );
  }
}
