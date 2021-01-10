import 'package:flutter/material.dart';
import 'package:nurseirator/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nurseirator/medicine.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'update.dart';
class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}
final _auth=FirebaseAuth.instance;
final ref=FirebaseDatabase.instance.reference();
bool showSpinner = false;
String email;
String password;
String role='Patient';
class _loginScreenState extends State<loginScreen> {
  List roole = ['Doctor', 'Nurse', 'Patient'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  child: Flexible(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('image/doc.jpg'),
                    ),
                  ),
                ),
                Text('Nurseirator',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 40),),
                TextField(
                  onChanged: (value) {
                    email=value;
                  },
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black87),
                    hintText: 'Enter email id',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password=value;
                  },
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black87),
                    hintText: 'Enter Your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Row(
                    children: [
                      Text(
                        'Role',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2.0)),
                          child: DropdownButton(
                              hint: Text('Enter your Role'),
                              dropdownColor: Colors.grey,
                              elevation: 5,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              value: role,
                              onChanged: (value) {
                                setState(() {
                                  role = value;
                                });
                              },
                              items: roole.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Consumer<update>(
                  builder: (context,model,widget)=> buttonn(
                    colour: Colors.lightBlue,
                    chilld: Text('LogIn'),
                    onpress: () async{
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null){
                          final User user = _auth.currentUser;
                          var uid = user.uid;
                          if (role == 'Patient') {
                            ref.child('patient').child(uid).once().then((DataSnapshot dataSnapshot) {
                              if(dataSnapshot.value!=null) {
                                void data() async{
                                  await model.up();
                                  Navigator.pushNamed(context, '/medical');
                                  //print('uid is'+uid+'2nd is'+model.uid);
                                  //print('iii'+uid);
                                }
                                data();
                              }
                              else{
                                dialog('The Role Selected is Wrong');
                                print(false);
                              }

                            });
                          }
                          else if (role == 'Nurse') {
                            ref.child('nurse').child(uid).once().then((DataSnapshot dataSnapshot) {
                              if(dataSnapshot.value!=null) {
                                void datta() async{
                                  await model.nameof();
                                  await model.nursedetail();
                                  Navigator.pushNamed(context, '/page');
                                  //print('uid is'+uid+'2nd is'+model.uid);
                                  //print('iii'+uid);
                                }
                                datta();
                              }
                              else{
                                dialog('The Role Selected is Wrong');
                                print(false);
                              }

                            });
                          }
                          else {
                            ref.child('doctor').child(uid).once().then((DataSnapshot dataSnapshot) {
                              if(dataSnapshot.value!=null) {
                                Navigator.pushNamed(context, '/nurse');
                              }
                              else{
                                dialog('The Role Selected is Wrong');
                                print(false);
                              }

                            });
                          }
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch (e) {
                        dialog(e.toString());
                        print(e);

                        setState(() {
                          showSpinner = false;
                        });
                      }

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
  Future<void> dialog(var a) async{
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(a),
            elevation: 24.0,
          );
        });
  }

}