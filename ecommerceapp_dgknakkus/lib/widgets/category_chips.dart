import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Tümü', 'Elektronik', 'Moda', 'Ev & Yaşam', 'Kozmetik', 'Spor', 'Kitap'
    ];
    
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: index == 0,
              onSelected: (selected) {},
              selectedColor: Colors.orange,
              labelStyle: TextStyle(
                color: index == 0 ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}