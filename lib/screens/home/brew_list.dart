// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import 'package:flutter_coffee_brew/models/brew.dart';
import 'package:flutter_coffee_brew/screens/home/brew_tile.dart';
import "package:provider/provider.dart";

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context) ?? [];
    try {
      // brews.forEach((brew) {
      //   print(brew.name);
      //   print(brew.sugars);
      //   print(brew.strength);
      // });
      for (var brew in brews) {
        print(brew.name);
        print(brew.sugars);
        print(brew.strength);
      }
    } catch (e) {
      print("Exception in BrewListState in brew_list.dart");
      print(e.toString());
    }
    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTile(brew: brews[index]);
        });
  }
}
