import 'package:flutter/material.dart';
import 'package:quiz_app/Controller/ExpanionTile/expansionTile.dart';

class LearnComponent extends StatefulWidget {
  const LearnComponent({super.key});

  @override
  State<LearnComponent> createState() => _LearnComponentState();
}

class _LearnComponentState extends State<LearnComponent> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("data")],
    );
  }
}
