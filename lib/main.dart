import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';

  int _current = 0;
  List imgList = [
    'https://www.ceritaanak.org/images/islamicnames-babynamespk.jpg',
    'https://tutugon.com/wp-content/uploads/2016/10/muslim-family-coloring-pages.jpg',
    'https://s.republika.co.id/uploads/images/inpicture_slide/kartun-anak-one4kids-produksi-muslim-australia-_161227030045-616.jpg',
    'https://pasberita.com/wp-content/uploads/2018/09/Muslim-Kids-253.jpg',
    'http://muslimkecil.com/wp-content/uploads/2018/04/Selection_221.png'
  ];

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Athfal Aplication',
      theme: new ThemeData(primaryColor: Color.fromRGBO(77, 165, 255, 1.0)),
      home: new ListPage(title: 'Lessons'),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ListPageState createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 245, 255, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

final topAppBar = AppBar(
  elevation: 0.1,
  backgroundColor: Color.fromRGBO(0, 89, 179, 1.0),
  title: Text(
    'Athfal Aplication',
    style: TextStyle(color: Colors.white, fontFamily: 'Comic'),
  ),
  actions: <Widget>[
    new RaisedButton(
      padding: const EdgeInsets.all(0.0),
      textColor: Colors.white,
      color: Color.fromRGBO(0, 191,255, 1.0),
      onPressed: (){},
      child: new Text("LOGIN"),
    ),
  ],
);

final makeBody = ListView(
  children: <Widget>[
    //new Column(
      // children: <Widget>[
      //   CarouselSlider(
      //     height: 200.0,
      //     initialPage: 0,
      //     enlargeCenterPage: true,
      //     autoPlay: true,
      //     reverse: false,
      //     enableInfiniteScroll: true,
      //     autoPlayInterval: Duration(seconds: 2),
      //     autoPlayAnimationDuration: Duration(milliseconds: 2000),
      //     pauseAutoPlayOnTouch: Duration(seconds: 10),
      //     scrollDirection: Axis.horizontal,
      //     onPageChanged: (index) {
      //       setState((){
      //         _current = index;
      //       });
      //     },
      //     items: imgList.map((imgUrl) {
      //       return Builder(
      //         builder: (BuildContext context) {
      //           return Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.symmetric(vertical: 25.0),
      //             decoration: BoxDecoration(
      //               color: Colors.green,
      //             ),
      //             child: Image.network(
      //               imgUrl,
      //               fit: BoxFit.fill,
      //             ),
      //           );
      //         },
      //       );
      //     }).toList(),
      //   ),
      // ],
      new SizedBox(
        height: 200.0,
        width: 350.0,
        child: Carousel(
        images: [
          NetworkImage('https://www.ceritaanak.org/images/islamicnames-babynamespk.jpg'),
          NetworkImage('https://tutugon.com/wp-content/uploads/2016/10/muslim-family-coloring-pages.jpg'),
          NetworkImage('https://s.republika.co.id/uploads/images/inpicture_slide/kartun-anak-one4kids-produksi-muslim-australia-_161227030045-616.jpg'),
          NetworkImage('https://pasberita.com/wp-content/uploads/2018/09/Muslim-Kids-253.jpg'),
          NetworkImage('http://muslimkecil.com/wp-content/uploads/2018/04/Selection_221.png'),
        ],
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: Colors.lightGreenAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.purple.withOpacity(0.5),
        borderRadius: true,
      )
    ),
          new FlatButton.icon(
          color: Color.fromRGBO(77, 165, 255, 1.0),
          padding: EdgeInsets.all(15.0),
          icon: Icon(
            Icons.child_care,
            color: Color.fromRGBO(0, 89, 179, 1.0),
          ), //`Icon` to display
          label: Text(
            'Ayo Belajar',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ), //`Text` to display
          onPressed: () {
            //Code to execute when Floating Action Button is clicked
            //...
          },
        ),
        new FlatButton.icon(
          color: Color.fromRGBO(77, 165, 255, 1.0),
          padding: EdgeInsets.all(15.0),
          icon: Icon(Icons.assessment), //`Icon` to display
          label: Text(
            'Latihan Soal',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            ), //`Text` to display
          onPressed: () {
            //Code to execute when Floating Action Button is clicked
            //...
          },
        ),
        new FlatButton.icon(
          color: Color.fromRGBO(77, 165, 255, 1.0),
          padding: EdgeInsets.all(15.0),
          icon: Icon(Icons.add_a_photo), //`Icon` to display
          label: Text(
            'Tentang',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            ), //`Text` to display
          onPressed: () {
            //Code to execute when Floating Action Button is clicked
            //...
          },
        ),
        ]
      );
      void setState(Null Function() param0) {}