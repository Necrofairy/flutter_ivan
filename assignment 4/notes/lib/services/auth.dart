import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/domain/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var signInWithEmailAndPassword = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var user = signInWithEmailAndPassword.user;
      return UserID.fromFirebase(user as User);
    } catch (e) {
      return null;
    }
  }
  Future handleSignIn() async {
    try {
      var account = await _googleSignIn.signIn();
      if (account != null) {
        return UserID.fromGoogle(account);
      }
      return null;
    } catch (error) {
      return null;
    }
  }
}
