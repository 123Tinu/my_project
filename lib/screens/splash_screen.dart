import 'dart:async';
import 'package:flutter/material.dart';
import 'front_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FrontPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
              child: Image(
                  image: AssetImage("assets/images1/Shoekeeper_Logo.png"))),
          CircularProgressIndicator(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
