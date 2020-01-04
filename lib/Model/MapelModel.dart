class MapelModel {
  int idMapel;
  String idKelas;
  String nama_mapel;
  
  MapelModel({
     this.idKelas,
    this.idMapel,
    this.nama_mapel,
  });

  MapelModel.fromJson(Map<String, dynamic> map)
      : idKelas = map['idKelas'],
        idMapel = map['idMapel'],
        nama_mapel = map['nama_mapel'];
}
