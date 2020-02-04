import 'package:flutter/material.dart';

class TentangApp extends StatelessWidget {
  static final routeName = "/tentangapp";
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/img/yg.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Athfal Aplication',
        style: TextStyle(fontSize: 30.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Athfal Aplication adalah sebuah aplikasi pembelajaran untuk anak-anak sekolah dasar, aplikasi ini dikembangkan oleh Yoga Hermawan menggunakan framework flutter.(2020)",
        style: TextStyle(fontSize: 19.0, color: Colors.white),
      ),
    );

    final beton = FlatButton(
      child: Text("Tutup"),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem, beton],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}