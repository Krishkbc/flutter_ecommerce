import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widget/carosuel.dart';
import '../../widget/product_carosuel.dart';
import '../../widget/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'unicorn',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: Category.catagories
                    .map((Category) => HeroCarosuelCard(category: Category))
                    .toList(),
              ),
            ),
            const SectionTitle(title: 'Recommended'),
            ProductCarosuel(
              products: Product.products
                  .where((product) => product.isReccomended)
                  .toList(),
            ),
            const SectionTitle(title: 'isPopular'),
            ProductCarosuel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
