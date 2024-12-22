import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            FlutterLogo(
              size: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Categoría',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
