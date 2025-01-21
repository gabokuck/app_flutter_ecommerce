import 'package:app_ventas/features/address/presentation/widgets/address.dart';
import 'package:app_ventas/features/shoppingCart/presentation/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';

class NameAndShoppingCart extends StatelessWidget {
  const NameAndShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NameWidget(),
          ShoppingCart(),
        ],
      )),
    );
  }
}
