import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(Cartloading()) {
    on<CartStarted>((event, emit) async {
      // TODO: implement event handler
      await Future<void>.delayed(Duration(seconds: 1));
      emit(Cartloaded());
    });

    on<CartProductAdded>(
      (event, emit) {
        if (state is Cartloaded) {
          emit(Cartloaded(
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..add(event.product))));
        }
      },
    );

    on<CartProductRemove>(
      (event, emit) {
        if (state is Cartloaded) {
          emit(Cartloaded(
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..remove(event.product))));
        }
      },
    );
  }
}
