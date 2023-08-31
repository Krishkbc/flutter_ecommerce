import 'package:flutter/material.dart';

import '../models/product_model.dart';

class cartProductCard extends StatelessWidget {
  const cartProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 90,
            width: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '${product.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
              const Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
            ],
          )
        ],
      ),
    );
  }
}
