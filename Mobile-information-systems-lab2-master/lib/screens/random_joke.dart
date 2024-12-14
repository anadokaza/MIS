import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/models/joke.dart';
import 'package:jokes/services/api_services.dart';

import '../widgets/details_container.dart';

class MyRandomJokePage extends StatefulWidget {
  const MyRandomJokePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyRandomPageState();
}

class _MyRandomPageState extends State<MyRandomJokePage> {
  Joke joke = Joke(type: "type", setup: "setup", punchline: "punchline", id: -1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadRandomJokeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        title: const Text(
          "Random Joke",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: joke.id == -1
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.orangeAccent, width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: DetailData(joke: joke),
          ),
        ),
      ),
    );
  }

  void loadRandomJokeApi() {
    ApiService.getRandomJokeFromAPI().then((response) {
      var data = json.decode(response.body);
      setState(() {
        joke = Joke.fromJson(data);
      });
    }).catchError((error) {
      print("Error fetching joke: $error");
    });
  }
}