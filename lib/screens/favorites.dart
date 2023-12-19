import 'package:flutter/material.dart';

class favorites extends StatefulWidget {
  const favorites({super.key});

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favourites",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 50),
        ),
      ),
    );
  }
}
