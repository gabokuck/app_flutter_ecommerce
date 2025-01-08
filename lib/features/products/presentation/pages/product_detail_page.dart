import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String idProduct;
  const ProductDetailPage({super.key, required this.idProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Text('Product Detail Page $idProduct'),
      ),
    );
  }
}
