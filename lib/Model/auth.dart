import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:quiz_app/Model/const.dart';

class AuthService {
  final String uri;
  final String dname;
  Db? _db;
  static const String collectionLoginName = "Users";

  AuthService({required this.uri, required this.dname});

  Future<void> connect() async {
    try {
      _db = await Db.create(uri);
      await _db?.open();
      debugPrint('Connected to MongoDB');
    } catch (e) {
      debugPrint("Error connecting to MongoDB: $e");
    }
  }

  Future<DbCollection> getCollection(String collectionName) async {
    if (_db == null || !_db!.isConnected) {
      await connect();
    }
    return _db!.collection(collectionName);
  }

  Future<Map<String, dynamic>?> findUser(String email) async {
    try {
      final collection = await getCollection(collectionLoginName);
      return await collection.findOne(where.eq('email', email));
    } catch (e) {
      debugPrint("Error finding user: $e");
      return null;
    }
  }

  Future<bool> insertRecord(
      Map<String, dynamic> record, String collectionRecordsName) async {
    try {
      final collection = await getCollection(collectionRecordsName);
      await collection.insert(record);
      debugPrint("Record inserted successfully: $record");
      return true;
    } catch (e) {
      debugPrint("Error inserting record: $e");
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> retrieveRecords(
      String collectionName) async {
    try {
      final collection = await getCollection(collectionName);
      final records = await collection.find().toList();
      return records.map((record) => record).toList();
    } catch (e) {
      debugPrint("Error retrieving records: $e");
      return [];
    }
  }

  Future<bool> authenticateUser(String email, String password) async {
    try {
      final user = await findUser(email);
      if (user == null) {
        debugPrint("User not found with email: $email");
        return false;
      }

      final hashedInputPassword = hashPassword(password);
      final storedPassword = user['password'] ?? '';

      debugPrint("Hashed input password: $hashedInputPassword");
      debugPrint("Stored password: $storedPassword");

      return hashedInputPassword == storedPassword;
    } catch (e) {
      debugPrint("Error authenticating user: $e");
      return false;
    }
  }

  Future<bool> registerUser(String firstName, String lastName, String email,
      String dob, String password) async {
    try {
      final existingUser = await findUser(email);
      if (existingUser != null) {
        debugPrint("User already exists with email: $email");
        return false;
      }
      final hashedPassword = hashPassword(password);
      debugPrint("Hashed Password during registration: $hashedPassword");

      final collection = await getCollection(collectionLoginName);
      await collection.insert({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'dob': dob,
        'password': hashedPassword,
      });
      debugPrint("User registered successfully with email: $email");
      return true;
    } catch (e) {
      debugPrint("Error registering user: $e");
      return false;
    }
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      final user = await findUser(email);
      if (user == null) {
        debugPrint("Authentication failed: User not found with email: $email");
        return null;
      }

      final hashedInputPassword = hashPassword(password);
      debugPrint("Hashed input password during login: $hashedInputPassword");
      debugPrint("Stored password in DB: ${user['password']}");

      if (hashedInputPassword == user['password']) {
        debugPrint("User logged in successfully: $email");
        return {
          'firstName': user['firstName'],
          'lastName': user['lastName'],
          'dob': user['dob'],
          'email': user['email'],
        };
      } else {
        debugPrint(
            "Authentication failed: Incorrect password for email: $email");
        return null;
      }
    } catch (e) {
      debugPrint("Error during login: $e");
      return null;
    }
  }

  String hashPassword(String password) {
    final trimmedPassword = password.trim();
    final bytes = utf8.encode(trimmedPassword);
    final hashPassword = sha256.convert(bytes);
    return hashPassword.toString();
  }
}

final authService = AuthService(uri: MONGO_URL, dname: 'QuizApp');
