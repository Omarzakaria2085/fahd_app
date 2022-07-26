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
  20: {"delivery": "تغليف", "deliveryId": 1},
  21: {"delivery": "دون تغليف", "deliveryId": 2}
};
Map<int, Map> head = {
  30: {"head": "بدون رأس", "headId": 2},
  31: {"head": "سلخ", "headId": 4},
  32: {"head": "شلوطة", "headId": 5}
};

Map<int, String> productsUpdated = {
  1: "assets/23CD1691-B47E-4398-BEC6-97FE4751D028.jpeg",
  2: "assets/435D6E32-A1AB-443E-9F3E-50E327C59451.jpeg",
  12: "assets/sawakne.jpg",
  15: "assets/nagdy.jpg",
  16: "assets/hashy.jpg",
  17: "assets/teuos.jpg"
};
List<OrderItem> orderItems = [];
OrderUser orderUser;
