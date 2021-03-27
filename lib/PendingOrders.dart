import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller01/models/orders.dart';
import 'package:http/http.dart' as http;

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();
  Future<List<Orders>> fetchItems(BuildContext context) async {
 
  final response = await http.get(Uri.parse("http://10.0.2.2:8080/orders/seller/1"));

  if (response.statusCode == 200) {
    return ordersFromJson(response.body);
  } else {
    throw Exception();
  }
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
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [

                                Text(
                                  '#00${item.oid}',
                                  style:
                                  TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(item.customer,style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item.seller,
                                  style:
                                    TextStyle(fontSize:15,color: Colors.white)),
                                ),
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:5),
                                        child: RaisedButton(
                                          hoverColor: Colors.blueGrey,
                                          onPressed: () {},
                                          color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius. circular(15)),
                                          child: Text("Accept",style:
                                            TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      SizedBox(
                                        width:5
                                      ),
                                      RaisedButton(
                                        hoverColor: Colors.blueGrey,
                                        onPressed: () {},
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius. circular(15)),
                                        child: Text("Reject",style:
                                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      ),
                                    ],
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