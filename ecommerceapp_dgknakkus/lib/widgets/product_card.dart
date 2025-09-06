import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Overflow'u önlemek için eklendi
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      height: 140, // Yükseklik biraz azaltıldı
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 140,
                          color: Colors.grey[200],
                          child: const Icon(Icons.error_outline, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, size: 18),
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(4),
                      iconSize: 18, // Boyut küçültüldü
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "%20",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Overflow'u önlemek için eklendi
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13, // Font boyutu küçültüldü
                      height: 1.3, // Satır yüksekliği azaltıldı
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 15, // Font boyutu küçültüldü
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 14),
                      const SizedBox(width: 2),
                      const Text(
                        "4.8",
                        style: TextStyle(fontSize: 11), // Font boyutu küçültüldü
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(125)",
                        style: TextStyle(
                          fontSize: 11, // Font boyutu küçültüldü
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Ücretsiz Kargo",
                    style: TextStyle(
                      fontSize: 11, // Font boyutu küçültüldü
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}