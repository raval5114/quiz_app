import 'package:flutter/material.dart';
import 'package:quiz_app/Controller/HomePageController.dart';
import 'package:quiz_app/Controller/bottomNavbar/navBar.dart';
import 'package:quiz_app/Controller/learn.dart';
import 'package:quiz_app/Controller/profileComponent.dart';
import 'package:quiz_app/Controller/testController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List _pages = <Widget>[
    HomeScreen(),
    LearnComponent(),
    TestController(),
    ProfileComponent()
  ];
  void _ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(13)),
          width: 90,
          child: const Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.amberAccent,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("120"),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: _ontap,
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
      ),
    );
  }
}
