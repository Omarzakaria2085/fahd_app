import 'package:flutter/material.dart';

Widget myAppBar() => AppBar(
      actions: [
        Image.asset("assets/flag.png"),
      ],
      centerTitle: true,
      title: Text("فهد للذبائح"),
    );
