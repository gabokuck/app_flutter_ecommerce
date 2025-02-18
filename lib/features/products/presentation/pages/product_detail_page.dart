import 'package:app_ventas/features/products/presentation/presentation.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final String idProduct;
  const ProductDetailPage({super.key, required this.idProduct});

  @override
  Widget build(BuildContext context) {
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
        return Scaffold(
          appBar: AppBar(
            title: Text(state.product?.title ?? ''),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Text('Product Detail Page ${state.product?.title ?? ''}'),
                Text('Product Detail Page'),
              ],
            ),
          ),
        );
      },
    );
  }
}
