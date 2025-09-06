import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      'https://via.placeholder.com/600x200?text=Kampanya+1',
      'https://via.placeholder.com/600x200?text=Kampanya+2',
      'https://via.placeholder.com/600x200?text=Kampanya+3',
    ];
    
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: banners.map((banner) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(banner),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}