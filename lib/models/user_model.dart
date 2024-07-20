
class UserModel {
  final String name;
  final String userName;
  final String password;
  final String email;

  UserModel( {required this.email,required this.name, required this.userName, required this.password});
  

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'username': userName,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      userName: json['username'],
      password: json['password'],
    );
  }

}
