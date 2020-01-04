
import 'package:etestt/View/ListMapel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../alertdialog.dart';
import 'ListMateri.dart';

class ListKelas extends StatefulWidget {
  @override
  _ListKelasState createState() => _ListKelasState();
}

class _ListKelasState extends State<ListKelas> {
  static final routeName = "/kelas";
  final kelas = [
    kelasModel('1', 'Kelas 1'),
    kelasModel('2', 'Kelas 2'),
    kelasModel('3', 'Kelas 3'),
    kelasModel('4', 'Kelas 4'),
    kelasModel('5', 'Kelas 5'),
    kelasModel('6', 'Kelas 6'),

  ];

  final appBar = CupertinoNavigationBar(
    middle: Text("Pilih Kelas", style: TextStyle(color: Colors.white),),
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: appBar,
        body: ListView.builder(
            itemCount: kelas.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () {
                  print("object");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return ListMapel(idKelas: kelas[index].id,);
                      }));
                },
                child: Card(
                    color: Color.fromRGBO(64, 75, 96, .9),
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
                            kelas[index].kelas,
                            style: TextStyle(fontSize: 20.0,color: Colors.white),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
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