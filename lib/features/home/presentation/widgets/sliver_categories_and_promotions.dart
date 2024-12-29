import 'package:app_ventas/features/categories/presentation/widgets/list_categories.dart';
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
      //TODO: Agregar la colección de promociones en el backend
      // ListPromotions(),
      // -------------------- fin sección promociones
    ]));
  }
}
