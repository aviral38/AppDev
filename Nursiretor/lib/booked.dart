import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'button.dart';
final _auth = FirebaseAuth.instance;
final User user = _auth.currentUser;
final uid = user.uid;
final ref=FirebaseDatabase.instance.reference();
class booked extends StatefulWidget {
  @override
  _bookedState createState() => _bookedState();
}

class _bookedState extends State<booked> {
  @override
  String name,lis,hospital,test;
  Widget build(BuildContext context) {
    show();
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        height: 650,
        child: Card(
            margin: EdgeInsets.all(20),
            color: Color(0xff2fc3),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Details',
                  style: TextStyle(fontWeight: FontWeight.w900,
                  fontSize: 40),),
                  SizedBox(height: 10,),
                  Text('Name:'+name,
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 40),),
                  SizedBox(height: 10,),
                  Text('Liscense No:'+lis,
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 40),),
                  SizedBox(height: 10,),
                  Text('Hospital:'+hospital,
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 40),),
                  SizedBox(height: 10,),
                  Text('Corona Test:'+test,
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 40),),
                  SizedBox(height: 10,),
                  Center(
                    child: buttonn(
                      chilld: Text('Cancel booking'),
                      onpress: ()
                      {
                        Navigator.pushNamed(context, '/avail');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
      );
  }
  void show()
  {
    ref.child('booking').child(uid).child('Name').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        name = dataSnapshot.value;
      }

    });
    ref.child('booking').child(uid).child('liscense').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        lis = dataSnapshot.value;
      }

    });
    ref.child('booking').child(uid).child('hospital').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        hospital = dataSnapshot.value;
      }

    });
    ref.child('booking').child(uid).child('test').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        test = dataSnapshot.value;
      }

    });
  }
}
