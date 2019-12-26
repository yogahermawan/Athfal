import 'dart:convert';

import 'package:etestt/Model/MapelModel.dart';
import 'package:etestt/Model/MateriDetailModel.dart';
import 'package:etestt/Model/MateriModel.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final urlUtama = 'http://192.168.1.19:8000/';

  Future<List<MapelModel>> getMapelList(String namaKelas) async {
     List<MapelModel> jurnal;
    var data = {"nama_kelas": namaKelas, };
    final body = json.encode(data);
    print(body);
    final res = await http.post("http://ec2-34-203-236-133.compute-1.amazonaws.com/mapel/get", headers: {"Content-Type": "application/json"}, body: body);
    final resResult = json.decode(res.body);
     if (resResult['data'] != null) {
      jurnal = (resResult['data'] as List)
          .map((data) => MapelModel.fromJson(data))
          .toList();
      return jurnal;
    } else {
      print('sds');
      return null;
    }
  }

  Future<List<MateriModel>> getMateriList(String idMapel, String idKelas) async {
     List<MateriModel> materi;
    var data = {"idMapel": idMapel, "idKelas":idKelas};
    final body = json.encode(data);
    print(body);
    final res = await http.post("http://ec2-34-203-236-133.compute-1.amazonaws.com/mapel/getmateri", headers: {"Content-Type": "application/json"}, body: body);
    final resResult = json.decode(res.body);
    print(resResult['data']);
    if (resResult['data'] != null) {
      materi = (resResult['data'] as List)
          .map((data) => MateriModel.fromJson(data))
          .toList();
      return materi;
    } else {
      return null;
    }
  }


    Future<List<MateriDetailModel>> getMateriDetail(int id) async {
     List<MateriDetailModel> detailMapel;
    var data = {"id": id, };
    final body = json.encode(data);
    final res = await http.post("http://ec2-34-203-236-133.compute-1.amazonaws.com/mapel/detailmapel", headers: {"Content-Type": "application/json"}, body: body);
    final resResult = json.decode(res.body);
    if (resResult['data'] != null) {
      detailMapel = (resResult['data'] as List)
          .map((data) => MateriDetailModel.fromJson(data))
          .toList();
      return detailMapel;
    } else {
      return null;
    }
  }


  

}