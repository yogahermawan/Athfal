class MateriModel {
  int id;
  String name;
  String email;

  MateriModel(
      {this.id,
        this.name,
        this.email,});

  MateriModel.fromJson(Map<String, dynamic> map) :
  id = map['id'],
  name = map['name'],
  email = map['email'];

}
