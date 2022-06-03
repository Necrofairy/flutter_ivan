import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserID {
  late String id;

  UserID.fromFirebase(User user) {
    id = user.uid;
  }

  UserID.fromGoogle(GoogleSignInAccount account) {
    id = account.id;
  }
}