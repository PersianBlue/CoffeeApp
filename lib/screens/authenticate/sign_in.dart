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
  //text field state
  String email = "";
  String password = "";

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
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    setState(() => email = value);
                  }, //email field
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  obscureText: true,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
