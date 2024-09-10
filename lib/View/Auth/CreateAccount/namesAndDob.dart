import 'package:flutter/material.dart';
import 'package:quiz_app/Controller/Auth/createAccountCompoenent.dart';
import 'package:quiz_app/Controller/appLogo.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create an Account",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: SizedBox(
          width: 520,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CreateAccountComponent()],
          ),
        ),
      ),
    );
  }
}
