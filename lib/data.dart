import 'package:rayan_app/models/order_item.dart';
import 'package:rayan_app/models/order_user.dart';

class Product {
  String name, price, photoPath;
  Product({this.name, this.price, this.photoPath});
}

Map<int, String> size = {
  1: "جذع ناهي 30 كيلو",
  2: "هرفي صغير 15 كيلو",
  3: "هرفي وسط 18 كيلو",
  4: "جذع وسط 22 كيلو",
  5: "جذع وسط 25 كيلو",
  6: "جذع وسط 28 كيلو",
  13: "ربع حاشي 20 كيلو",
  14: "نصف حاشي 40 كيلو",
  15: "حاشي كامل 80 كيلو",
  16: "تيس لباني 9 كيلو",
  17: "تيس وسط 12 كيلو",
  18: "تيس كبير 15 كيلو"
};

Map<int, Map> noemeSizes = {
  1: {"size": size[2], "price": 1200.00, "sizeId": 2},
  2: {"size": size[3], "price": 1300.00, "sizeId": 3},
  3: {"size": size[5], "price": 1500.00, "sizeId": 5},
  4: {"size": size[1], "price": 1650.00, "sizeId": 1},
};

Map<int, Map> hrySizes = {
  1: {"size": size[2], "price": 1150.00, "sizeId": 2},
  2: {"size": size[3], "price": 1250.00, "sizeId": 3},
  3: {"size": size[4], "price": 1350.00, "sizeId": 4},
  4: {"size": size[5], "price": 1450.00, "sizeId": 5},
  5: {"size": size[1], "price": 1600.00, "sizeId": 1},
};
Map<int, Map> sawakneSizes = {
  1: {"size": size[4], "price": 1200.00, "sizeId": 4},
  2: {"size": size[6], "price": 1400.00, "sizeId": 6},
};

Map<int, Map> nagdySizes = {
  1: {"size": size[2], "price": 1250.00, "sizeId": 2},
  2: {"size": size[3], "price": 1350.00, "sizeId": 3},
  3: {"size": size[4], "price": 1450.00, "sizeId": 4},
  4: {"size": size[5], "price": 1550.00, "sizeId": 5},
  5: {"size": size[1], "price": 1700.00, "sizeId": 1},
};
Map<int, Map> hashySizes = {
  1: {"size": size[13], "price": 1250.00, "sizeId": 13},
  2: {"size": size[14], "price": 2500.00, "sizeId": 14},
  3: {"size": size[15], "price": 5000.00, "sizeId": 15},
};
Map<int, Map> teuosSizes = {
  1: {"size": size[16], "price": 950.00, "sizeId": 16},
  2: {"size": size[17], "price": 1050.00, "sizeId": 17},
  3: {"size": size[18], "price": 1150.00, "sizeId": 18},
};

Map<int, Map> cutting = {
  11: {"cutting": "ثلاجة", "cuttingId": 11},
  12: {"cutting": "تقطيع اثمان", "cuttingId": 12},
  13: {"cutting": "تفصيل عادي", "cuttingId": 13},
  14: {"cutting": "تفصيل حضرمي", "cuttingId": 14},
  15: {"cutting": "ارباع - اربع قطع", "cuttingId": 15},
  16: {"cutting": "مفطح", "cuttingId": 16},
  17: {"cutting": "غوزي - كامل", "cuttingId": 17},
  18: {"cutting": "انصاف", "cuttingId": 18}
};

Map<int, Map> delivery = {
  1: {"delivery": "تغليف", "deliveryId": 1},
  2: {"delivery": "دون تغليف", "deliveryId": 2}
};
Map<int, Map> head = {
  2: {"head": "بدون رأس", "headId": 2},
  4: {"head": "سلخ", "headId": 4},
  5: {"head": "شلوطة", "headId": 5}
};

Map<int, int> price = {1: 1750, 2: 1850, 3: 2000, 4: 1700, 5: 1750, 6: 1900};

List<Product> products = [
  new Product(
      name: "نعيمي",
      price: "1750",
      photoPath: "assets/23CD1691-B47E-4398-BEC6-97FE4751D028.jpeg"),
  new Product(
      name: "حري",
      price: "1700",
      photoPath: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg"),
  new Product(
      name: "حري",
      price: "1700",
      photoPath: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg"),
  new Product(
      name: "حري",
      price: "1700",
      photoPath: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg"),
  new Product(
      name: "حري",
      price: "1700",
      photoPath: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg"),
  new Product(
      name: "حري",
      price: "1700",
      photoPath: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg")
];

Map<int, String> productsUpdated = {
  1: "assets/23CD1691-B47E-4398-BEC6-97FE4751D028.jpeg",
  2: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg",
  12: "sawakne.jpg",
  15: "nagdy.jpg",
  16: "hashy.jpg",
  17: "teuos.jpg"
};
List<OrderItem> orderItems = [];
OrderUser orderUser;

/*
Map <String,int> sizesPrice{
"جذع ناهي 30 كيلو"     ,
"هرفي صغير 15 كيلو"    ,
"هرفي وسط 18 كيلو"     ,
"جذع وسط 22 كيلو"      ,
"جذع وسط 25 كيلو"      ,
"جذع وسط 28 كيلو"      ,
 "ربع حاشي 20 كيلو"    ,
 "نصف حاشي 40 كيلو"    ,
 "حاشي كامل 80 كيلو"   ,
 "تيس لباني 9 كيلو"    ,
 "تيس وسط 12 كيلو"     ,
 "تيس كبير 15 كيلو"
 }

  Map<int, Map> ItemSize = {
  1: "جذع ناهي 30 كيلو",
  2: "هرفي صغير 15 كيلو",
  3: "هرفي وسط 18 كيلو",
  4: "جذع وسط 22 كيلو",
  5: "جذع وسط 25 كيلو",
  6: "جذع وسط 28 كيلو",
  13: "ربع حاشي 20 كيلو",
  14: "نصف حاشي 40 كيلو",
  15: "حاشي كامل 80 كيلو",
  16: "تيس لباني 9 كيلو",
  17: "تيس وسط 12 كيلو",
  18: "تيس كبير 15 كيلو"
};
 {  
1	  1	  1	  1650.00
2	  1	  5	  1500.00
6	  1	  2	  1200.00
8	  1	  3	  1300.00
9	  2	  1	  1600.00
10	2	  4	  1350.00
11	2	  5	  1450.00
12	2	  2	  1150.00
13	2	  3	  1250.00
14	12	4	  1200.00
15	12	6	  1400.00
17	15	1	  1700.00
18	15	4	  1450.00
19	15	5	  1550.00
20	15	2	  1250.00
21	15	3	  1350.00
24	16	15	5000.00
25	16	13	1250.00
26	16	14	2500.00
27	17	18	1150.00
29	17	16	950.00
30	17	17	1050.00
 }
 */