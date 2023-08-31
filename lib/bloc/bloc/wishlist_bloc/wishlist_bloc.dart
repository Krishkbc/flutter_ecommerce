import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
//   WishlistBloc() : super(WishlistLoading());
//   Stream<WishlistState> mapEventToState(
//     WishlistEvent event,
//   ) async* {
//     if (event is StartWishlist) {
//       yield* _mapStartWishListToState();
//     } else if (event is AddWishlistProduct) {
//       yield* _mapAddWishListToState(event, state);
//     } else if (event is RemoveWishlistProduct) {
//       yield* _mapRemoveWishListToState(event, state);
//     }
//   }

//   Stream<WishlistState> _mapStartWishListToState() async* {
//     yield WishlistLoading();
//     await Future<void>.delayed(Duration(seconds: 1));
//     yield const WishlistLoaded();
//   }

//   Stream<WishlistState> _mapAddWishListToState(
//       AddWishlistProduct event, WishlistState state) async* {
//     if (state is WishlistLoaded) {
//       yield WishlistLoaded(
//           wishlist: Wishlist(
//               products: List.from(state.wishlist.products)
//                 ..add(event.product)));
//     }
//   }

//   Stream<WishlistState> _mapRemoveWishListToState(
//       RemoveWishlistProduct event, WishlistState state) async* {
//     if (state is WishlistLoaded) {
//       yield WishlistLoaded(
//           wishlist: Wishlist(
//               products: List.from(state.wishlist.products)
//                 ..remove(event.product)));
//     }
//   }
// }

  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>((event, emit) async {
      // ignore: prefer_const_constructors
      await Future<void>.delayed(Duration(seconds: 1));
      emit(WishlistLoaded());
    });

    on<AddWishlistProduct>((event, emit) async {
      if (state is WishlistLoaded) {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..add(event.product))));
      }
    });

    on<RemoveWishlistProduct>((event, emit) {
      if (state is WishlistLoaded) {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..remove(event.product))));
      }
    });
  }
}
