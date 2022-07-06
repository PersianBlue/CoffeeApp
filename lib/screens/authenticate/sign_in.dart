// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/services/auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text("Sign in to Brew Crew"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: ElevatedButton(
                child: Text("Sign in anonymously"),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("Error signing in");
                  } else {
                    print("Signed in");
                    print(result);
                  }
                })));
  }
}
