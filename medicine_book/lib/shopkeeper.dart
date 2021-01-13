import 'package:flutter/material.dart';
import 'formText.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class shop_reg extends StatefulWidget {
  @override
  _shop_regState createState() => _shop_regState();
}

class _shop_regState extends State<shop_reg> {
  String name = '', shop_name = '', address = '', pincode = '';
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
      type: MaterialType.transparency,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wallpaper.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Name:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
                form(
                  width: 250,
                  hinttext: 'Enter Full Name',
                  onchange: (String value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Shop Name:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                form(
                  width: 250,
                  hinttext: 'Enter Shop Name',
                  onchange: (String value) {
                    setState(() {
                      shop_name = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Address:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
                form(
                  width: 250,
                  hinttext: 'Enter Shop Address',
                  onchange: (String value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Pincode:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
                Container(
                  width: 250,
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      cursorColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          pincode = value;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(height: 25,),
            ClipOval(
                child: _imageFile == null
                    ? Image(image: AssetImage('images/wall.png'),height: 200,width:200,fit: BoxFit.cover,)
                    : Image.file(_imageFile,height: 200,width: 200,fit: BoxFit.cover,)),
            SizedBox(height: 25,),
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
