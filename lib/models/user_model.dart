class UserModel {
  final String email;
  final String userName;
  final String name;

  const UserModel({
    required this.email,
    required this.name,
    required this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        userName: json['username'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'username': userName,
      };
}
