import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/MateriModel.dart';

import '../alertdialog.dart';

class ListMateri extends StatefulWidget {
  final namaKelas;

  const ListMateri({Key key, this.namaKelas}) : super(key: key);

  @override
  _ListMateriState createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  static final routeName = "/kelas";
  //final duplicateItems = getMateri();
  Future<List<MateriModel>> _iur;
  ApiService _apiServices = ApiService();

//  static List <MateriModel> getMateri() {
//return <MateriModel> [
//  MateriModel(
//      judul : "Bertakwa Kepada Allah",
//      deskripsi: "Bertakwa kepada Allah adalah kewajiban bagi umat muslim"
//  ),
//  MateriModel(
//    judul: "Sifat Sabar ",
//    deskripsi:  "Sifat sabar adalah sifat bagi umat muslim"
//  ),
//  MateriModel(
//    judul:  "jbsjbjds",
//    deskripsi: "dnfanjkfnkdjanfkjadbkfbkadbfkadbkfbkjdabfksFAFAFSAFAsdgsfgsgdgs"
//  )
//];
//  }

  final appBar = AppBar(
    title: Text("Materi Pelajaran"),
    backgroundColor: Colors.cyanAccent,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iur = _apiServices.getListWeekly();
    print("kesini kan");
    
    //  items.addAll(duplicateItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: FutureBuilder(
      future: _iur,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Tidak ada Iuran');
          case ConnectionState.active:
            return Text('');
          case ConnectionState.waiting:
            return new Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              final refresh = Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(CupertinoIcons.refresh),
                    onPressed: () {
                      
                    },
                  ),
                  Text("Terjadi Kesalahan"),
                  // Text('${snapshot.error}',
                  // style: TextStyle(color: Colors.red))
                ],
              );
              return refresh;
            } else if (!snapshot.hasData) {
              return Card(
                elevation: 4.0,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Tidak ada Materi")),
              );
            } else {
              final _iuran =ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding:
                                      EdgeInsets.only(left: 5.0, right: 7.0),
                                  width:MediaQuery.of(context).size.width,
                                  height: 100.0,
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(snapshot.data[index].email,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              snapshot
                                                  .data[index].name,
                                              style: TextStyle(
                                                color: CupertinoColors
                                                    .inactiveGray,
                                              )),
                                        
                                      
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
              return _iuran;
            }
        }
      },
    ));

  }
}
