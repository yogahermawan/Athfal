import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Model/MenuModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../alertdialog.dart';
import 'ListKelas.dart';
import 'Login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<MenuModel> getMenus() {
    return <MenuModel>[
      MenuModel(
          title: "Keluar",
          icon: Icon(
            Icons.exit_to_app,
            size: 30.0,
            color: Colors.grey,
          ),

          routes: "/hariBesarHistory"),
      MenuModel(
          title: "Tentang Aplikasi",
          subtitle: "Data dan riwayat pengajuan tukar libur",
          icon: Icon(Icons.info, size: 30.0, color: Colors.grey,),
          image: "images/icons/tukarlibur.png",
          routes: "/tukarLiburHistory"),
      MenuModel(
          title: "Latihan Soal",
          subtitle: "Data dan riwayat pengajuan cuti",
          icon: Icon(Icons.create, size: 30.0, color: Colors.grey,),
          image: "images/icons/cuti.png",
          routes: "/soal"),
      MenuModel(
          title: "Materi Pelajaran",
          icon: Icon(Icons.book, size: 30.0, color: Colors.grey,),
          routes: "/kelas"),
    ].reversed.toList();
  }

  final duplicateItems = getMenus();
  var items = List<MenuModel>();

  void initState() {
    items.addAll(duplicateItems);
  }

  @override
  Widget image_nggeser = Container(
    height: 330.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
    ),
    child: Carousel(
      dotHorizontalPadding: 20.0,
      borderRadius: true,
      boxFit: BoxFit.fill,
      images: [
        AssetImage('assets/img/img2.jpg'),
        AssetImage('assets/img/img2.jpg'),
        AssetImage('assets/img/img2.jpg'),
        AssetImage('assets/img/img2.jpg'),
        AssetImage('assets/img/img2.jpg'),
      ],
      showIndicator: false,
      autoplay: true,
      indicatorBgPadding: 0.0,
      dotColor: Colors.redAccent,
    ),
  );

  Widget build(BuildContext context) {
    final gridBuilder = new Container(

        decoration: new BoxDecoration(
            color: Color.fromRGBO(58, 66, 86, 1.0),
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0))),
        height: MediaQuery.of(context).size.height * .6,
        width: double.infinity,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2),
                ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  color: Color.fromRGBO(64, 75, 96, .9),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onTap: () {
                      if (items[index].routes.isNotEmpty) {
                        Navigator.pushNamed(context, items[index].routes);
                      } else if ( items[index].title == 'Keluar'){
                        exit(0);
                      }
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          items[index].icon,
                          Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Text(items[index].title, style: TextStyle(color: Colors.grey),), )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
    return Stack(
      children: <Widget>[
        image_nggeser,
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton(
                shape: CircleBorder(),
                child: Icon(Icons.person),
                onPressed: () {
                  print("object");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
              )
            ],
          ),
        ),
        Column(
          children: <Widget>[
          SizedBox(

          height: MediaQuery.of(context).size.height*0.4,
        ),
            gridBuilder
          ],
            )
      ],
    );
//    return Stack(
//      children: <Widget>[
//        image_nggeser,
//        Scaffold(
//          backgroundColor: Colors.transparent,
//          appBar: AppBar(
//            backgroundColor: Colors.transparent,
//            actions: <Widget>[
//              FlatButton(
//                shape: CircleBorder(),
//                child: Icon(Icons.person),
//                onPressed: () {
//                  print("object");
//                  Navigator.push(context, MaterialPageRoute(builder: (context) {
//                    return Login();
//                  }));
//                },
//              )
//            ],
//          ),
//          body: Container(
//            color: Colors.transparent,
//            child: ListView(
//              children: <Widget>[
//
//                gridBuilder
////          Center(
////            child: Column(
////              mainAxisAlignment: MainAxisAlignment.center,
////              children: [
////                GestureDetector(
////                  onTap: () {
////                    Navigator.push(context,
////                        MaterialPageRoute(builder: (context) {
////                      return ListKelas();
////                    }));
////                  },
////                  child: Container(
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(100.0),
////                      gradient: LinearGradient(
////                        colors: <Color>[
////                          Color(0xFF31A8D1),
////                          Color(0xff2293B9),
////                          Color(0xFF0A7EA6),
////                        ],
////                      ),
////
////                      // Color(0xFF0A7EA6)
////                    ),
////                    width: double.infinity,
////                    margin: EdgeInsets.all(25.0),
////                    height: 50.0,
////                    child: Center(
////                      child: Text(
////                        "Materi Pelajaran",
////                        style: TextStyle(color: Colors.white, fontSize: 18.0),
////                      ),
////                    ),
////                  ),
////                ),
////                GestureDetector(
////                  child: Container(
////                    width: double.infinity,
////                    color: Colors.yellow,
////                    margin: EdgeInsets.all(25.0),
////                    height: 50.0,
////                    child: Card(
////                      child: Center(
////                        child: Text("Latihan Soal"),
////                      ),
////                    ),
////                  ),
////                ),
////                GestureDetector(
////                  child: Container(
////                    width: double.infinity,
////                    color: Colors.yellow,
////                    margin: EdgeInsets.all(25.0),
////                    height: 50.0,
////                    child: Card(
////                      child: Center(
////                        child: Text("Tentang Aplikasi"),
////                      ),
////                    ),
////                  ),
////                ),
////              ],
////            ),
////          ),
//              ],
//            ),
//          ),
//        ),
//      ],
//
//    );
  }
}
