import 'package:app_ventas/features/search/presentation/widgets/input_search.dart';
import 'package:app_ventas/features/shoppingCart/presentation/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final bool isCollapsed;

  const Search({
    super.key,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        child: Row(
          children: [
            InputSearch(),
            isCollapsed
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ShoppingCart())
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
