import 'dart:convert';
import 'package:rayan_app/models/order_item.dart';
import 'package:rayan_app/models/order_user.dart';

class NewOrder {
  OrderUser NewUser;
  List<OrderItem> newOrderItems;

  NewOrder({
    this.NewUser,
    this.newOrderItems,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NewUser': NewUser.toMap(),
      'NewOrderItems': newOrderItems.map((item) => item.toMap()).toList(),
    };
  }

  factory NewOrder.fromMap(Map<String, dynamic> map) {
    return NewOrder(
      NewUser: OrderUser.fromMap(map['NewUser']),
      newOrderItems: List<OrderItem>.from(
        map['NewOrderItems'].map((item) => OrderItem.fromMap(item)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewOrder.fromJson(String source) => NewOrder.fromMap(json.decode(source));
}
