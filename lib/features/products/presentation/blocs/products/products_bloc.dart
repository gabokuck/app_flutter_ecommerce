import 'package:app_ventas/features/products/domain/entities/Product.dart';
import 'package:app_ventas/features/products/domain/usecases/get_list_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetListProducts getListProducts;

  ProductsBloc({required this.getListProducts}) : super(ProductsInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await getListProducts();
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });
  }
}
