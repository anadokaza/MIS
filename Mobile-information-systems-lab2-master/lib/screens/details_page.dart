import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';

import '../services/api_services.dart';
import '../widgets/details_container.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsState();
}

class _DetailsState extends State<MyDetailsPage> {
  String type = "";
  List<Joke> jokes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    type = arguments.toString();
    if (type.isNotEmpty) {
      getJokeFromCertainType(type);
    }
  }

  void getJokeFromCertainType(String type) async {
    ApiService.getAbilitiesForPokemon(type).then((response) {
      var data = List.from(json.decode(response.body));
      setState(() {
        jokes = data.asMap().entries.map((element) {
          return Joke.fromJson(element.value);
        }).toList();
      });
    }).catchError((error) {
      print("Error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Unique background color
      appBar: AppBar(
        title: const Text(
          "Jokes",
          style: TextStyle(fontFamily: 'RobotoMono', fontSize: 22), // Custom font and size
        ),
        backgroundColor: Colors.deepPurple, // Distinct AppBar color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25), // Rounded AppBar
          ),
        ),
      ),
      body: jokes.isEmpty
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple, // Match the AppBar color
        ),
      )
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4,
              color: Colors.white, // Card background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded edges for cards
              ),
              child: DetailData(
                joke: jokes[index],
              ),
            ),
          );
        },
      ),
    );
  }
}