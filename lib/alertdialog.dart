import 'package:flutter/material.dart';
import 'materi.dart';

class alertdialog extends StatelessWidget{
  static final routeName = "/alertDialog";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pilih Kelas'),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Text("Materi"),
          color: Colors.black,
            onPressed: () {
            Navigator.pushNamed(context, materi.routeName);
          },
        )
      ],
    );
  }
}