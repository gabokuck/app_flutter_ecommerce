import 'package:app_ventas/features/products/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final ProductEntity product;

  const CustomBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Modal BottomSheet'),
            ElevatedButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
