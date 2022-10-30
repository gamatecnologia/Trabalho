class ProfileModel {
  String? id;
  String? name;
  String? email;

  ProfileModel({this.email, this.id, this.name});

  ProfileModel.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
