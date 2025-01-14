import 'package:app_ventas/config/config.dart';
import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/products/products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetListProducts getListProducts;
  final AddProduct addProduct;
  final RouterCubit routerCubit;

  ProductsBloc(
      {required this.addProduct,
      required this.getListProducts,
      required this.routerCubit})
      : super(ProductsInitial()) {
    on<LoadProductsEvent>(_loadListProductsEvent);
    on<AddProductEvent>(_addProductEvent);
  }

  Future<void> _loadListProductsEvent(
      LoadProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await getListProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  Future<void> _addProductEvent(
      AddProductEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      await addProduct(event.product);
      routerCubit.goToHome(1);
      add(LoadProductsEvent());
    } catch (e) {
      if (e is AppNetworkException) {
        emit(ProductsError(e.message));
      }
    }
  }
}
