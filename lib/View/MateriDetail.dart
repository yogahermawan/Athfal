import 'package:carousel_pro/carousel_pro.dart';
import 'package:etestt/Model/MateriDetailModel.dart';
import 'package:etestt/Provider/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../Model/MateriModel.dart';

import '../alertdialog.dart';

class MateriDetail extends StatefulWidget {
  final int idMateri;

  const MateriDetail({Key key, this.idMateri}) : super(key: key);

  @override
  _MateriDetailState createState() => _MateriDetailState();
}

class _MateriDetailState extends State<MateriDetail> {
  static final routeName = "/kelas";
  // final duplicateItems = getMateri();
  Future<MateriModel> _mat;
  ApiService _apiServices = ApiService();
  //video player
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  final appBar = CupertinoNavigationBar(
    middle: Text("Materi Pelajaran"),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mat = _apiServices.getMateriDetail(widget.idMateri);
    print("kesini kan");
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    //  items.addAll(duplicateItems);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller.dispose();
    super.dispose();
    // _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: FutureBuilder(
          future: _mat,
          // ignore: missing_return
          builder: (context, AsyncSnapshot<MateriModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Tidak ada Materi');
              case ConnectionState.active:
                return Text('');
              case ConnectionState.waiting:
                return new Center(child: CircularProgressIndicator());
              case ConnectionState.done:
              print(snapshot.hasError);
              print(snapshot);
              print("MBUHH");
                if (snapshot.hasError) {
                  final refresh = Column(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                          icon: Icon(CupertinoIcons.refresh),
                          onPressed: () {},
                        ),
                      ),
                      Container(child: Text("Terjadi Kesalahan")),
                      // Text('_controller${snapshot.error}',
                      // style: TextStyle(color: Colors.red))
                    ],
                  );
                  return refresh;
                } else if (!snapshot.hasData) {
                  return Card(
                    elevation: 4.0,
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Tidak ada Materi")),
                  );
                } else {
                  final materi = Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Container(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  snapshot.data.namaMateri,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                snapshot.data.isiMateri,
                              ),
                            ),
                            Container(
                                child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ))
                          ],
                        ),
                      );
                  return materi;
                }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),);
  }
}