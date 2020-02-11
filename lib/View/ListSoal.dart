import 'package:etestt/View/ListMapel.dart';
import 'package:etestt/View/quizpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../alertdialog.dart';
import 'ListMateri.dart';

class ListSoal extends StatefulWidget {
  final String kelas;

  ListSoal({this.kelas});
  @override
  _ListSoalState createState() => _ListSoalState();
}

class _ListSoalState extends State<ListSoal> {
  // final soal = [
  //   soalModel(
  //     '1',
  //     'IPA',
  //     'Kelas 1',
  //   ),
  //   soalModel(
  //     '1',
  //     'IPA',
  //     'Kelas 1',
  //   ),
  //   soalModel('1', 'IPS', 'Kelas 1'),
  //   soalModel('2', 'IPS', 'Kelas 2'),
  //   soalModel('3', 'IPA', 'Kelas 3'),
  //   soalModel('4', 'IPS', 'Kelas 4'),
  //   soalModel('5', 'IPA', 'Kelas 5'),
  //   soalModel('6', 'IPS', 'Kelas 6'),
  // ];


static List<soalModel> getSoal(){
return<soalModel>[
soalModel(id:'1', soal:'Dasar Aqidah Islam', kelas:'Kelas 3'),
soalModel(id:'2', soal:'IPS', kelas:'Kelas 7'),
soalModel(id:'3', soal:'IPA', kelas:'Kelas 3'),
soalModel(id:'4', soal:'IPS', kelas:'Kelas 2'),
soalModel(id:'5', soal:'IPA', kelas:'Kelas 1'),
soalModel(id:'6', soal:'IPS', kelas:'Kelas 1'),

];
} 

  var items = List<soalModel>();

void getKelas(){
  print("ini widget kelas");
  final itemsNew = getSoal();
  for (int i = 0; i<itemsNew.length;i++){
    if (widget.kelas == itemsNew[i].id.toString()){
     print(itemsNew[i].id+widget.kelas);
     items.add(itemsNew[i]);
    }
    
  }
}

  void initState() {
    getKelas();
   
  }

  final appBar = CupertinoNavigationBar(
    middle: Text(
      "Pilih Kuis",
      style: TextStyle(color: Colors.white),
    ),
    automaticallyImplyLeading: true,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: appBar,
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext ctxt, int index) {
             return InkWell(
                  onTap: () {
                    print(items[index].soal);
                  //   if (widget.kelas == soal[index].kelas) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return getjson(
                          items[index].soal,
                        );
                      }));
                  //   }
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
                              items[index].soal,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ))),
                );
           
            }));
  }
}

class soalModel {
  String id;
  String soal;
  String kelas;

  soalModel({this.id, this.soal, this.kelas});
}
