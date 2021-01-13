import 'package:flutter/material.dart';
import 'package:photo/formText.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
class med_upload extends StatefulWidget {
  @override
  _med_uploadState createState() => _med_uploadState();
}

class _med_uploadState extends State<med_upload> {
  String med_name='';
  bool capsule=false,syrup=false,strain=false,bandaid=false;
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
      _imageFile = cropped;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pharm.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Row(children: [
              Text('Medicine Name:',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              form(hinttext: 'Enter medicine name',onchange: (value){setState(() {
                med_name=value;
              });},
              width: 150,)
            ],
            ),
            Row(children: [
              Text('Medicine Type:',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              Text('Capsule',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
              Checkbox(value: capsule, onChanged: (bool value){setState(() {
                capsule=value;
                if(capsule=true)
                  {
                    strain=false;
                    syrup=false;
                    bandaid=false;
                  }
              });}),
            ],),
            Row(children: [
              SizedBox(width: 200,),
              Text('Syrup',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(width: 20,),
              Checkbox(value: syrup, onChanged: (bool value){setState(() {
                syrup=value;
                if(syrup=true)
                {
                  strain=false;
                  capsule=false;
                  bandaid=false;
                }
              });}),

            ],),
            Row(children: [
              SizedBox(width: 200,),
              Text('Strain Fitness',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(width: 5,),
              Checkbox(value: strain, onChanged: (bool value){setState(() {
                strain=value;
                if(strain=true)
                {
                  capsule=false;
                  syrup=false;
                  bandaid=false;
                }
              });}),

            ],),
            Row(children: [
              SizedBox(width: 200,),
              Text('Bandaid',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(width: 20,),
              Checkbox(value: bandaid, onChanged: (bool value){setState(() {
                bandaid=value;
                if(bandaid=true)
                {
                  strain=false;
                  syrup=false;
                  capsule=false;
                }
              });}),

            ],),
            Container(
              height: 250,
              width: 250,
              child: _imageFile == null
                  ? Image(image: AssetImage('images/wall.png'),height: 200,width:200,fit: BoxFit.cover,)
                  : Image.file(_imageFile,height: 200,width: 200,fit: BoxFit.cover,),
            ),
            Row(
              children: [
                SizedBox(width: 50,),
                FlatButton(
                  child: Text('camera'),
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                SizedBox(width: 30,),
                FlatButton(
                  child: Text('Gallery'),
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                SizedBox(width: 30,),
                FlatButton(
                  child: Text('Crop Image'),
                  onPressed: () {
                    _cropImage();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
            FlatButton(
              child: Text('Submit'),
              onPressed: () {
                print("submitted");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
            ),
          ],

        ),
      ),
    );
  }
}
