// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_coffee_brew/models/brew.dart';
import 'package:flutter_coffee_brew/services/auth.dart';
import 'package:flutter_coffee_brew/services/database.dart';
import "package:provider/provider.dart";
import "package:flutter_coffee_brew/screens/home/brew_list.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      catchError: (_, __) {
        print("Error in StreamProvider in home.dart!");
        return [];
      },
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("Logout"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
