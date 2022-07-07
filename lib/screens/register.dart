// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/services/auth.dart';
import 'package:flutter_coffee_brew/shared/constants.dart';

class Register extends StatefulWidget {
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
  String error = "";
  //create form key to track form state
  final _formKey = GlobalKey<FormState>();

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
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (val) => val!.isEmpty ? "Enter an email" : null,
                  onChanged: (value) {
                    setState(() => email = value);
                  }, //email field
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password"),
                  validator: (val) =>
                      val!.length < 6 ? "Enter a password 6+ chars long" : null,
                  onChanged: (value) {
                    setState(() => password = value);
                  }, //password field
                  obscureText: true,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  onPressed: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = "please supply a valid email");
                        }
                      }
                    } catch (e) {
                      setState(() => error = e.toString().split(']')[1]);
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ));
  }
}
