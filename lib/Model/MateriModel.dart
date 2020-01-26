import 'dart:convert';

class MateriModel {
  int idMateri;
  String idKelas;
  String namaMateri;
  String isiMateri;

  MateriModel({
   this.idKelas,
    this.idMateri,
     this.isiMateri,
    this.namaMateri,
  });

 factory MateriModel.fromJson(Map<String, dynamic> json)=> MateriModel(
    idMateri: json['idMateri'],
    idKelas: json['idKelas'],
    namaMateri: json['namaMateri'],
    isiMateri:  json['isiMateri']
  );
      
}
