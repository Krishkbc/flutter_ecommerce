import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_card.dart';

class ProductCarosuel extends StatelessWidget {
  final List<Product> products;
  const ProductCarosuel({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: Product.products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ProductCard(product: Product.products[index]),
          );
        },
      ),
    );
  }
}
