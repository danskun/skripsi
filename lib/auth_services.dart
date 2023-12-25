import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseAuth?> signInAnymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      FirebaseAuth firebaseUser = result.user as FirebaseAuth;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }
}
