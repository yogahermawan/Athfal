import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  static final routeName = "/materi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Pembelajaran"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView(
        children: new List<int>.generate(3, (i) => i + 1)
            .map((val) => Card(
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Text"),
              ),
            ))
            .toList(),
      ),
    );
  }
}
