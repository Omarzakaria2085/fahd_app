import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as widget;
import 'package:rayan_app/components/appBar.dart';
import 'package:rayan_app/data.dart';
import 'package:rayan_app/main.dart';
import 'package:rayan_app/models/order_item.dart';

import 'final_page.dart';

class Sawakne extends StatefulWidget {
  @override
  _SawakneState createState() => _SawakneState();
}

class _SawakneState extends State<Sawakne> {
  dynamic _group1 = 51;
  dynamic _group2 = 52;
  dynamic _group3 = 53;
  dynamic _group4 = 54;
  int itemId = 12;
  int cuttingId, delievryId, sizeId, headId;
  int priceNow = 0;
  int quantity = 1;
  double finalPrice = 0;

  Widget myRadioListTile1(dynamic val) => RadioListTile(
        activeColor: Colors.white,
        value: val,
        groupValue: _group1,
        onChanged: (val) {
          setState(() {
            _group1 = val;
            sizeId = sawakneSizes[val]["sizeId"];
            priceNow = sawakneSizes[val]["price"];
            finalPrice = quantity * priceNow * 1.0;
          });
        },
        title: Text(
          sawakneSizes[val]["size"],
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget myRadioListTile2(dynamic val) => RadioListTile(
        activeColor: Colors.white,
        value: val,
        groupValue: _group2,
        onChanged: (val) {
          setState(() {
            _group2 = val;
            cuttingId = cutting[val]["cuttingId"];
          });
        },
        title: Text(
          cutting[val]["cutting"],
          style: TextStyle(color: Colors.white),
        ),
      );
  Widget myRadioListTile3(dynamic val) => RadioListTile(
        activeColor: Colors.white,
        value: val,
        groupValue: _group3,
        onChanged: (val) {
          setState(() {
            _group3 = val;
            delievryId = delivery[val]["deliveryId"];
          });
        },
        title: Text(
          delivery[val]["delivery"],
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget myRadioListTile4(dynamic val) => RadioListTile(
        activeColor: Colors.white,
        value: val,
        groupValue: _group4,
        onChanged: (val) {
          setState(() {
            _group4 = val;
            headId = head[val]["headId"];
          });
        },
        title: Text(
          head[val]["head"],
          style: TextStyle(color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: myAppBar(),
      body: ListView(
        children: [
          Card(
              color: Colors.lightBlue,
              child: Column(
                children: [
                  Image.asset(
                    productsUpdated[itemId],
                    width: 250,
                    height: 150,
                  ),
                  Text("عدد الذبائح",
                      style: TextStyle(color: Colors.white, fontSize: 35)),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                          heroTag: null,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              quantity += 1;
                              finalPrice = quantity * priceNow * 1.0;
                            });
                          },
                          child:
                              widget.Icon(Icons.add, color: Colors.lightBlue)),
                      SizedBox(width: 25),
                      Container(
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 25),
                      FloatingActionButton(
                          heroTag: null,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity -= 1;
                                finalPrice = quantity * priceNow * 1.0;
                              }
                            });
                          },
                          child: widget.Icon(Icons.minimize_sharp,
                              color: Colors.lightBlue)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                      "السعر النهائي : ${finalPrice == 0 ? "لم يحدد بعد" : finalPrice}",
                      style: TextStyle(color: Colors.white, fontSize: 35)),
                  SizedBox(height: 15),
                ],
              )),
          Card(
            color: Colors.lightBlue,
            child: Column(
              children: [
                Text("الانواع",
                    style: TextStyle(color: Colors.white, fontSize: 35)),
                myRadioListTile1(1),
                myRadioListTile1(2),
              ],
            ),
          ),
          Card(
            color: Colors.lightBlue,
            child: Column(
              children: [
                Text("التقطيع",
                    style: TextStyle(color: Colors.white, fontSize: 35)),
                myRadioListTile2(11),
                myRadioListTile2(12),
                myRadioListTile2(13),
                myRadioListTile2(14),
                myRadioListTile2(15),
                myRadioListTile2(16),
                myRadioListTile2(17),
              ],
            ),
          ),
          Card(
            color: Colors.lightBlue,
            child: Column(
              children: [
                Text("التجهيز",
                    style: TextStyle(color: Colors.white, fontSize: 35)),
                myRadioListTile3(20),
                myRadioListTile3(21),
              ],
            ),
          ),
          Card(
            color: Colors.lightBlue,
            child: Column(
              children: [
                Text("الرأس",
                    style: TextStyle(color: Colors.white, fontSize: 35)),
                myRadioListTile4(30),
                myRadioListTile4(31),
                myRadioListTile4(32),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue)),
                onPressed: () {
                  if ((_group1 == 1 || _group1 == 2) &
                      (_group2 == 11 ||
                          _group2 == 12 ||
                          _group2 == 13 ||
                          _group2 == 14 ||
                          _group2 == 15 ||
                          _group2 == 16 ||
                          _group2 == 17) &
                      (_group3 == 20 || _group3 == 21) &
                      (_group4 == 30 || _group4 == 31 || _group4 == 32)) {
                    OrderItem orderItem = OrderItem(
                        itemId: itemId,
                        qty: quantity,
                        price: finalPrice,
                        sizeId: sizeId,
                        cuttingId: cuttingId,
                        deliveryId: delievryId,
                        headId: headId);

                    orderItems.add(orderItem);

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              content: Container(
                                  child: Text("تم الاضافة الي عربة التسوق",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                      textAlign: TextAlign.center)));
                        });

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) =>
                            ProjectApp(selectedPage: 0)));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              content: Container(
                                  child: Text("اكمل باقي البيانات رجاءا",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                      textAlign: TextAlign.center)));
                        });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("اضافة الي سلة المشتريات",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue)),
                onPressed: () {
                  if ((_group1 == 1 || _group1 == 2) &
                      (_group2 == 11 ||
                          _group2 == 12 ||
                          _group2 == 13 ||
                          _group2 == 14 ||
                          _group2 == 15 ||
                          _group2 == 16 ||
                          _group2 == 17) &
                      (_group3 == 20 || _group3 == 21) &
                      (_group4 == 30 || _group4 == 31 || _group4 == 32)) {
                    OrderItem orderItem = OrderItem(
                        itemId: itemId,
                        qty: quantity,
                        price: finalPrice,
                        sizeId: sizeId,
                        cuttingId: cuttingId,
                        deliveryId: delievryId,
                        headId: headId);

                    orderItems.add(orderItem);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) => FinalPage()));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              content: Container(
                                  child: Text("اكمل باقي البيانات رجاءا",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                      textAlign: TextAlign.center)));
                        });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("ادفع الان",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                )),
          ),
        ],
      ));
}
