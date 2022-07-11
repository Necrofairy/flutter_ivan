import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/data_account.dart';

class Auth {
  Future<void> auth(DataAccount data) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: data.email, password: data.password);
      FirebaseDatabase database = FirebaseDatabase.instance;
      var ref = database.ref('accounts/${credential.user?.uid}');
      var snapshot = await ref.get();
      var json = jsonEncode(snapshot.value);
      Map<String, dynamic> map = jsonDecode(json);
      DataAccount user = DataAccount.fromJson(map);
      data.nickname = user.nickname;
      data.uid = user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

}