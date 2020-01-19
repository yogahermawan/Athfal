import 'dart:convert';
import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Model/KelasMode.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../alertdialog.dart';
import 'Dashboard.dart';
import 'ListKelas.dart';
import 'Login.dart';

class InputMateri extends StatefulWidget {
  @override
  _InputMateriState createState() => _InputMateriState();
}

class _InputMateriState extends State<InputMateri> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _judulMateri = TextEditingController();
  final _materi = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<List<KelasModel_>> _ber;
  static List data = List();
  static String _mySelection;

  static List<kelasModel> getKelas() {
    return <kelasModel>[
      kelasModel('1', 'Kelas 1'),
      kelasModel('2', 'Kelas 2'),
      kelasModel('3', 'Kelas 3'),
      kelasModel('4', 'Kelas 4'),
      kelasModel('5', 'Kelas 5'),
      kelasModel('6', 'Kelas 6'),
    ];
  }

  List<kelasModel> _kelas = getKelas();
  List<DropdownMenuItem<kelasModel>> _dropdownMenuItems;
  kelasModel _selecetedkelas;

  bool _saving = false;
  ApiService apiServices;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(_kelas);
    _selecetedkelas = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<kelasModel>> buildDropdownMenuItems(List kelas) {
    List<DropdownMenuItem<kelasModel>> items = List();
    for (kelasModel kelas_ in kelas) {
      items.add(
        DropdownMenuItem(
          value: kelas_,
          child: Text(kelas_.kelas),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(kelasModel selecetedkelas) {
    setState(() {
      _selecetedkelas = selecetedkelas;
    });
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
      gravity: ToastGravity.BOTTOM,
    );
  }


  @override
  Widget build(BuildContext context) {
    final judulMateri = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Judul Materi",
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _judulMateri,
            obscureText: false,
            //  validator: (val) => val.isEmpty  ? "Harap isi username" : null,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          )
        ],
      ),
    );

    final kelasField = Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
            "Kelas",
          )),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              value: _selecetedkelas,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),
          ),
        ],
      ),
    );

    final isiMateri = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Isi Materi",
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            maxLines: 10,
            controller: _materi,
            obscureText: false,
            //  validator: (val) => val.isEmpty  ? "Harap isi username" : null,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          )
        ],
      ),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(64, 75, 96, .9),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {



          apiServices.postMateri(_selecetedkelas.id, _judulMateri.text, _materi.text).then((value) async {
            setState(() {
              _saving = false;
            });
            if (value.message == 401) {
              setState(() {
                _saving = false;
              });
              showToast('Gagal');
            } else {
              showToast('Berhasil Input Materi');
            }
          });
          setState(() {
            _saving = true;
          });
        },
        child: Text("Input Materi",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    Future _logOut() async {
      setState(() {
        _saving = true;
      });
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      showToast("Logged Out");
      setState(() {
        _saving = false;
      });
    }

    _showDialog() {
      showDialog(
          context: context,
          builder: (context) {
            // return object of type dialog
            return AlertDialog(
              content: Text('Anda yakin ingin keluar?'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Batal',
                    style: TextStyle(color: CupertinoColors.activeBlue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    'Iya',
                    style: TextStyle(color: CupertinoColors.activeBlue),
                  ),
                  onPressed: () {
                    _logOut();
                  },
                ),
              ],
            );
          });
    }

    void chooseAction(String choice) {
      _showDialog();
    }

    final popMenu = PopupMenuButton(
      onSelected: chooseAction,
      itemBuilder: (context) {
        final dropDown = Constants.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                ),
                Text(
                  choice,
                ),
              ],
            ),
          );
        }).toList();
        return dropDown;
      },
      offset: Offset(0, 100),
    );

    final appBar = CupertinoNavigationBar(
      middle: Text(
        "Input Materi",
      ),
      trailing: popMenu,
      automaticallyImplyLeading: true,
    );

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    kelasField,
                    SizedBox(height: 25.0),
                    judulMateri,
                    SizedBox(
                      height: 35.0,
                    ),
                    isiMateri,
                    SizedBox(
                      height: 15.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class Constants {
  static const Logout = 'Logout';

  static const List<String> choices = <String>[Logout];
}
