class MateriDetailModel {
  int idMapel;
  String namaMapel;
  String namaMateri;
  String namaKelas;
  String isi;
  String file;
  String created_at;
  String updated_at;
  

  MateriDetailModel({this.idMapel, this.namaMapel, this.namaMateri, this.namaKelas, this.isi, this.file, this.created_at, this.updated_at});

  MateriDetailModel.fromJson(Map<String, dynamic> map)
      : idMapel = map['idMapel'],
        namaMapel = map['namaMapel'],
        namaMateri = map['namaMateri'],
        namaKelas = map['namaKelas'],
        isi = map['isi'],
        file = map['file'],
        created_at = map['created_at'],
        updated_at = map['updated_at'];
}