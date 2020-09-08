import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: CircleAvatar(backgroundColor: Colors.white,
                  child: Icon(Icons.list)),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 30),
                child: Text(
                  'ToDO',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.only(left: 30),
                child:Text('4 Tasks',
                style: TextStyle(fontSize: 30),),
              ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
                child: ListView(
                  children: [
                    Text('hwllo'),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
