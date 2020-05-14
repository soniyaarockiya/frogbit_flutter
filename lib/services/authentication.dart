import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  //These methods are implemented in AUTH class for abstraction

  Future<String> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    final FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
