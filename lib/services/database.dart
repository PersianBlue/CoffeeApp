// ignore_for_file: avoid_print

import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  String uid = "";
  DatabaseService(this.uid);
  // collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");
  Future<void> updateUserData(String sugars, String name, int strength) async {
    await brewCollection.doc(uid).set({
      "sugars": sugars,
      "name": name,
      "strength": strength,
    });
    print("User data has been set");
  }
}
