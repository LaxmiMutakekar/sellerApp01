// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) => List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    this.orderId,
    this.genrDate,
    this.custName,
    this.custAddress,
    this.orderItems,
    this.orderStatus,
  });

  String orderId;
  String genrDate;
  String custName;
  String custAddress;
  List<OrderItem> orderItems;
  String orderStatus;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    orderId: json["Order_ID"],
    genrDate: json["Genr_Date"],
    custName: json["Cust_name"],
    custAddress: json["Cust_Address"],
    orderItems: List<OrderItem>.from(json["Order_Items"].map((x) => orderItemValues.map[x])),
    orderStatus: json["Order_status"],
  );

  Map<String, dynamic> toJson() => {
    "Order_ID": orderId,
    "Genr_Date": genrDate,
    "Cust_name": custName,
    "Cust_Address": custAddress,
    "Order_Items": List<dynamic>.from(orderItems.map((x) => orderItemValues.reverse[x])),
    "Order_status": orderStatus,
  };
}

enum OrderItem { PIZZA, FRENCH_FRIES, COCA_COLA, BUTTER_SCOTCH_ICE_C_REAM }

final orderItemValues = EnumValues({
  "Butter Scotch IceC ream": OrderItem.BUTTER_SCOTCH_ICE_C_REAM,
  "Coca Cola": OrderItem.COCA_COLA,
  "French Fries": OrderItem.FRENCH_FRIES,
  "Pizza": OrderItem.PIZZA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
