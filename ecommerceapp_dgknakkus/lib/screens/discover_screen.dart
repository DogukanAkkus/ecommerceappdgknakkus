import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keşfet'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: const Center(
        child: Text('Keşfet Sayfası'),
      ),
    );
  }
}