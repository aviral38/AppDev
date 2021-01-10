import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
String text='not uploaded';
class image extends StatefulWidget {
  @override
  final File filee;

  image({Key key, this.filee}) : super(key: key);

  _imageState createState() => _imageState();
}

class _imageState extends State<image> {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  File _imageFile;
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
    );
    setState(() {
      _imageFile=cropped;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }
  void p(){
    setState(() {
      text='upload done';
    });
  }
  /*final firebase_storage.FirebaseStorage _storage=firebase_storage.FirebaseStorage(storageBucket: 'gs://image-24372.appspot.com');
  firebase_storage.UploadTask _uploadTask;
  void _startupload()
  {
    String filepath='images/${DateTime.now()}.png';
    setState(() {
      _uploadTask=_storage.ref().child(filepath).putFile(_imageFile);
      text='upload done';
    });
  }*/
  Future uploadpic(BuildContext context)
  {
    String filepath='images/${DateTime.now()}.png';
    firebase_storage.Reference _storage=firebase_storage.FirebaseStorage.instance.ref().child(filepath);
    firebase_storage.UploadTask _uploadtask=_storage.putFile(_imageFile);
    setState(() {
     // _uploadTask=_storage.ref().child(filepath).putFile(_imageFile);
      text='upload done';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: _imageFile==null?Text('hello'):Image.file(_imageFile),
              ),
              IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
              ),
              IconButton(icon: Icon(Icons.crop),
              onPressed: _cropImage,),
              Container(
                height: 60,
                width: 60,
                child: FlatButton(
                  child: Icon(Icons.album),
                  onPressed: (){uploadpic(context);
                  },
                ),
              ),
              Text(text,style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
