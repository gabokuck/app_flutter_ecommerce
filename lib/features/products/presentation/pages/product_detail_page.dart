import 'package:app_ventas/features/products/domain/domain.dart';
import 'package:app_ventas/features/products/presentation/presentation.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final String idProduct;
  const ProductDetailPage({super.key, required this.idProduct});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: getIt<ProductsBloc>()..add(LoadProductByIdEvent(idProduct)),
      builder: (context, state) {
        if (state.productStatus == ProductStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.productStatus == ProductStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'An error occurred'),
          );
        } else if (state.productStatus == ProductStatus.success) {
          if (state.product == null) {
            return ProductNotDisponible();
          }
        }

        final ProductEntity product = state.product ?? ProductEntity();

        return Scaffold(
          appBar: AppBar(
            title: Text('Detalle del producto'),
            centerTitle: true,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('-'),
                  ),
                  Text('1'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('+'),
                  ),
                  Expanded(
                      child: SizedBox(
                          height: 50,
                          // color: Colors.orange,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Agregar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
          ),
          body: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.3,
                child: product.imageUrls.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(0),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.detail ?? '',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
