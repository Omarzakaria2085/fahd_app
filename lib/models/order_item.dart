import 'dart:convert';

class OrderItem {
  int itemId;
  int qty;
  double price;
  int sizeId;
  int cuttingId;
  int deliveryId;
  int headId;

  OrderItem({
    this.itemId,
    this.qty,
    this.price,
    this.sizeId,
    this.cuttingId,
    this.deliveryId,
    this.headId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'qty': qty,
      'price': price,
      'sizeId': sizeId,
      'cuttingId': cuttingId,
      'deliveryId': deliveryId,
      'headId': headId,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      itemId: map['itemId'],
      qty: map['qty'],
      price: map['price'],
      sizeId: map['sizeId'],
      cuttingId: map['cuttingId'],
      deliveryId: map['deliveryId'],
      headId: map['headId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => OrderItem.fromMap(json.decode(source));
}
