class UserModel {
  int? id;
  String? name;
  String? image;
  String? email;

  UserModel({
    this.id,
    this.name,
    this.image,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      email: json['email'],
    );
  }
}
