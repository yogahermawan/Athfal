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
      ),
      MenuModel(
          title: "Tentang Aplikasi",
          icon: Icon(
            Icons.info,
            size: 30.0,
            color: Colors.grey,
          ),
          routes: "/tukarLiburHistory"),
      MenuModel(
          title: "Latihan Soal",
          icon: Icon(
            Icons.create,
            size: 30.0,
            color: Colors.grey,
          ),
         ),
      MenuModel(
          title: "Materi Pelajaran",
          icon: Icon(
            Icons.book,
            size: 30.0,
            color: Colors.grey,
          ),
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
        AssetImage('assets/img/img1.jpg'),
        AssetImage('assets/img/img2.jpg'),
        AssetImage('assets/img/img1.jpg'),
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
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0))),
        height: MediaQuery.of(context).size.height * .6,
        width: double.infinity,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onTap: () {
                       if (items[index].title == 'Keluar') {
                        exit(0);
                      } else if (items[index].title == 'Latihan Soal' || items[index].title =='Materi Pelajaran') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ListKelas(
                            title: items[index].title,
                          );
                        }));
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
                            child: Text(
                              items[index].title,
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
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
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            gridBuilder
          ],
        )
      ],
    );
  }
}
