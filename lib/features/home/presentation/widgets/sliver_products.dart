import 'package:app_ventas/features/products/presentation/widgets/list_products.dart';
import 'package:flutter/material.dart';

class SliverListProducts extends StatelessWidget {
  const SliverListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      // -------------------- sección productos

      ListProducts()
      // -------------------- fin sección productos]))],
    ]));
  }
}
