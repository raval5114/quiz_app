import 'package:flutter/material.dart';
import 'package:quiz_app/Controller/Auth/loginComponent.dart';
import 'package:quiz_app/Model/auth.dart';
import 'package:quiz_app/View/Auth/CreateAccount/namesAndDob.dart';
import 'package:quiz_app/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  authService.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginComponent(),
    );
  }
}
