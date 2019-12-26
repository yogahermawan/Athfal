class MateriModel {
  int id;
  String idMapel;
  String idMateri;
  String idKelas;
  String namaKelas;
  String namaMateri;
  String deskripsi;
  

  MateriModel({this.id, this.idMapel, this.idMateri, this.idKelas, this.deskripsi, this.namaKelas, this.namaMateri,});

  MateriModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        idMapel = map['idMapel'],
        idMateri = map['idMateri'],
        idKelas = map['idKelas'],
        deskripsi = map['deskripsi'],
        namaKelas = map['namaKelas'],
        namaMateri = map['namaMateri'];
}
