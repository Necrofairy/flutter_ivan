class DataAccount {
  String email;
  String password;
  String nickname;
  String uid;

  DataAccount({required this.email,
    required this.password,
    required this.nickname,
    required this.uid});


  factory DataAccount.fromJson(Map<String, dynamic> json) {
    return DataAccount(email: json['email'],
        password: json['password'],
        nickname: json['nickname'],
        uid: json['uid']);
  }
}