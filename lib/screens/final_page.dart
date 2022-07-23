import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rayan_app/api.dart';
import 'package:rayan_app/components/appBar.dart';
import 'package:rayan_app/data.dart';
import 'package:rayan_app/main.dart';
import 'package:rayan_app/models/item.dart';
import 'package:rayan_app/models/new_order.dart';
import 'package:rayan_app/models/order_user.dart';

import 'package:flutter/material.dart' as widget;

class FinalPage extends StatefulWidget {
  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  var customerName = TextEditingController();

  var customerPhone = TextEditingController();

  var customerLocation = TextEditingController();

  int cash;
  int _group = 55;

  Widget myRadioListTile2(int val, String txt) => RadioListTile(
        activeColor: Colors.white,
        value: val,
        groupValue: _group,
        onChanged: (val) {
          setState(() {
            _group = val;
            cash = val;
          });
        },
        title: Text(
          txt,
          style: TextStyle(color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: myAppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                color: Colors.lightBlue,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("قم بادخال المعلومات التالية",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("حتي نتمكن من التواصل معك وتأكيد طلبك",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    textRow(": الاسم",
                        widget.Icon(Icons.person, color: Colors.white)),
                    textField(customerName, "اكتب اسمك هنا"),
                    textRow(": العنوان",
                        widget.Icon(Icons.person, color: Colors.white)),
                    textField(customerPhone, "اكتب عنوانك هنا"),
                    textRow(": رقم الجوال",
                        widget.Icon(Icons.person, color: Colors.white)),
                    textField(customerLocation, "اكتب رقم جوالك هنا"),
                    textRow(": طرق الدفع",
                        widget.Icon(Icons.attach_money, color: Colors.white)),
                    myRadioListTile2(1, "نقدي عند الاستلام"),
                    myRadioListTile2(2, "حوالة بنكية"),
                    SizedBox(height: 20),
                    Container(
                      // color: Colors.white,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: TextButton(
                        onPressed: () {
                          if ((_group == 1 || _group == 2) &
                              (customerName.text.trim() != "") &
                              (customerLocation.text.trim() != "") &
                              (customerPhone.text.trim() != "")) {
                            orderUser = OrderUser(
                                userName: customerName.text,
                                address: customerPhone.text,
                                phone: customerLocation.text,
                                payId: _group);

                            Api.saveOrderItem(NewOrder(
                                newOrderItems: orderItems, NewUser: orderUser));

                            orderItems = [];
                            orderUser = null;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext v) =>
                                    ProjectApp(selectedPage: 1)));
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      content: Container(
                                          child: Text(
                                              "اكمل باقي البيانات رجاءا",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.lightBlue),
                                              textAlign: TextAlign.center)));
                                });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text("تأكيد الطلب",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.lightBlue)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
        ],
      ));
}

Widget textRow(String txt, Widget alIcona) => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(txt,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 20, color: Colors.white)),
        alIcona,
        SizedBox(
          width: 30,
        )
      ],
    );

Widget textField(var customerName, String hint) => TextFormField(
    style: TextStyle(color: Colors.lightBlue),
    controller: customerName,
    textAlign: TextAlign.end,
    keyboardType: TextInputType.emailAddress,
    obscureText: false,
    decoration: InputDecoration(
      filled: true,
      focusColor: Colors.white,
      fillColor: Colors.white,
      hintText: hint,
      border: OutlineInputBorder(),
    ));
