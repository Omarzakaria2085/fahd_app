import 'package:flutter/material.dart';
import 'package:rayan_app/api.dart';
import 'package:rayan_app/data.dart';
import 'package:rayan_app/models/item.dart';
import 'package:rayan_app/screens/hashy.dart';
import 'package:rayan_app/screens/hry.dart';
import 'package:rayan_app/screens/nagdy.dart';
import 'package:rayan_app/screens/noeme.dart';
import 'package:rayan_app/screens/sawakne.dart';
import 'package:rayan_app/screens/teuos.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: Api.getHomePageItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) =>
                  SheepCard(snapshot, index, context),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget SheepCard(
      AsyncSnapshot<List<Item>> snapshot, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          if (snapshot.data[index].itemId == 1)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext v) => Noeme()));
          else if (snapshot.data[index].itemId == 2)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext v) => Hry()));
          else if (snapshot.data[index].itemId == 12)
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext v) => Sawakne()));
          else if (snapshot.data[index].itemId == 15)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext v) => Nagdy()));
          else if (snapshot.data[index].itemId == 16)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext v) => Hashy()));
          else if (snapshot.data[index].itemId == 17)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext v) => Teuos()));
        } catch (e) {
          print(e);
        }
      },
      child: Card(
        color: Colors.lightBlue,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      snapshot.data[index].itemName,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "اسعارنا تبدأ من ${snapshot.data[index].salesPrice}",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: 100,
                height: 100,
                child:
                    Image.asset(productsUpdated[snapshot.data[index].itemId])),
          ],
        ),
      ),
    );
  }
}
