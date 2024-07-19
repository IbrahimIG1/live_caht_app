class UserModel {
  final String name;
  final String userName;
  final String password;

  UserModel({required this.name, required this.userName, required this.password});
  

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'username': userName,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      userName: json['username'],
      password: json['password'],
    );
  }

}
