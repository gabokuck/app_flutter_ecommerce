import 'package:app_ventas/features/promotions/presentation/widgets/item_promotions.dart';
import 'package:flutter/material.dart';

class ListPromotions extends StatelessWidget {
  const ListPromotions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 0),
      child: SizedBox(
        height: 233,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: Text(
                'Promociones',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ItemPromotions(),
                  ItemPromotions(),
                  ItemPromotions(),
                  ItemPromotions(),
                  ItemPromotions(),
                  ItemPromotions(),
                  ItemPromotions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
