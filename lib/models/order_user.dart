import 'dart:convert';

class OrderUser {
  String userName;
  String city;
  String address;
  String phone;
  int payId;

  OrderUser({
    this.userName,
    this.city,
    this.address,
    this.phone,
    this.payId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'city': city,
      'address': address,
      'phone': phone,
      'payId': payId,
    };
  }

  factory OrderUser.fromMap(Map<String, dynamic> map) {
    return OrderUser(
      userName: map['userName'],
      city: map['city'],
      address: map['address'],
      phone: map['phone'],
      payId: map['payId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderUser.fromJson(String source) => OrderUser.fromMap(json.decode(source));
}
