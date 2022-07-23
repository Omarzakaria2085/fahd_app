import 'dart:convert';

class Item {
  int itemId;
  String itemName;
  double salesPrice;

  Item({
    this.itemId,
    this.itemName,
    this.salesPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'salesPrice': salesPrice,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map['itemId'] as int,
      itemName: map['itemName'] as String,
      salesPrice: map['salesPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
