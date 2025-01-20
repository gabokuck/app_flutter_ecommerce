part of 'products_bloc.dart';

 enum ProductStatus {
  initial,
  loading,
  success,
  error,
}


 class ProductsState extends Equatable {

  final ProductStatus status;
  final String? errorMessage;
  final List<ProductEntity>? products;

  const ProductsState({
    this.status = ProductStatus.initial,
    this.errorMessage,
    this.products,
  });

  ProductsState copyWith({
    ProductStatus? status,
    String? errorMessage,
    List<ProductEntity>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, products];
}