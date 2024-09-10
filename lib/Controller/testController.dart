import 'package:flutter/material.dart';

class TestController extends StatefulWidget {
  const TestController({super.key});

  @override
  State<TestController> createState() => _TestControllerState();
}

class _TestControllerState extends State<TestController> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Test Component"),
    );
  }
}
