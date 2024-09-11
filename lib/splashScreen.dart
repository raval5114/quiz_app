import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/Model/Provider/articleProvider.dart';
import 'package:quiz_app/Model/const.dart';
import 'package:quiz_app/View/homepage.dart';

class Splashscreen extends ConsumerStatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends ConsumerState<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Ensure the data loading happens after the initial build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDataAndNavigate();
    });
  }

  Future<void> _loadDataAndNavigate() async {
    // Use ref.read to read the provider and load the document
    final articleProviderInstance = ref.read(articleProvider);

    // Load the documents from the articleProvider
    articleProviderInstance.loadDocument(articles);

    // Debug print the loaded section once the document is available
    // Make sure to check if the document is null
    final document = articleProviderInstance.document;
    if (document != null && document.sections.isNotEmpty) {
      debugPrint(
          "Article: provider added: ${document.sections[0].mainHeading}");
    } else {
      debugPrint("Article: document or sections are empty");
    }

    // Navigate to HomePage after loading
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Text(
          "Quiz App",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}
