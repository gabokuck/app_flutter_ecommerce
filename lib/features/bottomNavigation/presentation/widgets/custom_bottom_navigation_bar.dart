import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          print(index);
        },
        currentIndex: 1,
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
