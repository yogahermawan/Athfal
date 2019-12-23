import 'package:flutter/material.dart';
import 'Materi.dart';

class AlertDialogPage extends StatelessWidget{
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
            Navigator.pushNamed(context, MateriPage.routeName);
          },
        )
      ],
    );
  }
}