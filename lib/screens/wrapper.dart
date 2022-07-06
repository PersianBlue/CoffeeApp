// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/models/coffee_user.dart';
import 'package:flutter_coffee_brew/screens/authenticate/authenticate.dart';
import 'package:flutter_coffee_brew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CoffeeUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
