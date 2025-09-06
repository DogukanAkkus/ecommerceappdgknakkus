import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import '../widgets/footer_navbar.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_chips.dart';
import '../widgets/banner_carousel.dart';
import 'discover_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const DiscoverScreen(),
      const CartScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _currentIndex == 0
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: const Text(
                'Ana Sayfa',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    // Bildirimler sayfasına yönlendirme
                  },
                ),
              ],
            )
          : null,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: FooterNavbar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(),
          SizedBox(height: 8),
          BannerCarousel(),
          SizedBox(height: 16),
          CategoryChips(),
          SizedBox(height: 16),
          _FeaturedProductsHeader(),
          ProductsGrid(),
          SizedBox(height: 20), // Alt boşluk için
        ],
      ),
    );
  }
}

class _FeaturedProductsHeader extends StatelessWidget {
  const _FeaturedProductsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Öne Çıkan Ürünler",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: () {
              // Tüm ürünler sayfasına yönlendirme
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            child: const Text(
              "Tümünü Gör",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Product>>(
      future: ApiService.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _LoadingGrid();
        }
        
        if (snapshot.hasError) {
          return _ErrorWidget(error: snapshot.error.toString());
        }
        
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const _EmptyWidget();
        }

        final products = snapshot.data!;
        return _ProductGrid(products: products);
      },
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid({required this.products});
  
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65, // Düzeltme: 0.75'ten 0.65'e düşürüldü
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class _LoadingGrid extends StatelessWidget {
  const _LoadingGrid();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.orange,
            ),
            SizedBox(height: 16),
            Text(
              'Ürünler yükleniyor...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.error});
  
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Bir hata oluştu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.length > 100 ? '${error.substring(0, 100)}...' : error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Sayfayı yeniden yükle
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Henüz ürün bulunmuyor',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Yakında yeni ürünler eklenecek!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}