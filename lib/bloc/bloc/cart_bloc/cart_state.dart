part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];

  get cart => null;
}

class Cartloading extends CartState {
  @override
  List<Object> get props => [];
}

class Cartloaded extends CartState {
  final Cart cart;

  const Cartloaded({this.cart = const Cart()});
  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {}
