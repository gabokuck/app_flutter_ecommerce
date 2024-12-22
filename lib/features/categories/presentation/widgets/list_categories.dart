import 'package:app_ventas/features/categories/presentation/widgets/item_category.dart';
import 'package:flutter/material.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 0),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            ItemCategory(),
            ItemCategory(),
            ItemCategory(),
            ItemCategory(),
            ItemCategory(),
          ],
        ),
      ),
    );
  }
}
