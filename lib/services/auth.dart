// ignore_for_file: avoid_print

import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_coffee_brew/models/coffee_user.dart';
import 'package:flutter_coffee_brew/services/database.dart';

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //testing
      DatabaseService(uid: user!.uid)
          .updateUserData("0", "new member", 100)
          .then((response) => _userFromFirebaseUser(user))
          .catchError((error) {
        print(error);
        _userFromFirebaseUser(user);
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      DatabaseService(uid: user!.uid)
          .updateUserData("0", "new member", 100)
          .then((response) => _userFromFirebaseUser(user))
          .catchError((error) {
        print(error);
        _userFromFirebaseUser(user);
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
