import 'package:app_ventas/config/config.dart';
import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/products/products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final RouterCubit routerCubit;
  final GetListProducts getListProducts;
  final GetProductById getProductById;
  final AddProduct addProduct;
  final SearchByCategory searchByCategory;
  final SearchByQuery searchByQuery;

  ProductsBloc({
    required this.searchByCategory,
    required this.addProduct,
    required this.getListProducts,
    required this.getProductById,
    required this.routerCubit,
    required this.searchByQuery,
  }) : super(ProductsState()) {
    on<LoadProductsEvent>(_loadListProductsEvent);
    on<AddProductEvent>(_addProductEvent);
    on<UpdateProductEvent>(_updateProductEvent);
    on<DeleteProductEvent>(_deleteProductEvent);
    on<SearchByCategoryEvent>(_searchByCategoryEvent);
    on<SearchByQueryEvent>(_searchByQueryEvent);
    on<LoadProductByIdEvent>(_loadProductByIdEvent);
  }

  Future<void> _loadListProductsEvent(
      LoadProductsEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ListProductStatus.loading));
    try {
      final products = await getListProducts();
      emit(state.copyWith(
          status: ListProductStatus.success, products: products));
    } catch (e) {
      emit(state.copyWith(
        status: ListProductStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _loadProductByIdEvent(
      LoadProductByIdEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(productStatus: ProductStatus.loading));
    try {
      final product = await getProductById(event.id);
      emit(state.copyWith(
          productStatus: ProductStatus.success, product: product));
    } catch (e) {
      emit(state.copyWith(
        productStatus: ProductStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _searchByCategoryEvent(
      SearchByCategoryEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ListProductStatus.loading));
    try {
      final products = await searchByCategory(event.category);
      emit(state.copyWith(
          status: ListProductStatus.success, products: products));
    } catch (e) {
      emit(state.copyWith(
        status: ListProductStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _searchByQueryEvent(
      SearchByQueryEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ListProductStatus.loading));
    try {
      final products = await searchByQuery(event.query);
      emit(state.copyWith(
          status: ListProductStatus.success, products: products));
    } catch (e) {
      emit(state.copyWith(
        status: ListProductStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _addProductEvent(
      AddProductEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ListProductStatus.loading));
    try {
      await addProduct(event.product);
      routerCubit.goToRouter(1);
      add(LoadProductsEvent());
    } catch (e) {
      if (e is AppNetworkException) {
        emit(state.copyWith(
            status: ListProductStatus.error, errorMessage: e.message));
      }
    }
  }

  Future<void> _updateProductEvent(
      UpdateProductEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ListProductStatus.loading));
    try {
      await addProduct(event.product);
      routerCubit.goToRouter(1);
      add(LoadProductsEvent());
    } catch (e) {
      if (e is AppNetworkException) {
        emit(state.copyWith(
            status: ListProductStatus.error, errorMessage: e.message));
      }
    }
  }

  Future<void> _deleteProductEvent(
      DeleteProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(state.copyWith(status: ListProductStatus.loading));
      // await _productsRepository.deleteProduct(event.product);
      emit(state.copyWith(status: ListProductStatus.success));
      await reloadProducts();
    } catch (e) {
      emit(state.copyWith(
        status: ListProductStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> reloadProducts() async {
    add(LoadProductsEvent());
  }

  Future<void> addProductEvent(AddProductModel product) async {
    add(AddProductEvent(product));
  }

  Future<void> updateProductEvent(AddProductModel product) async {
    add(UpdateProductEvent(product));
  }

  Future<void> deleteProductEvent(AddProductModel product) async {
    add(DeleteProductEvent(product));
  }
}
