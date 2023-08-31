part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  final Wishlist wishlist;
  const WishlistState({this.wishlist = const Wishlist()});

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;
  const WishlistLoaded({this.wishlist = const Wishlist()});

  // this is a getter override
  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {}
