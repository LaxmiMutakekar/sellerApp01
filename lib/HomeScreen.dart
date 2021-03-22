import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sellerapp/categorySelector.dart';
import 'package:sellerapp/orders.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;
  bool isSwitched = false;
  bool isDrawerOpen=false;
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  @override
  void initState() {
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),


      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0)
      ),
      child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen?IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        setState(() {
                          xOffset=0;
                          yOffset=0;
                          scaleFactor=1;
                          isDrawerOpen=false;
                        });
                      }):
                  IconButton(icon: Icon(Icons.menu), onPressed: (){
                    setState(() {
                      xOffset=230;
                      yOffset=150;
                      scaleFactor=0.6;
                      isDrawerOpen=true;
                    });
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0,20.0,5.0,5.0),
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
                  IconButton(icon: Icon(Icons.account_circle), onPressed: null)
                ],),
            ),
            Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 200, 20),
                    child:
                    Text(
                      'Pending Orders',
                      style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right),
                  ),
                  CategoriesScroller(),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 220, 0),
                child:
                Text(
                  'Active Orders',
                  style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),),
                ],
              ),
            
            
            BodyLayout(),
          ]
      ),
    );
  }
}
class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx,int){
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.check_box_rounded),
                    trailing: Icon(Icons.timer),
                      title: Text('Order# $int'),
                      subtitle: Text('Description')),
                );
              },
            ),
    );
  }
}