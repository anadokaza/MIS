import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import 'clothing_card.dart';

class ClothingGrid extends StatefulWidget {
  final List<ClothingItem> items;

  const ClothingGrid({super.key, required this.items});

  @override
  State<ClothingGrid> createState() => _ClothingGridState();
}

class _ClothingGridState extends State<ClothingGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: widget.items.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ClothingCard(item: widget.items[index]);
      },
    );
  }
}