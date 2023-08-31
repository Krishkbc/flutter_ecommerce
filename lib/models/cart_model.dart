import 'package:e_commerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0;
    } else {
      return 10;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'you have free delivery';
    } else {
      double missing = 30.0 - subtotal;
      return '\$${missing.toStringAsFixed(2)} for FREE delivery';
    }
  }

  double total(subtotal, deliveryfee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString =>
      total(subtotal, freeDelivery(subtotal)).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);
}
