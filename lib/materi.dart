import 'package:flutter/material.dart';

class materi extends StatelessWidget {
  static final routeName = "/materi";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Pembelajaran"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView(
        children: [1, 2, 3, 4]
            .map((val) => Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(16),
                  child: Card(
                    elevation: 5.0,
                    child: Text("Text"),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
