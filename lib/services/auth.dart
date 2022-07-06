// ignore_for_file: avoid_print

import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_coffee_brew/models/coffee_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create CoffeeUser obj based on Firebase User
  CoffeeUser _userFromFirebaseUser(User user) {
    return CoffeeUser(uid: user.uid);
  }

  //auth change user stream
  Stream<CoffeeUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and passowrd

  //register with email and password

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
