import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/View/ListKelas.dart';
import 'package:flutter/material.dart';

import 'Materi.dart';
import 'View/Dashboard.dart';
import 'View/ListSoal.dart';
import 'View/alertdialog.dart';
import 'View/quizpage.dart';

void main() => runApp(MaterialApp(
  theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
  debugShowCheckedModeBanner: false,
  title: 'Athfal Aplication',
  home:
  HomePage(),
  initialRoute: "/",
  routes: {
    "/soal" :(context)=>ListSoal(),
    

    AlertDialogPage.routeName: (context)=>AlertDialogPage(),
    MateriPage.routeName: (context)=>MateriPage()
  },
));

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