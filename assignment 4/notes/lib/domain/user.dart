import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserID {
  late String _id;

  UserID.fromFirebase(User user) {
    _id = user.uid;
  }

  UserID.fromGoogle(GoogleSignInAccount account) {
    _id = account.id;
  }

  String get getID {
    return _id;
  }

  UserID(String id) : _id = id;

  void setID(String id) {
    _id = id;
  }

}
