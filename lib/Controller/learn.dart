import 'package:flutter/material.dart';

class LearnComponent extends StatefulWidget {
  const LearnComponent({super.key});

  @override
  State<LearnComponent> createState() => _LearnComponentState();
}

class _LearnComponentState extends State<LearnComponent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Things to learn"),
    );
  }
}
