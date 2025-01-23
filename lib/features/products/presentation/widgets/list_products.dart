import 'package:app_ventas/features/products/presentation/blocs/products/products_bloc.dart';
import 'package:app_ventas/features/products/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == ProductStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'An error occurred'),
          );
        } else if (state.status == ProductStatus.success) {
          if (state.products!.isEmpty) {
            return ProductNotDisponible();
          }

          return Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 20,
              right: 20,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: state.products!
                    .map((product) => ItemProduct(product: product))
                    .toList(),
              ),
            ),
          );
        }
        return Center(child: Text('Press to load'));
      },
    );
  }
}
