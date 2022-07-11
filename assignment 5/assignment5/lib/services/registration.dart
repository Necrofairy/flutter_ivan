
import 'package:assignment5/models/data_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Registration {
  Future<void> registration(
      DataAccount data) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      data.uid = credential.user!.uid;
      FirebaseDatabase database = FirebaseDatabase.instance;
      var ref = database.ref('accounts/${data.uid}');
      await ref.set({
        'nickname': data.nickname,
        'email': data.email,
        'password': data.password,
        'uid': data.uid
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
