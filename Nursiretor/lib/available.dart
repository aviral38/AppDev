import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nurseirator/button.dart';
import 'package:nurseirator/button.dart';
import 'booked.dart';
import 'data.dart';
import 'package:nurseirator/update.dart';
import'package:provider/provider.dart';
final _auth = FirebaseAuth.instance;
final User user = _auth.currentUser;
final uid = user.uid;
final ref=FirebaseDatabase.instance.reference();

class avail extends StatefulWidget {
  @override
  _availState createState() => _availState();
}

class _availState extends State<avail> {
  List<Data> datalist=[];
  void initState()
  {
    DatabaseReference db=FirebaseDatabase.instance.reference().child("available");
    db.once().then((DataSnapshot snap){
      datalist.clear();
      var keys=snap.value.keys;
      var values=snap.value;
      for(var key in keys)
      {
        Data data=new Data(
            lis:values[key]['License'],test: values[key]['corona test'],from: values[key]['from'],to: values[key]['to'],hos: values[key]['hospital'],name: values[key]['name'],id: values[key]['id']
        );
        datalist.add(data);

      }
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final update u=Provider.of<update>(context);
    print(datalist.length);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: datalist.length==null?Text("No nurse Avilable"):ListView.builder(
      itemCount: datalist.length,
          itemBuilder: (_,index){
        return Card(margin: EdgeInsets.all(20),
          color: Color(0xff2fc3),
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(1.5),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Name:",
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    Text(datalist[index].name,
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("License No:",
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    Text(datalist[index].lis,
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [Text("Hospital:",
                    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                    Text(datalist[index].hos,
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Available From",
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Text(datalist[index].from.substring(0,2)+":"+datalist[index].from.substring(2),
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    Text(" To ",
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    Text(datalist[index].to.substring(0,2)+":"+datalist[index].to.substring(2),
                      style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Consumer<update>(
                  builder: (context,model,widget)=>buttonn(
                    colour: Colors.grey,
                    onpress:  () async{
                      await updated(datalist[index].lis,datalist[index].test,datalist[index].hos,datalist[index].name,datalist[index].id);
                      await book(datalist[index].lis,datalist[index].test,datalist[index].hos,datalist[index].name,datalist[index].id);
                      await model.show();
                      Navigator.pushNamed(context, '/book');

                    },
                    chilld: Text('Book Now'),),
                )
              ],
            ),
          ),);
      }),
    );
  }
  void updated(String lis,String test,String hos,String name,String id)async
  {
    await ref.child("booking").child(name).set({
      'Name': name,
      'liscense':lis,
      'test':test,
      'hospital':hos,
      'uid': uid,
      'book':id,
    });
  }
  void book(String lis,String test,String hos,String name,String id)async
  {
    await ref.child("booking2").child(uid).set({
      'Name': name,
      'liscense':lis,
      'test':test,
      'hospital':hos,
      'uid': uid,
      'book':id,
    });
  }

}

