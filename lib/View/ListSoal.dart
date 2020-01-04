
import 'package:etestt/View/ListMapel.dart';
import 'package:etestt/View/quizpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../alertdialog.dart';
import 'ListMateri.dart';

class ListSoal extends StatefulWidget {
  @override
  _ListSoalState createState() => _ListSoalState();
}

class _ListSoalState extends State<ListSoal> {
  final soal = [
    soalModel('1', 'IPA'),
    soalModel('2', 'Bahasa Indonesia'),
    soalModel('3', 'Matematika'),
    soalModel('4', 'IPS'),
    soalModel('5', 'Bahasa Inggris'),
    soalModel('6', 'Ketrampilan'),

  ];

  final appBar = CupertinoNavigationBar(
    middle: Text("Pilih Kuis", style: TextStyle(color: Colors.white),),
    automaticallyImplyLeading: true,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: appBar,
        body: ListView.builder(
            itemCount: soal.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () {
                  print(soal[index].soal);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return getjson( soal[index].soal,);
                      }));
                },
                child: Card(
                    color: Color.fromRGBO(64, 75, 96, .9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 8.0,
                    child: Container(
                        alignment: Alignment.center,
                        height: 80.0,
                        padding: EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          title: Text(
                            soal[index].soal,

                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                        ))),
              );
            }));
  }
}

class soalModel {

  String id;
  String soal;

  soalModel(this.id, this.soal);


}