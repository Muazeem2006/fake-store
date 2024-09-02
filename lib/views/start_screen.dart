// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:fake_store/views/navpages/cart_screen.dart';
import 'package:fake_store/views/navpages/home_screen.dart';
import 'package:fake_store/views/navpages/users_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentIndex = 0;

  List<Widget> screenList = [
    HomeScreen(),
    CartScreen(),
    UsersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Home",
            activeIcon: Icon(
              Icons.grid_view_rounded,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            label: "Cart",
            activeIcon: Icon(
              Icons.shopify_rounded,
              color: Colors.purple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Users",
            activeIcon: Icon(
              Icons.person_2_rounded,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
