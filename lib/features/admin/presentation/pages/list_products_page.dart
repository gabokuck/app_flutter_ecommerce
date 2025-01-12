import 'package:app_ventas/features/admin/admin.dart';
import 'package:app_ventas/features/products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductsPage extends StatelessWidget {
  const ListProductsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFloatingActionButtonWidget(
          onPressed: () {
//             {
//   "title": "Torta de pollo",
//   "sku": "474908",
//   "price": 50,
//   "ingredients": "Milanesa",
//   "detail": "Torta de Milanesa",
//   "points": 1,
//   "stock": 5,
//   "categories": [
//     "tortas"
//   ]
// }
            context.read<ProductsBloc>().add(AddProductEvent(ProductEntity(
                  title: 'Torta de pollo 2',
                  sku: '474909',
                  price: 50,
                  ingredients: '2 pollos',
                  detail: 'torta de pollo 2',
                  stock: 30,
                  points: 1,
                  categories: ["tortas"],
                )));
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Lista de productos'),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is ProductsLoaded) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: state.products.map((product) {
                      return ItemProductAdmin(
                        product: product,
                      );
                    }).toList(),
                  ),
                ),
              );
            }
            return Center(child: Text('Press to load'));
          },
        ));
  }
}
