import 'package:flutter/material.dart';
import 'package:rayan_app/components/appBar.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: myAppBar(),
        body: ListView(children: [
          Image.asset("assets/who.jpg"),
        ]),
      );
}
