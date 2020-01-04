// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

// class ViewPDF extends StatefulWidget {
//   final String fileName;
//   final String urlPdf;
//   const ViewPDF({this.fileName, this.urlPdf});
//   @override
//   _ViewPDFState createState() => _ViewPDFState();
// }

// class _ViewPDFState extends State<ViewPDF> {
//   static const scale = 100.0 / 72.0;
//   String path = "";
//   bool _saving = false;

//   Future<String> get _localPath async {
//     final directory = await getTemporaryDirectory();
//     String filePath = "${directory.path}/${widget.fileName}";
//     path = directory.path;
//     print(directory.path);
//     print("directory.path");
//     // check file exist
//     if (await File(filePath).exists()) {
//       print("file exist");
//       path = filePath;
//     } else {
//       print("file unavailabe");
//       path = await downloadPdfFile(path, widget.urlPdf);
//       print("path");
//       print(path);
//     }
//     return path;
//   }

//   Future<String> downloadPdfFile(String path, String url) async {
//     print(url);
//     print("url");
//     final filename = url.substring(url.lastIndexOf("/") + 1);
//     File file = new File('$path/$filename');
//     bool exist = false;
//     try {
//       await file.length().then((len) {
//         exist = true;
//       });
//     } catch (e) {
//       print(e);
//     }
//     if (!exist) {
//       var request = await HttpClient().getUrl(Uri.parse(url));
//       var response = await request.close();
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       await file.writeAsBytes(bytes);
//     }
//     return file.path;
//   }

//   @override
//   void initState() {
//     print(widget.fileName);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loadPdf = FutureBuilder(
//         future: _localPath,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return Text('Tidak ada Event');
//             case ConnectionState.active:
//               return Text('');
//             case ConnectionState.waiting:
//               return new Center(child: CircularProgressIndicator());
//             case ConnectionState.done:
//               if (snapshot.hasData) {
//                 print("${snapshot.data}/${widget.fileName}");
//                 print("snapshot.data");
//                 return PdfViewer(
//                   filePath: "${snapshot.data}",
//                 );
//               }
//           }
//         });

//     return Scaffold(
//       body:
//           ModalProgressHUD(child: Center(child: loadPdf), inAsyncCall: _saving),
//     );
//   }
// }
