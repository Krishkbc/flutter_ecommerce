import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/wishlist_model.dart';
import 'package:e_commerce/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc/wishlist_bloc/wishlist_bloc.dart';
import '../../widget/product_card.dart';
import '../../wishlist/bloc/wishlist_bloc.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WishListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'wishlist screen',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.2),
              itemCount: state.wishlist.products.length,
              itemBuilder: ((BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 120,
                    isWishlist: true,
                  ),
                );
              }),
            );
          } else {
            return const Text('something went wrong');
          }
        },
      ),
    );
  }
}
