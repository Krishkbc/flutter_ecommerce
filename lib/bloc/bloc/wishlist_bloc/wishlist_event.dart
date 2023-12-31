part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  List<Object> get props => [];
}

class StartWishlist extends WishlistEvent {}

class AddWishlistProduct extends WishlistEvent {
  final Product product;
  const AddWishlistProduct(this.product);

  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvent {
  final Product product;
  const RemoveWishlistProduct(this.product);

  List<Object> get props => [product];
}
