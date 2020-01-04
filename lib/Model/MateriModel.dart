class MateriModel {
  int idMateri;
  // String idMapel;
 String namaFile;
  String namaMateri;
  String deskripsi;

  MateriModel({
  //  this.idMapel,
    this.idMateri,
    this.namaFile,
     this.deskripsi,
    this.namaMateri,
  });

  MateriModel.fromJson(Map<String, dynamic> map)
      : //idMapel = map['idMapel'],
        idMateri = map['idMateri'],
      namaFile = map['namaFile'],
       deskripsi = map['deskripsi'],
        namaMateri = map['namaMateri'];
}
