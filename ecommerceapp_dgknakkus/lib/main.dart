import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'models/product_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı kaldırıldı
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/product_detail': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductDetailScreen(product: product);
        },
        '/profile': (context) => const ProfileScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}