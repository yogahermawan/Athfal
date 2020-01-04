import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _saving = false;
  ApiService apiServices;

  @override
  void initState() {
    super.initState();
    apiServices = ApiService();
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void login(String username, String password) {
    var body = {"username": username, "password": password};
    setState(() {
      _saving = true;
    });
    apiServices.login(body).then((value) async {
      setState(() {
        _saving = false;
      });
      print('ini respon code');
      print(value.username);
      if (value.message == 401) {
        setState(() {
          _saving = false;
        });
        showToast('Username tidak ada');
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
      }
    });
    setState(() {
      _saving = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final emailField = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Judul Materi", style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _username,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Kelas",  style: TextStyle(color: Colors.white)),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _username,
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
          // if (_formKey.currentState.validate()) {
          login(_username.text, _password.text);
          //  }
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
      middle: Text("Input Materi", style: TextStyle(color:Colors.white),),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      trailing: popMenu,
      automaticallyImplyLeading: true,
    );

    return Scaffold(
        appBar:appBar,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color:Color.fromRGBO(58, 66, 86, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    emailField,
                    SizedBox(height: 25.0),
                    kelasField,
                    SizedBox(
                      height: 35.0,
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
