import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/domain/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
  GoogleSignInAccount? googleUser;

  Future<UserCredential> signInWithGoogle() async {
    googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOutGoogle() async {
    googleUser = await GoogleSignIn().signOut();
  }

}
