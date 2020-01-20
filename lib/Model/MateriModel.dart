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

  MateriModel.fromJson(Map<String, dynamic> map)
      : idKelas = map['idKelas'],
        idMateri = map['idMateri'],
        isiMateri = map['isiMateri'],
        namaMateri = map['namaMateri'];
}
