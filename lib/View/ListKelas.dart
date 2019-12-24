
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
    "Kelas 1",
    "Kelas 2",
    "Kelas 3",
    "Kelas 4",
    "Kelas 5",
    "Kelas 6"
  ];

  final appBar = AppBar(
    title: Text("Pilih Kelas"),
    backgroundColor: Colors.cyanAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: ListView.builder(
            itemCount: kelas.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () {
                  print("object");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return ListMapel(namaKelas: kelas[index],);
                      }));
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
                            kelas[index],
                            style: TextStyle(fontSize: 20.0),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ))),
              );
            }));
  }
}
