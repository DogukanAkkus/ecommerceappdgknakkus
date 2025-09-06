import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorilerim'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: const Center(
        child: Text('Favorilerim Sayfası'),
      ),
    );
  }
}