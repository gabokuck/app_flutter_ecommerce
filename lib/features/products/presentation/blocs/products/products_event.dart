part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends ProductsEvent {}

class LoadProductByIdEvent extends ProductsEvent {
  final String id;
  const LoadProductByIdEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class AddProductEvent extends ProductsEvent {
  final AddProductModel product;
  const AddProductEvent(this.product);
  @override
  List<Object?> get props => [product];
}

class UpdateProductEvent extends ProductsEvent {
  final AddProductModel product;
  const UpdateProductEvent(this.product);
  @override
  List<Object?> get props => [product];
}

class DeleteProductEvent extends ProductsEvent {
  final AddProductModel product;
  const DeleteProductEvent(this.product);
  @override
  List<Object?> get props => [product];
}

class SearchByCategoryEvent extends ProductsEvent {
  final String category;
  const SearchByCategoryEvent(this.category);
  @override
  List<Object?> get props => [category];
}

class SearchByQueryEvent extends ProductsEvent {
  final String query;
  const SearchByQueryEvent(this.query);
  @override
  List<Object?> get props => [query];
}
