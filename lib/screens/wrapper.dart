// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/screens/authenticate/authenticate.dart';
import 'package:flutter_coffee_brew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Return either name or Authenticate Widget
    return Authenticate();
  }
}
