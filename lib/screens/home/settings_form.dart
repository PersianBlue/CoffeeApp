// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, avoid_print

import 'package:flutter_coffee_brew/models/coffee_user.dart';
import 'package:flutter_coffee_brew/services/database.dart';
import 'package:flutter_coffee_brew/shared/constants.dart';
import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values

  String _currentName = "";
  String _currentSugars = "";
  int _currentStrength = 100;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CoffeeUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data!;
            return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Update your brew settings.",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.name,
                      decoration: textInputDecoration,
                      validator: (val) =>
                          val!.isEmpty ? "Please enter a name" : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(height: 20.0),
                    //dropdown
                    DropdownButtonFormField(
                      value: (_currentSugars == "")
                          ? userData.sugars
                          : _currentSugars,
                      decoration: textInputDecoration,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text("$sugar sugar(s)"),
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() => _currentSugars = val!);
                      },
                    ),
                    //slider
                    Slider(
                      value: (_currentStrength == 100.0
                              ? _currentStrength
                              : userData.strength)
                          .toDouble(),
                      activeColor: Colors.brown[_currentStrength],
                      inactiveColor: Colors.brown[_currentStrength],
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      onChanged: (val) =>
                          setState(() => _currentStrength = val.round()),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[400],
                      ),
                      onPressed: () async {
                        print(_currentName);
                        print(_currentSugars);
                        print(_currentStrength);
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ));
          } else {
            return Loading();
          }
        });
  }
}
