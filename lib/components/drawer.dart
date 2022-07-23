import 'package:rayan_app/main.dart';
import 'package:flutter/material.dart';
import '../screens/aboutUs.dart';
import '../screens/accounts.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(height: 48),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) =>
                            ProjectApp(selectedPage: 1)));
                  },
                  trailing: Icon(Icons.home),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("الرئيسية"),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) => AboutUs()));
                  },
                  trailing: Icon(Icons.help),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("من نحن"),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) =>
                            ProjectApp(selectedPage: 2)));
                  },
                  trailing: Icon(Icons.add_shopping_cart),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("عربة التسوق"),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) => Accounts()));
                  },
                  trailing: Icon(Icons.account_balance),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("حساباتنا البنكية"),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) =>
                            ProjectApp(selectedPage: 3)));
                  },
                  trailing: Icon(Icons.connect_without_contact),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("تواصل معنا"),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext v) =>
                            ProjectApp(selectedPage: 0)));
                  },
                  trailing: Icon(Icons.shop_2_sharp),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("جميع منتجاتنا"),
                    ],
                  ),
                ),
              ],
            )),
      );
}
