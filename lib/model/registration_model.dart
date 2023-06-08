class RegistrationModel {
  String? imageLink;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegistrationModel({
    this.imageLink,
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     imageLink: json['image'],
  //     name: json['name'],
  //     email: json['email'],
  //     password: json['password'],
  //     passwordConfirmation: json['password_confirmation'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'image': imageLink,
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'password_confirmation': passwordConfirmation,
  //   };
  // }
}
