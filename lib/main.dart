import 'package:flutter/material.dart';
import 'drawer.dart';
import 'homeScreen.dart';

void main() {
  runApp(MaterialApp(home: SellerApp(),));
}

class SellerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
            //MyHomePage(),
          ]
      ),
    );
  }
}
