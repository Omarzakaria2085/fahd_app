import 'package:flutter/material.dart';
import 'package:rayan_app/components/appBar.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(),
        body: ListView(children: [
          Image.asset("assets/accounts.jpg"),
        ]),
      );
}
