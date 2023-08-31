import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/wishlist_model.dart';
import 'package:e_commerce/widget/carosuel.dart';
import 'package:e_commerce/widget/widgets.dart';
import 'package:e_commerce/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc/wishlist_bloc/wishlist_bloc.dart';
import '../../models/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.share),
              color: Colors.white,
            ),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(
                  iconSize: 30,
                  onPressed: () {
                    print('done');
                    context
                        .read<WishlistBloc>()
                        .add(AddWishlistProduct(product));
                  },
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {},
              child: const Text(
                'ADD TO CART',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              aspectRatio: 1.5,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: [
              HeroCarosuelCard(
                product: product,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '${product.price}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              children: [
                ListTile(
                  title: Text(
                    'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text(
                'Delivery Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              children: [
                ListTile(
                  title: Text(
                    'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry ',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
