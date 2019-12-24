class MateriModel {
  int id;
  String namaMapel;
  String idMateri;
  String namaKelas;
  String namaMateri;
  String deskripsi;
  

  MateriModel({this.id, this.namaMapel, this.idMateri, this.deskripsi, this.namaKelas, this.namaMateri,});

  MateriModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        namaMapel = map['namaMapel'],
        idMateri = map['idMateri'],
        deskripsi = map['deskripsi'],
        namaKelas = map['namaKelas'],
        namaMateri = map['namaMateri'];
}
