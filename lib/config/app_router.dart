import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/screens/cart/cart_screens.dart';
import 'package:e_commerce/screens/product/product.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/catalogue/catalogue.dart';
import '../screens/home/home_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    print('route is ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case SplashScreen.routeName:
        return SplashScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      case CatalogueScreen.routeName:
        return CatalogueScreen.route(category: settings.arguments as Category);

      case WishListScreen.routeName:
        return WishListScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('error'),
              ),
            ));
  }
}
