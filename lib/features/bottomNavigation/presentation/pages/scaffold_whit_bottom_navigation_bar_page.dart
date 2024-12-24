import 'package:app_ventas/features/bottomNavigation/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithBottomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(), body: child);
  }
}
