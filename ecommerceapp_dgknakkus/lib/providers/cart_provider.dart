import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    return state.fold(0, (total, product) => total + product.price);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});