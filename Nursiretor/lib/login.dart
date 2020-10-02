import 'package:flutter/material.dart';
import 'package:nurseirator/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nurseirator/medicine.dart';
import 'package:firebase_database/firebase_database.dart';
class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}
final _auth=FirebaseAuth.instance;
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
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
                buttonn(
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
                        if (role == 'Patient') {
                          Navigator.pushNamed(context, '/patient');
                        }
                        else if (role == 'Nurse') {
                          Navigator.pushNamed(context, '/nurse');
                        }
                        else {
                          Navigator.pushNamed(context, '/nurse');
                        }
                        print('done');
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    }
                    catch (e) {
                      print(e);
                      setState(() {
                        showSpinner = false;
                      });
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}