import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nurseirator/button.dart';
import 'package:nurseirator/update.dart';
import 'package:provider/provider.dart';
class medical extends StatefulWidget {
  @override
  _medicalState createState() => _medicalState();
}
final _auth = FirebaseAuth.instance;
final User user = _auth.currentUser;
final ref=FirebaseDatabase.instance.reference();
final update u=new update();
class _medicalState extends State<medical> {
  @override
  void initState()
  {
    super.initState();
    print('hello');
  }
  @override
  Widget build(BuildContext context) {
    final update uu=Provider.of<update>(context);
    //Provider.of<update>(context).up();
    var monu=uu.mon,tue=uu.tue,wed=uu.wed,thu=uu.thu,fri=uu.fri,sat=uu.sat,sun=uu.sun;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Consumer<update>(
        builder: (context,model,widget)=> ListView(
          children: [
            Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                  decoration: BoxDecoration(border: Border.all(),
                  color: Colors.grey),
                  child: Column(
                    children: [
                      Text('Monday',
                      style: TextStyle(fontSize: 50,
                      fontWeight: FontWeight.bold),),
                      Text(model.mon,style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
            ),
            Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(border: Border.all(),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Tuesday',
                      style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    Text(tue,style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(border: Border.all(),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Wednesday',
                      style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    Text(wed,style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(border: Border.all(),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Thursday',
                      style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    Text(thu,style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(border: Border.all(),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Friday',
                      style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    Text(fri,style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(border: Border.all(),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Saturday',
                      style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    Text(sat,style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width:320,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                decoration: BoxDecoration(border: Border.all(),
                    color: Colors.grey),
                child: Column(
                  children: [
                    Text('Sunday',
                      style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold),),
                    Text(sun,style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 50,
              child: buttonn(
                colour: Colors.orangeAccent,
                onpress: (){
                  Navigator.pushNamed(context, '/patient');
                },
                chilld: Text("Update Medicines",
                  style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 30),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 50,
              child: buttonn(
                colour: Colors.orangeAccent,
                onpress: (){
                  Navigator.pushNamed(context, '/avail');
                },
                chilld: Text("Book Nurse",
                style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 30),),
              ),
            ),

          ],

        ),
      ),
    );
  }
  void dat() async{
    await u.up();
  }
 /* void dataa()
  {
    User user = _auth.currentUser;
    var uid = user.uid;
    print(uid);
    ref.child('Medi').child(uid).child('Monday').once().then((DataSnapshot dataSnapshot) {
      mon=dataSnapshot.value;

    });
    ref.child('Medi').child(uid).child('Tuesday').once().then((DataSnapshot dataSnapshot) {
      tue=dataSnapshot.value;

    });
    ref.child('Medi').child(uid).child('Wednesday').once().then((DataSnapshot dataSnapshot) {
      wed=dataSnapshot.value;

    });
    ref.child('Medi').child(uid).child('Thursday').once().then((DataSnapshot dataSnapshot) {
      thu=dataSnapshot.value;

    });
    ref.child('Medi').child(uid).child('Friday').once().then((DataSnapshot dataSnapshot) {
      fri=dataSnapshot.value;

    });
    ref.child('Medi').child(uid).child('Saturday').once().then((DataSnapshot dataSnapshot) {
      sat=dataSnapshot.value;

    });
    ref.child('Medi').child(uid).child('Sunday').once().then((DataSnapshot dataSnapshot) {
      sun=dataSnapshot.value;

    });
  }*/
  /*void dat() async{
    User user = _auth.currentUser;
    var uid = user.uid;
    print(uid);
    ref.child('Medi').child(uid).child('Monday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        mon = dataSnapshot.value;
      }

    });
    ref.child('Medi').child(uid).child('Tuesday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        tue = dataSnapshot.value;
      }

    });
    ref.child('Medi').child(uid).child('Wednesday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        wed = dataSnapshot.value;
      }

    });
    ref.child('Medi').child(uid).child('Thursday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        thu = dataSnapshot.value;
      }

    });
    ref.child('Medi').child(uid).child('Friday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        fri = dataSnapshot.value;
      }

    });
    ref.child('Medi').child(uid).child('Saturday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        sat = dataSnapshot.value;
      }

    });
    ref.child('Medi').child(uid).child('Sunday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null)
      {
        sun=dataSnapshot.value;
      }

    });
    setState(() {
      ref.child('Medi').child(uid).child('Monday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null) {
          mon = dataSnapshot.value;
        }

      });
      ref.child('Medi').child(uid).child('Tuesday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null) {
          tue = dataSnapshot.value;
        }

      });
      ref.child('Medi').child(uid).child('Wednesday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null) {
          wed = dataSnapshot.value;
        }

      });
      ref.child('Medi').child(uid).child('Thursday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null) {
          thu = dataSnapshot.value;
        }

      });
      ref.child('Medi').child(uid).child('Friday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null) {
          fri = dataSnapshot.value;
        }

      });
      ref.child('Medi').child(uid).child('Saturday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null) {
          sat = dataSnapshot.value;
        }

      });
      ref.child('Medi').child(uid).child('Sunday').once().then((DataSnapshot dataSnapshot) {
        if(dataSnapshot.value!=null)
        {
          sun=dataSnapshot.value;
        }

      });

    });
  }*/

}
