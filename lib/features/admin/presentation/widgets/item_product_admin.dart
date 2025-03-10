import 'package:app_ventas/features/products/products.dart';
import 'package:flutter/material.dart';

class ItemProductAdmin extends StatelessWidget {
  final ProductEntity product;
  const ItemProductAdmin({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                height: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: product.imageUrls.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.imageUrls[0],
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : FlutterLogo(
                        curve: Curves.bounceIn,
                        size: 100,
                        style: FlutterLogoStyle.horizontal,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Text(
                    '\$${product.price}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 13,
                        height: 1.5),
                  ),
                  Text(
                    'Stock: ${product.stock}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Puntos: ${product.points}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  //   Text(
                  //   'Stock: ${product.stock}',
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     decoration: TextDecoration.lineThrough,
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 10,
                  //   ),
                  // ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
