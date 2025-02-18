part of 'products_bloc.dart';

enum ListProductStatus {
  initial,
  loading,
  success,
  error,
}

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
  final ListProductStatus status;
  final SearchStatus searchStatus;
  final ProductStatus productStatus;
  final String? errorMessage;
  final List<ProductEntity>? products;
  final ProductEntity? product;
  final List<ProductEntity>? searchProducts;

  const ProductsState(
      {this.status = ListProductStatus.initial,
      this.searchStatus = SearchStatus.initial,
      this.productStatus = ProductStatus.initial,
      this.errorMessage,
      this.products,
      this.product,
      this.searchProducts});

  ProductsState copyWith({
    ListProductStatus? status,
    SearchStatus? searchStatus,
    ProductStatus? productStatus,
    String? errorMessage,
    List<ProductEntity>? products,
    ProductEntity? product,
    List<ProductEntity>? searchProducts,
  }) {
    return ProductsState(
      status: status ?? this.status,
      searchStatus: searchStatus ?? this.searchStatus,
      productStatus: productStatus ?? this.productStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      product: product ?? this.product,
      searchProducts: searchProducts ?? this.searchProducts,
    );
  }

  @override
  List<Object?> get props => [
        status,
        searchStatus,
        productStatus,
        errorMessage,
        products,
        product,
        searchProducts
      ];
}
