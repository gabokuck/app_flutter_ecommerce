import 'package:app_ventas/features/products/presentation/widgets/item_product.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                ItemProduct(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
