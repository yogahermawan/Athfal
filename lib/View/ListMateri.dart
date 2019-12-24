import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:etestt/View/MateriDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/MateriModel.dart';

import '../alertdialog.dart';

class ListMateri extends StatefulWidget {
  final namaKelas;
  final namaMapel;

  const ListMateri({Key key, this.namaKelas, this.namaMapel}) : super(key: key);

  @override
  _ListMateriState createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  static final routeName = "/kelas";
  //final duplicateItems = getMateri();
  Future<List<MateriModel>> _mat;
  ApiService _apiServices = ApiService();


  final appBar = AppBar(
    title: Text("Materi Pelajaran"),
    backgroundColor: Colors.cyanAccent,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mat = _apiServices.getMateriList(widget.namaKelas, widget.namaMapel);
    print("kesini kan"+widget.namaKelas);

    //  items.addAll(duplicateItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: FutureBuilder(
          future: _mat,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Tidak ada Materi');
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
                        onPressed: () {},
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
                  final _iuran = ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 5.0, right: 7.0),
                        width: MediaQuery.of(context).size.width,
                        height: 100.0,
                        child: InkWell(
                             onTap: () {
                    print("object");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return MateriDetail(namaKelas: snapshot.data[index].namaMateri,);
                        }));
                  },
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(snapshot.data[index].namaMateri),
                                  subtitle: Text(snapshot.data[index].deskripsi),
                                )),
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
