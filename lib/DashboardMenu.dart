import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seller01/PendingOrders.dart';
import 'package:seller01/activeOrders.dart';
class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> with SingleTickerProviderStateMixin{
  
  bool isSwitched = false;
  bool isDrawerOpen=false;
  double screenwidth,screenheight;
  
  final Duration duration=const Duration(milliseconds:300);
  AnimationController _controller;
  Animation<double>_scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: duration);
    _scaleAnimation=Tween<double>(begin:1,end: 0.6 ).animate(_controller);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.only(top: 70, bottom: 30),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          IconButton(icon: Icon(Icons.account_circle), onPressed: null),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Welcome',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Seller name',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ])
        ]),
        Column(
          children: [
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      // Catalogue();
                    },
                    label: Text(
                      'Catalogue',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(Icons.shopping_cart, color: Colors.white))
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    //OrderHistory();
                  },
                  icon: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Order history',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
        Row(children: [
          SizedBox(width: 10),
          TextButton.icon(
            onPressed: () {
              //Settings();
            },
            icon: Icon(Icons.settings, color: Colors.white),
            label: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 2,
            height: 20,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ])
      ]),
    );
  }

  Widget dashboard(context) {
    print(isDrawerOpen);
    Size size=MediaQuery.of(context).size;
    screenheight=size.height;
    screenwidth=size.width;
    return AnimatedPositioned(
      duration: duration,
        top: 0,
        bottom: 0,
        left: isDrawerOpen?0.2*screenwidth:0,
        right: isDrawerOpen?-0.4*screenwidth:0,

          child: ScaleTransition(
            scale: _scaleAnimation,
                      child: Material(
              borderRadius:isDrawerOpen? BorderRadius.all(Radius.circular(40)):BorderRadius.all(Radius.circular(0.0)),
        elevation: 8,
        child: Container(
        
            child: Padding(
              padding: const EdgeInsets.only(left: 16,top: 20),
              child: Column(
                children: [
                  Container(

                      margin: EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isDrawerOpen?IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: (){
                                setState(() {
                                  isDrawerOpen=!isDrawerOpen;
                                  _controller.reverse();
                                  
                                });
                              }):
                          IconButton(icon: Icon(Icons.menu), onPressed: (){
                            setState(() {
                              isDrawerOpen=!isDrawerOpen;
                              _controller.forward();
                              
                            });
                          }),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10.0,0.0,5.0),
                            child: Column(
                                children: [
                                  Text('Seller name'),

                                  Switch(
                                      value: isSwitched,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitched=value;
                                        print(isSwitched);
                                      });
                                    },
                                    //activeTrackColor: Colors.lightGreenAccent,
                                    activeColor: Colors.green,
                                  )
                                ]
                            ),
                          ),
                          IconButton(icon: Icon(Icons.notifications_active), onPressed: null)
                        ],),
                    ),
                    Text('Pending Orders',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  CategoriesScroller(),  
                  ActiveOrders()
                ],
              ),
            ),
        ),
      ),
          ),
    );
  }
}
