import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:athfal/alertdialog.dart';
import 'package:athfal/Materi.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Athfal Aplication',
  home: HomePage(),
  initialRoute: "/",
  routes: {
    AlertDialogPage.routeName: (context)=>AlertDialogPage(),
    MateriPage.routeName: (context)=>MateriPage()
  },
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget image_nggeser = Container(
    height: 200.0,
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
        actions: <Widget>[
          FlatButton(
            shape: CircleBorder(),
            child: Icon(Icons.person),
            onPressed: (){
              print("object");
            },
          )
        ],
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
                  Navigator.pushNamed(context, AlertDialogPage.routeName);
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