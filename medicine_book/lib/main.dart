import 'package:flutter/material.dart';
import 'package:photo/homepage.dart';
import 'image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'shopkeeper.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: shop_reg(),
    );
  }
}

