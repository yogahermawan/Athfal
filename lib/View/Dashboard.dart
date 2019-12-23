
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../alertdialog.dart';
import 'ListKelas.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget image_nggeser = Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/img/img1.png'),
        AssetImage('assets/img/img2.jpg'),
      ],
      autoplay: true,
      indicatorBgPadding: 1.0,
      dotColor: Colors.redAccent,
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Athfal Aplication"),
        backgroundColor: Colors.cyanAccent,
        actions: <Widget>[
          FlatButton(
            shape: CircleBorder(),
            child: Icon(Icons.person),
            onPressed: (){
              print("object");
            },
          )
        ],
      ),
      body:

      ListView(
        children: <Widget>[
          image_nggeser,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print("object");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ListKelas();
                        }));
                  },
                  child: Container(
                    width: double.infinity,
                    color: Colors.yellow,
                    margin: EdgeInsets.all(25.0),
                    height: 50.0,
                    child: Card(
                      child: Center(
                        child: Text("Materi Pelajaran"),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    color: Colors.yellow,
                    margin: EdgeInsets.all(25.0),
                    height: 50.0,
                    child: Card(
                      child: Center(
                        child: Text("Latihan Soal"),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    color: Colors.yellow,
                    margin: EdgeInsets.all(25.0),
                    height: 50.0,
                    child: Card(
                      child: Center(
                        child: Text("Tentang Aplikasi"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}