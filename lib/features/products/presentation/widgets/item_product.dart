import 'package:app_ventas/features/products/domain/entities/entities.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemProduct extends StatelessWidget {
  final ProductEntity product;
  const ItemProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.push('/product-detail/${product.id}');

        // TODO: Ejempplo de como implementar analytics
        await FirebaseAnalytics.instance.logSelectItem(
          itemListName: product.title,
          itemListId: product.id,
          parameters: {
            'price': '${product.price}',
            'sku': '${product.sku}',
            'categories': '${product.categories}',
          },
        );

        // ** Por el momento se comenta para poseteriormente implementarlo
        // showModalBottomSheet<void>(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return SizedBox(
        //       height: 200,
        //       child: Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           mainAxisSize: MainAxisSize.min,
        //           children: <Widget>[
        //             const Text('Modal BottomSheet'),
        //             ElevatedButton(
        //               child: const Text('Close BottomSheet'),
        //               onPressed: () => Navigator.pop(context),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
      },
      child: Card(
        borderOnForeground: true,
        child: SizedBox(
          width: double.infinity,
          height: 150,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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
                    // Text(
                    //   '\$155.00',
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
      ),
    );
  }
}
