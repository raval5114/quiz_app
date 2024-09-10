import 'package:flutter/material.dart';
import 'package:quiz_app/Controller/HomePageController.dart';
import 'package:quiz_app/Controller/learn.dart';
import 'package:quiz_app/Controller/profileComponent.dart';
import 'package:quiz_app/Controller/testController.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: Colors.purple,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_online_outlined),
          backgroundColor: Colors.purple,
          label: 'Learn',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          backgroundColor: Colors.purple,
          label: 'Test', // Changed label to 'Test'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          backgroundColor: Colors.purple,
          label: 'Profile',
        ),
      ],
    );
  }
}
