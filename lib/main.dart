// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_brew/firebase_options.dart';
import 'package:flutter_coffee_brew/models/coffee_user.dart';
import 'package:flutter_coffee_brew/screens/wrapper.dart';
import 'package:flutter_coffee_brew/services/auth.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
void main() async {
  print("Loading firebase....");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase has been initialized");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CoffeeUser?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (_, __) {
        return null;
      },
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
