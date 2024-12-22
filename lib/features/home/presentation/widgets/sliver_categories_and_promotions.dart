import 'package:app_ventas/features/categories/presentation/widgets/list_categories.dart';
import 'package:app_ventas/features/promotions/presentation/widgets/list_promotions.dart';
import 'package:flutter/material.dart';

class SliverCategoriesAndPromotions extends StatelessWidget {
  const SliverCategoriesAndPromotions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      // -------------------- secciones
      ListCategories(),
      // -------------------- fin secciones

      // -------------------- sección promociones
      ListPromotions(),
      // -------------------- fin sección promociones
    ]));
  }
}
