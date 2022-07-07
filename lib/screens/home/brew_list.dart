// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:provider/provider.dart";

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    try {
      final brews = Provider.of<QuerySnapshot?>(context);
      if (brews != null) {
        for (var doc in brews.docs) {
          print("in the for loop");
          print(doc.data());
        }
      } //end if
    } catch (e) {
      print("Exception in BrewListState in brew_list.dart");
      print(e.toString());
    }
    return Container();
  }
}
