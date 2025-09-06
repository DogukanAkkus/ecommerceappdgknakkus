import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart'; // CartScreen'i import ettik

class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("Ürün Detayı", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Hero(
                          tag: product.id,
                          child: Image.network(
                            product.image,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange[50],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange, size: 16),
                                  SizedBox(width: 4),
                                  Text("4.8", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text("125 Değerlendirme", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Ürün Açıklaması",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: const TextStyle(color: Colors.grey, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Satıcı Bilgileri",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.store, color: Colors.blue),
                          title: Text("DGKNAKKUS MAĞAZASI"),
                          subtitle: Text("%98 Olumlu Değerlendirme"),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Benzer Ürünler",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        // Buraya benzer ürünler listesi eklenecek
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Sepete eklendi!")),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: const Text("Sepete Ekle"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addToCart(product);
                        // Navigator.pushNamed yerine doğrudan MaterialPageRoute kullanıyoruz
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CartScreen()),
                        );
                      },
                      icon: const Icon(Icons.flash_on),
                      label: const Text("Hemen Al"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}