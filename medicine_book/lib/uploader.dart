
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class uploader extends StatefulWidget {
  //const uploader({Key key, this.file}) : super(key: key);

  @override
  _uploaderState createState() => _uploaderState();
  final File file;
  uploader({Key key,this.file}):super(key:key);

}

class _uploaderState extends State<uploader> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

