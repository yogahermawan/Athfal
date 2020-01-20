import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Model/MateriDetailModel.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/MateriModel.dart';

import '../alertdialog.dart';

class MateriDetail extends StatefulWidget {
  final int idMateri;

  const MateriDetail({Key key, this.idMateri}) : super(key: key);

  @override
  _MateriDetailState createState() => _MateriDetailState();
}

class _MateriDetailState extends State<MateriDetail> {
  static final routeName = "/kelas";
  //final duplicateItems = getMateri();
  Future<List<MateriModel>> _mat;
  ApiService _apiServices = ApiService();

  final appBar = CupertinoNavigationBar(
    middle: Text("Materi Pelajaran"),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mat = _apiServices.getMateriDetail(widget.idMateri);
    print("kesini kan" );

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
                  final materi = ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Container(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  snapshot.data[index].namaMateri,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                snapshot.data[index].isiMateri,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  return materi;
                }
            }
          },
        ));
  }
}
