import 'package:flutter/material.dart';
import 'package:rayan_app/screens/final_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/appBar.dart';
import 'components/drawer.dart';
import 'data.dart';
import 'listview.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:whatsapp_unilink/whatsapp_unilink.dart';

void main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: ProjectApp(selectedPage: 0)));
}

class ProjectApp extends StatefulWidget {
  final int selectedPage;
  ProjectApp({this.selectedPage});

  @override
  State<ProjectApp> createState() => _ProjectAppState();
}

class _ProjectAppState extends State<ProjectApp> {
  final List<String> ImagePath = [
    "assets/allUp2.jpg",
    "assets/freshUp.jpg",
    "assets/unique.jpg",
    "assets/meat.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.selectedPage,
        length: 4,
        child: Scaffold(
          drawer: myDrawer(),
          backgroundColor: Colors.white,

//***********************
          body: TabBarView(
            children: [
              ListViewPage(),
              ListView(children: [
                CarouselSlider(
                    items: ImagePath.map((imageUrl) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(imageUrl, fit: BoxFit.fill),
                        width: double.infinity,
                      );
                    }).toList(),
                    options: CarouselOptions(autoPlay: true, height: 400)),
                Image.asset("assets/steps.jpg")
              ]),
              if (orderItems.length == 0)
                Center(
                    child: Text("لا يوجد طلبات",
                        style:
                            TextStyle(color: Colors.lightBlue, fontSize: 25)))
              else
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        "ملخص الطلب",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.lightBlue),
                      ),
                    ),
                    SingleChildScrollView(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: orderItems.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () => setState(
                                      () => orderItems.removeAt(index)),
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.lightBlue,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "السعر: ${orderItems[index].price / orderItems[index].qty}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "الكمية: ${orderItems[index].qty}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "النوع: ${size[orderItems[index].sizeId]}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "التقطيع: ${cutting[orderItems[index].cuttingId]["cutting"]}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "التجهيز: ${delivery[orderItems[index].deliveryId]["delivery"]}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        orderItems[index].itemId == 16
                                            ? ""
                                            : "الرأس: ${head[orderItems[index].headId]["head"]}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "الاجمالي: ${orderItems[index].price}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                    productsUpdated[orderItems[index].itemId],
                                    height: 150,
                                    fit: BoxFit.contain),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlue)),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext v) => FinalPage())),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text("اطلب الان",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                          )),
                    ),
                  ],
                ),
              GestureDetector(
                onTap: () => myLaunchWhats(),
                child: Image.asset("assets/contactUs.jpg"),
              ),
            ],
          ),

//*********************
          appBar: myAppBar(),
//*********************
          bottomNavigationBar: BottomAppBar(
              color: Colors.lightBlue,
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.shop_2_sharp)),
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                  Tab(
                    icon: Icon(Icons.connect_without_contact),
                  ),
                ],
              )),
        ));
  }

  myLaunchWhats() async {
    var whatsapp = '9660556759718';
    var whatsappURl_android = "whatsapp://send?phone=" + whatsapp;

    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
    }
  }
}
