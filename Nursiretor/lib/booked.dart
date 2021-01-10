import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'button.dart';
import 'package:provider/provider.dart';
import 'package:nurseirator/update.dart';
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
    /*final update u=Provider.of<update>(context);
    name=u.name;
    lis=u.lis;
    hospital=u.hospital;
    test=u.test;*/
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Consumer<update>(
        builder: (context,model,widget)=>Container(
          height: 650,
          child: Card(
              margin: EdgeInsets.all(20),
              color: Color(0xff8AC7DB),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('Booking Details',
                    style: TextStyle(fontWeight: FontWeight.w900,
                    fontSize: 40),),
                    SizedBox(height: 10,),
                    Text('Name:'+model.name,
                      style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 40),),
                    SizedBox(height: 10,),
                    Text('Liscense No:'+model.lis,
                      style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 40),),
                    SizedBox(height: 10,),
                    Text('Hospital:'+model.hospital,
                      style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 40),),
                    SizedBox(height: 10,),
                    Text('Corona Test:'+model.test,
                      style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 40),),
                    SizedBox(height: 30,),
                    Center(
                      child: buttonn(
                        chilld: Text('Cancel booking'),
                        onpress: () async{
                          await cancel();
                          Navigator.pushNamed(context, '/avail');
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: buttonn(
                        chilld: Text('View Medicines'),
                        onpress: () async{
                          await cancel();
                          Navigator.pushNamed(context, '/medical');
                        },
                      ),
                    ),
                  ],
                ),
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
  void cancel()
  {
    ref.child("booking").child(uid).set({
      'Name': "Na",
      'liscense':"NA",
      'test':"NA",
      'hospital':"NA",
      'uid': "NA",
      'book':"NA",
    });
  }
}
