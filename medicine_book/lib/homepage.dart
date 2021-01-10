import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo/button.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF473F97),
      appBar: AppBar(
        title: Text(
          'MedBook',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(
            border: Border.all(width: 0),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Column(
          children: [
            Text(
              'Categories',
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
            Row(
              children: [
                imgButton(
                  onpress: () {
                    print('capsule pressed');
                  },
                  img: Image(
                    image: AssetImage('images/capsule.png'),
                    height: 150,
                    width: 150,
                  ),
                ),
                imgButton(
                  onpress: () {
                    print('Syrup pressed');
                  },
                  img: Image(
                    image: AssetImage('images/syrup.png'),
                    height: 150,
                    width: 150,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                imgButton(
                  onpress: () {
                    print('bandaid pressed');
                  },
                  img: Image(
                    image: AssetImage('images/bandaid.png'),
                    height: 150,
                    width: 150,
                  ),
                ),
                imgButton(
                  onpress: () {
                    print('Syrup pressed');
                  },
                  img: Image(
                    image: AssetImage('images/strain.png'),
                    height: 150,
                    width: 150,
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
