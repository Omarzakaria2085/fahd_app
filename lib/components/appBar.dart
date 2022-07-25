import 'package:flutter/material.dart';

Widget myAppBar() => AppBar(
      actions: [
        Image.asset("assets/logo.png"),
      ],
      centerTitle: true,
      title: Text("فهد للذبائح"),
    );
