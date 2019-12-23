import 'dart:convert';

import 'package:etestt/Model/MateriModel.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final urlUtama = 'http://192.168.1.19:8000/';

  


  Future<List<MateriModel>> getListWeekly(
      ) async {
    final subUrl = "list_weekly_report_guru";
    List<MateriModel> listWeekly;
  //  final body = json.encode(data);
    final res = await http.get("http://192.168.1.19:8000//members/all");
    final resResult = json.decode(res.body);
    if (resResult['data'] != null) {
      listWeekly = (resResult['data'] as List)
          .map((data) => MateriModel.fromJson(data))
          .toList();
      return listWeekly;
    } else {
      return null;
    }
  }

}