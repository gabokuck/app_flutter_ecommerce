part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends ProductsEvent {}

class AddProductEvent extends ProductsEvent {
  final AddProductModel product;
  const AddProductEvent(this.product);
  @override
  List<Object?> get props => [product];
}
