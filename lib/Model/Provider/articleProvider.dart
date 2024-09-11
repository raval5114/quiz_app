import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/Model/Article.dart'; // Assuming you have the Document model here

class ArticleProvider with ChangeNotifier {
  Document? document;

  // Method to load document from JSON string
  void loadDocument(String jsonString) {
    try {
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      document = Document.fromJson(jsonData);
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading document: $e");
    }
  }

  // Method to update document directly
  void updateDocument(Document newDocument) {
    document = newDocument;
    notifyListeners();
  }
}

final articleProvider =
    ChangeNotifierProvider<ArticleProvider>((ref) => ArticleProvider());
