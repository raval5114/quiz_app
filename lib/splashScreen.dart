import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/View/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 104, 173),
      body: Center(
        child: Text(
          "Title",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}
