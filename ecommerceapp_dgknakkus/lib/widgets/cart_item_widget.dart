import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final Function() onRemove;
  final Function(int)? onQuantityChange;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.onRemove,
    this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
                  onPressed: () {},
                ),
                const Text("1", style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.orange),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}