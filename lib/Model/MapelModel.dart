class MapelModel {
  int id;
  String nama_mapel;
  String nama_kelas;
  String deskripsi;
  String created_at;
  String updated_at;
  

  MapelModel({this.id, this.nama_mapel, this.nama_kelas, this.deskripsi, this.created_at, this.updated_at});

  MapelModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        nama_mapel = map['nama_mapel'],
        nama_kelas = map['nama_kelas'],
        deskripsi = map['deskripsi'],
        created_at = map['created_at'],
        updated_at = map['updated_at'];
}
