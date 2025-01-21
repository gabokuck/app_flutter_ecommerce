import 'package:app_ventas/features/home/presentation/widgets/name_and_shopping_cart.dart';
import 'package:flutter/material.dart';

class SliverAddressAndShoppingCart extends StatelessWidget {
  const SliverAddressAndShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      // -------------------- Sección de dirección y carrito de compras
      NameAndShoppingCart(),
      // -------------------- fin Sección de dirección y carrito de compras
    ]));
  }
}
