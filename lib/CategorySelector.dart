import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:vertical/categorySelector.dart';
import 'package:seller01/orders.dart';
class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();
  Future<List<Orders>> fetchItems (BuildContext context) async{
    final jsonString=await DefaultAssetBundle.of(context).loadString('assets/orders.json');
    return ordersFromJson(jsonString);
  }
  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 20),
            height: 150,
            decoration: BoxDecoration(color: Colors.white),
            child: FutureBuilder(
              future: fetchItems(context),
              builder: (context,snapshot){
                if (snapshot.hasData){
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,int index){
                      Orders item=snapshot.data[index];
                      return Card(
                        color: Colors.blueGrey,
                        shadowColor: Colors.black,
                        child: Container(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [

                                Text(
                                  item.orderId,
                                  style:
                                  TextStyle(fontSize: 20.0,color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(item.genrDate,style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item.custName,
                                  style:
                                    TextStyle(fontSize:15,color: Colors.white)),
                                ),
                                Container(
                                  width: 80,
                                  child: RaisedButton(
                                    hoverColor: Colors.blueGrey,
                                    onPressed: () {},
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius. circular(20)),
                                    child: Text("Accept",style:
                                      TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
      ),

        ],
      ),
    );
  }
}