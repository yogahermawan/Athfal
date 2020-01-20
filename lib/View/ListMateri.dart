import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:etestt/View/MateriDetail.dart';
import 'package:etestt/View/ViewPDF.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/MateriModel.dart';

import '../alertdialog.dart';

class ListMateri extends StatefulWidget {
  final idKelas;
  final idMapel;

  const ListMateri({Key key, this.idKelas, this.idMapel}) : super(key: key);

  @override
  _ListMateriState createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  static final routeName = "/kelas";
  //final duplicateItems = getMateri();
  Future<List<MateriModel>> _mat;
  ApiService _apiServices = ApiService();


  final appBar = CupertinoNavigationBar(
    middle: Text("Ayo Belajar", ),
   );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mat = _apiServices.getMateriList(widget.idKelas);
    print("kesini aaakan"+widget.idKelas);

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
                  final _materi = ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 5.0, right: 7.0),
                        width: MediaQuery.of(context).size.width,
                        height: 100.0,
                        child: InkWell(
                             onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) {
                           return MateriDetail(idMateri: snapshot.data[index].idMateri);
                         }));
                  },
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(snapshot.data[index].namaMateri, ),
                                 trailing: Icon(Icons.arrow_forward_ios,),
                                )),
                          ),
                        ),
                      );
                    },
                  );
                  return _materi;
                }
            }
          },
        ));
  }
}
