import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nurseirator/update.dart';
import 'package:provider/provider.dart';
import 'button.dart';
final _auth=FirebaseAuth.instance;
final ref=FirebaseDatabase.instance.reference();
final user = _auth.currentUser;
var id=user.uid;
class Nursepage extends StatefulWidget {
  @override
  _nursepageState createState() => _nursepageState();
}

class _nursepageState extends State<Nursepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Consumer<update>(
        builder: (context,model,widget)=> Center(
          child: Column(
            children: [
              SizedBox(height: 80,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Booking Detail',style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                    SizedBox(height: 50,),
                    Text('Name:'+model.namep,style: TextStyle(fontSize: 30),),
                    SizedBox(height: 10,),
                    Text('Address:'+model.address,style: TextStyle(fontSize: 30),),
                    SizedBox(height: 10,),
                    Text('City:'+model.city,style: TextStyle(fontSize: 30),),
                    SizedBox(height: 10,),
                    Text('Email:'+model.email,style: TextStyle(fontSize: 30),),
                    SizedBox(height: 10,),
                    Text('Mobile No:'+model.phone,style: TextStyle(fontSize: 30),),
                    SizedBox(height: 10,),
                    Text('Gender:'+model.gender,style: TextStyle(fontSize: 30),),
                    SizedBox(height: 30,),
                    Center(
                      child: buttonn(
                        chilld: Text('Update Your Detail',style: TextStyle(fontSize: 20),),
                        onpress: ()
                        {
                          Navigator.pushNamed(context, '/nurse');
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
