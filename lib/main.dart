import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Athfal Aplication',
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget image_nggeser = Container(
    height: 300.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/img/img1.png'),
        AssetImage('assets/img/img2.jpg'),
      ],
      autoplay: true,
      indicatorBgPadding: 1.0,
      dotColor: Colors.redAccent,
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Athfal Aplication"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView(
        children: <Widget>[
          image_nggeser,
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print("object");
                  AlertDialog(
                    title: Text('Not in stock'),
                    content: const Text('This item is no longer available'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  margin: EdgeInsets.all(25.0),
                  height: 50.0,
                  child: Card(
                    child: Center(
                      child: Text("Tengah!!"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  margin: EdgeInsets.all(25.0),
                  height: 50.0,
                  child: Card(
                    child: Center(
                      child: Text("Latihan Soal"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  margin: EdgeInsets.all(25.0),
                  height: 50.0,
                  child: Card(
                    child: Center(
                      child: Text("Tentang Aplikasi"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
// enum Departments { Production, Research, Purchasing, Marketing, Accounting }
 
// Future<Departments> _asyncSimpleDialog(BuildContext context) async {
//   return await showDialog<Departments>(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           title: const Text('Select Departments '),
//           children: <Widget>[
//             SimpleDialogOption(
//               onPressed: () {
//                 Navigator.pop(context, Departments.Production);
//               },
//               child: const Text('Production'),
//             ),
//             SimpleDialogOption(
//               onPressed: () {
//                 Navigator.pop(context, Departments.Research);
//               },
//               child: const Text('Research'),
//             ),
//             SimpleDialogOption(
//               onPressed: () {
//                 Navigator.pop(context, Departments.Purchasing);
//               },
//               child: const Text('Purchasing'),
//             ),
//             SimpleDialogOption(
//               onPressed: () {
//                 Navigator.pop(context, Departments.Marketing);
//               },
//               child: const Text('Marketing'),
//             ),
//             SimpleDialogOption(
//               onPressed: () {
//                 Navigator.pop(context, Departments.Accounting);
//               },
//               child: const Text('Accounting'),
//             )
//           ],
//         );
//       });
// }