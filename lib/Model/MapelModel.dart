class MapelModel {
  int id;
  String idKelas;
  String idMapel;
  String nama_mapel;
  String nama_kelas;

  MapelModel({
    this.id,
    this.idKelas,
    this.idMapel,
    this.nama_mapel,
    this.nama_kelas,
  });

  MapelModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        idKelas = map['idKelas'],
        idMapel = map['idMapel'],
        nama_mapel = map['nama_mapel'],
        nama_kelas = map['nama_kelas'];
}
