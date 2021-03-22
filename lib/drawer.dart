import 'package:flutter/material.dart';
//import 'package:vertical/orders.dart/catalogue.dart';
//import 'package:vertical/orderHistory.dart';
//import 'settings.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.only(top:70, bottom: 30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children:[
                  IconButton(icon: Icon(Icons.account_circle), onPressed: null),
                  SizedBox(width: 10,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('Welcome', style: TextStyle(color: Colors.white),),
                        Text('Seller name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ])
                ]
            ),


            Column(

              children: [
                Row(
                  children: [
                    TextButton.icon(onPressed: (){
                     // Catalogue();
                    },
                        label: Text('Catalogue', style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.shopping_cart, color: Colors.white))
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(onPressed: (){
                      //OrderHistory();
                    },
                      icon: Icon(Icons.history, color: Colors.white,),
                      label: Text('Order history', style: TextStyle(color: Colors.white),),
                    )],
                ),
              ],
            ),


            Row(

                children:[
                  SizedBox(width:10),
                  TextButton.icon(onPressed: (){
                    //Settings();
                  },
                    icon: Icon(Icons.settings, color: Colors.white),
                    label: Text('Settings', style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width:10),
                  Container(width:2, height:20, color: Colors.white,),
                  SizedBox(width:10),
                  Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ]
            )
          ]
      ),
    );
  }
}