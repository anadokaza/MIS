import 'package:flutter/material.dart';
import '../models/clothing_item.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as ClothingItem;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Details"),
        ),
        body: Column(
          children: [
            Image.network(
              item.img,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('#${item.id}', style: const TextStyle(fontSize: 20),),
                  const SizedBox(width: 8),
                  Text(item.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item.price} Denari', style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 8),
                  Text(item.description, style: const TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ],
        )
    );
  }
}