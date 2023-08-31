import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/widget/product_card.dart';
import 'package:e_commerce/widget/widgets.dart';
import 'package:flutter/material.dart';
import '../../models/category_model.dart';

class CatalogueScreen extends StatelessWidget {
  static const String routeName = '/catelogue';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogueScreen(category: category),
    );
  }

  final Category category;
  const CatalogueScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products
        .where((Product) => Product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.1),
        itemCount: categoryProduct.length,
        itemBuilder: ((BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: categoryProduct[index],
              widthFactor: 2.2,
            ),
          );
        }),
      ),
    );
  }
}
