import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller01/models/orders.dart';
import 'package:http/http.dart' as http;

class ActiveOrders extends StatelessWidget {
  const ActiveOrders();
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
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 5),
            height: 400,
            child: FutureBuilder(
            
              future: fetchItems(context),
              builder: (context,snapshot){
                if (snapshot.hasData){
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,int index){
                      Orders item=snapshot.data[index];
                      return Card(
                        color: Colors.grey[600],
                        shadowColor: Colors.black,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [

                                Text(
                                  item.source,
                                  style:
                                  TextStyle(fontSize: 20.0,color: Colors.white),
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item.seller,
                                  style:
                                    TextStyle(fontSize:15,color: Colors.white)),
                                ),
                                
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