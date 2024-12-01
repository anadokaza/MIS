import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import '../widgets/clothing_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ClothingItem> items = [
    ClothingItem(
        id: 1,
        name: "SEQUIN BERMUDA SHORTS",
        img: "https://static.zara.net/assets/public/1e24/882b/75ca4b2e9fba/79b623658c0b/09844610808-p/09844610808-p.jpg?ts=1732811269057&w=750",
        description: "fine coomplete look",
        price: 2000),
    ClothingItem(
        id: 2,
        name: "VELVET MIDI DRESS WITH JEWEL STRAPS",
        img: "https://static.zara.net/assets/public/083d/6419/55524ebe9c4f/b3784a960429/09671617800-p/09671617800-p.jpg?ts=1732819831733&w=750",
        description: "Straight-neckline dress with thin, beaded straps. Featuring a front vent at the hem and concealed zip fastening.",
        price: 1890),
    ClothingItem(
        id: 3,
        name: "BEAD HEART EARRINGS",
        img: "https://static.zara.net/assets/public/0dc9/6dbb/e7034a0393c6/cc19056218fb/01856007808-e1/01856007808-e1.jpg?ts=1732871890182&w=1024",
        description: "Metal maxi heart earrings with rhinestone appliqués in different sizes. Push-back and clip fastening.",
        price: 490),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "223056",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Georgia', // Different font style for the title
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900], // Dark blue AppBar
      ),
      body: Container(
        color: Colors.pink[800], // Dark pink background
        child: ClothingGrid(items: items),
      ),
    );
  }
}