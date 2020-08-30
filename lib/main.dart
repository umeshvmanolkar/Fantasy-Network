import 'package:fantasy_network/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'LoginRegisterPage.dart';
import 'HomePage.dart';
import 'Mapping.dart';
import 'Authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new FantasyApp());
}

class FantasyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Fantasy Network",
        theme: new ThemeData(primarySwatch: Colors.deepOrange),
        home: MappingPage(
          auth: Auth(),
        ));
  }
}
