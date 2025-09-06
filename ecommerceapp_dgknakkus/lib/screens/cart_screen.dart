import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final totalPrice = cartNotifier.totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: [
          if (cartItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
  final cartNotifier = ref.read(cartProvider.notifier);
  if (cartNotifier is CartNotifier) {
    cartNotifier.clearCart();
  }
},
            ),
        ],
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text("Sepetinizde ürün bulunmamaktadır", 
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 16),
                  Text("Alışverişe devam etmek için ürünleri inceleyebilirsiniz", 
                      style: TextStyle(fontSize: 14, color: Colors.grey), 
                      textAlign: TextAlign.center),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return CartItemWidget(
                        product: product,
                        onRemove: () => cartNotifier.removeFromCart(product),
                        onQuantityChange: (quantity) {
                          // Miktar değişimi için işlev
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Ara Toplam:", style: TextStyle(fontSize: 16)),
                          Text("\$${totalPrice.toStringAsFixed(2)}", 
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Kargo:", style: TextStyle(fontSize: 16)),
                          Text(
                            totalPrice > 100 ? "Ücretsiz" : "\$10.00",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Toplam:", 
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            "\$${(totalPrice > 100 ? totalPrice : totalPrice + 10).toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.orange),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Satın Al",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
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