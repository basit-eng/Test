part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class Productloadingstate extends ProductState {}

class Productloaddedstate extends ProductState {
  final List<Products> products;

  Productloaddedstate(this.products);
  @override
  List<Object> get props => [products];
}

class Producterrorstate extends ProductState {
  final String error;

  Producterrorstate(this.error);
  @override
  List<Object> get props => [error];
}
