// import 'dart:convert';

// import 'package:flutter/cupertino.dart';

class KelasModel_ {
  String idKelas;
  String namaKelas;

  KelasModel_({this.idKelas, this.namaKelas});

  KelasModel_.fromJson(Map<String, dynamic> map)
      : idKelas = map['idKelas'],
       namaKelas = map['namaKelas']
        ;


}
