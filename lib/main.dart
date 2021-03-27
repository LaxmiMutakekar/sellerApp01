import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
import 'package:seller01/DashboardMenu.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'seller app',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: MenuDashboard(),
>>>>>>> first commit
    );
  }
}
