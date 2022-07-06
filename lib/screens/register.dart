// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/services/auth.dart';

class Register extends StatefulWidget {
  // Register({Key? key}) : super(key: key);

  final Function toggleView;

  Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          title: Text("Sign up to Brew Crew"),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign In"),
            ),
          ],
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
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
