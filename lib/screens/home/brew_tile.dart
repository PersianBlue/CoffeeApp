// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter_coffee_brew/models/brew.dart';
import "package:flutter/material.dart";

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({Key? key, required this.brew}) : super(key: key);

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[brew.strength],
            ),
            title: Text(brew.name),
            subtitle: Text("Takes ${brew.sugars} sugar(s)"),
          ),
        ));
  }
}
