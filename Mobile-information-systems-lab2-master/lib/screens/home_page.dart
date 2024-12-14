import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jokes/services/api_services.dart';

class MyHomePage extends StatefulWidget {
  final String navBarTitle;

  const MyHomePage({super.key, required this.navBarTitle});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> jokeTypes = [];

  String get navBarTitle => widget.navBarTitle;

  @override
  void initState() {
    super.initState();
    getJokeTypesAPI();
  }

  void getJokeTypesAPI() async {
    ApiService.getJokeTypesFromAPI().then((response) {
      var data = json.decode(response.body) as List<dynamic>;
      setState(() {
        jokeTypes = data.cast<String>();
      });
    }).catchError((error) {
      print('Error fetching joke types: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Light background color
      appBar: AppBar(
        backgroundColor: Colors.teal, // Teal color for AppBar
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/random_joke');
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
            size: 30, // Larger size for distinction
          ),
        ),
        title: Text(
          widget.navBarTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2, // Add some spacing for modern look
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded AppBar bottom
          ),
        ),
      ),
      body: jokeTypes.isEmpty
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.teal, // Match AppBar color
        ),
      )
          : ListView.builder(
        itemCount: jokeTypes.length,
        itemBuilder: (context, index) {
          String jokeType = jokeTypes[index];
          return Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              color: Colors.white, // Card color for contrast
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded edges
                side: BorderSide(
                  color: Colors.teal.shade300, // Border for style
                  width: 1,
                ),
              ),
              child: ListTile(
                title: Text(
                  "$jokeType Jokes",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.teal, // Text color to match theme
                  ),
                ),
                subtitle: Text(
                  "Tap to explore $jokeType jokes",
                  style: TextStyle(
                    color: Colors.grey[700], // Subtle subtitle color
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: jokeType,
                  );
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}