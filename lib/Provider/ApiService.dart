import 'dart:convert';

import 'package:etestt/Model/KelasMode.dart';
import 'package:etestt/Model/LoginResult.dart';
import 'package:etestt/Model/MapelModel.dart';
import 'package:etestt/Model/MateriDetailModel.dart';
import 'package:etestt/Model/MateriModel.dart';
import 'package:etestt/View/ListKelas.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final urlUtama = 'http://192.168.1.19:8000/';

  Future<List<MapelModel>> getMapelList(String idKelas) async {
    List<MapelModel> jurnal;
    var data = {
      "idKelas": idKelas,
    };
    final body = json.encode(data);
    print(body);
    final res = await http.post(
        "http://ec2-34-203-236-133.compute-1.amazonaws.com/mapel/getMapel",
        headers: {"Content-Type": "application/json"},
        body: body);
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

  Future<List<MateriModel>> getMateriList(String idKelas) async {
    List<MateriModel> materi;
    var data = {"idKelas": idKelas};
    final body = json.encode(data);
    print(body);
    final res = await http.post(
        "http://ec2-34-203-236-133.compute-1.amazonaws.com/mapel/getmateri",
        headers: {"Content-Type": "application/json"},
        body: body);
    final resResult = json.decode(res.body);
    print('ini data');
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

  Future<List<MateriModel>> getMateriDetail(int idMapel) async {
    List<MateriModel> detailMapel;
    var data = {
      "idMapel": idMapel,
    };
    final body = json.encode(data);
    final res = await http.post(
        "http://ec2-34-203-236-133.compute-1.amazonaws.com/mapel/detailmapel",
        headers: {"Content-Type": "application/json"},
        body: body);
    final resResult = json.decode(res.body);
    if (resResult['data'] != null) {
      detailMapel = (resResult['data'] as List)
          .map((data) => MateriModel.fromJson(data))
          .toList();
      return detailMapel;
    } else {
      return null;
    }
  }

  Future login(value) async {
    final body = json.encode(value);
    try {
      final response = await http
          .post("http://ec2-34-203-236-133.compute-1.amazonaws.com/login",
              headers: {"Content-Type": "application/json"}, body: body)
          .timeout(Duration(minutes: 1))
          .catchError((onError) => print(onError));

      print('response code ' + response?.statusCode.toString());
      if (response?.statusCode == 200) {
        final res = LoginResult.fromJson(json.decode(response.body));
        return res;
      }
    } catch (e) {
      print("=======================timeout======================");
      print(e);
      return null;
    }
  }

  Future<List<KelasModel_>> getKelas() async {
    List<KelasModel_> listKelas;
    final data = {"a": "a"};
    final body = json.encode(data);
    final res = await http.post(
        "http://ec2-34-203-236-133.compute-1.amazonaws.com/kelas/getkelas",
        headers: {"Content-Type": "application/json"},
        body: body);
    final resResult = json.decode(res.body);
    if (resResult['data'] != null) {
      final items = json.decode(res.body).cast<Map<String, dynamic>>();
      listKelas = items.map<KelasModel_>((json) {
        return KelasModel_.fromJson(json);
      }).toList();

      print('object');
      return listKelas;
    } else {
      return null;
    }
  }

   Future postMateri(String idKelas, String namaMateri, String isiMateri) async {
   
    final data = {
    "idKelas": idKelas,
      "namaMateri": namaMateri,
      "isiMateri": isiMateri
    };
    final body = json.encode(data);
    print("Ini Tahu");
    print(body);
    final response = await http.post(
        "http://ec2-34-203-236-133.compute-1.amazonaws.com/postMateri",
        headers: {"Content-Type": "application/json"},
        body: body);

    if (response.statusCode == 200) {
      final res = MateriModel.fromJson(json.decode(response.body));
      return res;
    } else {
      return null;
    }
  }
}
