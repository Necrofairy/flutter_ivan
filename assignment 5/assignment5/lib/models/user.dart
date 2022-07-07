import 'dart:collection';

class User {
  String email;
  String password;
  String nickname;
  String  uid;

  User({required this.email, required this.password,
    required this.nickname, required this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], password: json['password'], nickname: json['nickname'], uid: json['uid']);
  }


}