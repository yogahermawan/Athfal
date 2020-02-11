import 'package:etestt/View/InputMateri.dart';
import 'package:etestt/View/InputSoal.dart';
import 'package:etestt/View/ListMapel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminHome extends StatefulWidget {
  final String title;

  adminHome({this.title});

  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  static final routeName = "/kelas";
  final menu = [
    kelasModel('1', 'Input Materi'),
    kelasModel('2', 'Input Soal'),
    // kelasModel('3', 'Kelas 3'),
    // kelasModel('4', 'Kelas 4'),
    // kelasModel('5', 'Kelas 5'),
    // kelasModel('6', 'Kelas 6'),
  ];

  final appBar = CupertinoNavigationBar(
    middle: Text(
      "Pilih Input",
    ),
    //   backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () {
                  // return ListSoal(kelas: menu[index].id);
                  if (menu[index].id == 1) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => InputMateri()));
                  } else {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => InputSoal()));                   
                  }
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3.0,
                    child: Container(
                        alignment: Alignment.center,
                        height: 80.0,
                        padding: EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          title: Text(
                            menu[index].kelas,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ))),
              );
            }));
  }
}

class kelasModel {
  String id;
  String kelas;

  kelasModel(this.id, this.kelas);
}
