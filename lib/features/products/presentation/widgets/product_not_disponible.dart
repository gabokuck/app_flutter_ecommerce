import 'package:flutter/material.dart';

class ProductNotDisponible extends StatelessWidget {
  const ProductNotDisponible({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.warning_amber_outlined,
              size: 70,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Text(
              'Productos no disponibles',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
