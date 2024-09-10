import 'package:flutter/material.dart';
import 'package:quiz_app/Controller/Auth/createPasswordComponent.dart';
import 'package:quiz_app/Controller/appLogo.dart';

class CreatepasswordPage extends StatefulWidget {
  const CreatepasswordPage({super.key});

  @override
  State<CreatepasswordPage> createState() => _CreatepasswordPageState();
}

class _CreatepasswordPageState extends State<CreatepasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: const Center(
          child: Column(
        children: [CreatepasswordComponent()],
      )),
    );
  }
}
