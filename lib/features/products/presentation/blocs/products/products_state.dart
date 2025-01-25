part of 'products_bloc.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  error,
}

enum SearchStatus {
  initial,
  loading,
  success,
  error,
}

class ProductsState extends Equatable {
  final ProductStatus status;
  final SearchStatus searchStatus;
  final String? errorMessage;
  final List<ProductEntity>? products;
  final List<ProductEntity>? searchProducts;

  const ProductsState(
      {this.status = ProductStatus.initial,
      this.searchStatus = SearchStatus.initial,
      this.errorMessage,
      this.products,
      this.searchProducts});

  ProductsState copyWith({
    ProductStatus? status,
    SearchStatus? searchStatus,
    String? errorMessage,
    List<ProductEntity>? products,
    List<ProductEntity>? searchProducts,
  }) {
    return ProductsState(
      status: status ?? this.status,
      searchStatus: searchStatus ?? this.searchStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      searchProducts: searchProducts ?? this.searchProducts,
    );
  }

  @override
  List<Object?> get props =>
      [status, searchStatus, errorMessage, products, searchProducts];
}
