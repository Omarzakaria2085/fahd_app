import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as widget;
import 'package:rayan_app/components/appBar.dart';
import 'package:rayan_app/data.dart';
import 'package:rayan_app/main.dart';
import 'package:rayan_app/models/order_item.dart';

import 'final_page.dart';

class Hashy extends StatefulWidget {
  @override
  _HashyState createState() => _HashyState();
}

class _HashyState extends State<Hashy> {
  int _group1 = 51;
  int _group2 = 52;
  int _group3 = 53;
  int itemId = 16;
  int cuttingId, delievryId, sizeId;
  int priceNow = 0;
  int quantity = 1;
  double finalPrice = 0;

  Widget myRadioListTile1(int val) => RadioListTile(
        activeColor: Colors.white,
        value: val,
        groupValue: _group1,
        onChanged: (val) {
          setState(() {
            _group1 = val;
            sizeId = hashySizes[val]["sizeId"];
            priceNow = hashySizes[val]["price"];

            finalPrice = quantity * priceNow * 1.0;
          });
        },
        title: Text(
          hashySizes[val]["size"],
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget myRadioListTile2(int val) => RadioListTile(
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

  Widget myRadioListTile3(int val) => RadioListTile(
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
                myRadioListTile1(3),
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
                myRadioListTile2(15),
                myRadioListTile2(18),
              ],
            ),
          ),
          Card(
            color: Colors.lightBlue,
            child: Column(
              children: [
                Text("التجهيز",
                    style: TextStyle(color: Colors.white, fontSize: 35)),
                myRadioListTile3(1),
                myRadioListTile3(2),
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
                  if ((_group1 == 1 || _group1 == 2 || _group1 == 3) &
                      (_group2 == 11 || _group2 == 15 || _group2 == 18) &
                      (_group3 == 1 || _group3 == 2)) {
                    OrderItem orderItem = OrderItem(
                        itemId: itemId,
                        qty: quantity,
                        price: finalPrice,
                        sizeId: sizeId,
                        cuttingId: cuttingId,
                        deliveryId: delievryId,
                        headId: 2);

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
                  if ((_group1 == 1 || _group1 == 2 || _group1 == 3) &
                      (_group2 == 11 || _group2 == 15 || _group2 == 18) &
                      (_group3 == 1 || _group3 == 2)) {
                    OrderItem orderItem = OrderItem(
                        itemId: itemId,
                        qty: quantity,
                        price: finalPrice,
                        sizeId: sizeId,
                        cuttingId: cuttingId,
                        deliveryId: delievryId,
                        headId: 2);

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
