import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/View/InputMateri.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../alertdialog.dart';
import 'Dashboard.dart';
import 'ListKelas.dart';
import 'Login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

    apiServices.login(body).then((value) async {
      setState(() {
        _saving = false;
      });
      if (value.message == 'login_success') {
        showToast(value.message);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => InputMateri()),
            (Route<dynamic> route) => false);
      } else {
        // jika kode sekolah salah
        showToast(value.message);
        setState(() {
          _saving = false;
        });
      }
    });
    setState(() {
      _saving = true;
    });
  }

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
    final username = TextFormField(
      controller: _username,
      obscureText: false,
      //validator: (val) => val.isEmpty  ? "Harap isi username" : null,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      obscureText: true,
      controller: _password,
      //validator: (val) => val.length < 1 ? "Harap isi Password" : null,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Color.fromRGBO(64, 75, 96, .9),

      ),

      // color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //  if (_formKey.currentState.validate()) {
          login(_username.text, _password.text);
          // }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    final appBar = CupertinoNavigationBar(
      middle: Text("Login",
      ),
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
                    SizedBox(height: 155.0),
                    username,
                    SizedBox(height: 25.0),
                    passwordField,
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
