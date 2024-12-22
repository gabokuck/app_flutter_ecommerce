import 'package:app_ventas/features/bottomNavigation/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:app_ventas/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.axis == Axis.vertical) {
            final bool shouldCollapse = notification.metrics.extentBefore > 50;
            if (shouldCollapse != isCollapsed) {
              setState(() {
                isCollapsed = shouldCollapse;
              });
            }
          }
          return false;
        },
        child: SafeArea(
            child: CustomScrollView(slivers: [
          SliverAddressAndShoppingCart(),
          SliverSearch(isCollapsed: isCollapsed),
          SliverCategoriesAndPromotions(),
          SliverTittleProducts(),
          SliverListProducts(),
        ])),
      ),
    );
  }
}
