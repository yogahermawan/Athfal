import 'package:etestt/View/Dashboard.dart';
import 'package:etestt/View/ListSoal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key , @required this.marks}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {

  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks < 20){
      image = images[2];
      message = "Ayo Coba Lagi\n" + "Skor Kamu\n $marks\n"+"SEMANGAT!!!";
    }else if(marks < 35){
      image = images[1];
      message = "Kamu Bisa Lebih Baik\n" +  "Skor Kamu\n $marks\n"+"SEMANGAT!!!";
    }else{
      image = images[0];
      message = "Selamat Kamu Berhasil\n" +  "Skor Kamu\n $marks\n"+"SEMANGAT!!!";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        middle: Text(
          "Hasil",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                color: Color.fromRGBO(64, 75, 96, .9),
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 120.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontFamily: "Quando",
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Lanjutkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 2.0, color: Colors.white,),
                  splashColor:Color.fromRGBO(64, 75, 96, .9),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}