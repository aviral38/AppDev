import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
final _auth = FirebaseAuth.instance;
final User user = _auth.currentUser;
final ref=FirebaseDatabase.instance.reference();
final uid = user.uid;
class update extends ChangeNotifier{
  var mon="NA",tue="NA",wed="NA",thu="NA",fri="NA",sat="NA",sun="NA";
  String name="NA",lis="NA",hospital="NA",test="NA",address="No current booking",city="No current booking",email="No current booking",gender="No current booking",phone="No current booking",namep="No current booking";
  String nursename;
  void show()async
  {
    await ref.child('booking2').child(uid).child('Name').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        this.name = dataSnapshot.value;
      }

    });
    await ref.child('booking2').child(uid).child('liscense').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        this.lis = dataSnapshot.value;
      }

    });
    await ref.child('booking2').child(uid).child('hospital').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        this.hospital = dataSnapshot.value;
      }

    });
    await ref.child('booking2').child(uid).child('test').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        this.test = dataSnapshot.value;
      }

    });
    await notifyListeners();
  }
  void up()async
  {
    await ref.child('Medi').child(uid).child('Monday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        print('val is'+dataSnapshot.value);
        this.mon = dataSnapshot.value;
      }
      else{
        print('value is  null');
      }

    });
    await ref.child('Medi').child(uid).child('Tuesday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        tue = dataSnapshot.value;
      }

    });
    await ref.child('Medi').child(uid).child('Wednesday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        wed = dataSnapshot.value;
      }

    });
    await ref.child('Medi').child(uid).child('Thursday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        thu = dataSnapshot.value;
      }

    });
    await ref.child('Medi').child(uid).child('Friday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        fri = dataSnapshot.value;
      }

    });
    await ref.child('Medi').child(uid).child('Saturday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        sat = dataSnapshot.value;
      }

    });
    await ref.child('Medi').child(uid).child('Sunday').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null)
      {
        sun=dataSnapshot.value;
      }

    });

    await notifyListeners();
  }
  void nursedetail()async
  {
    await ref.child('booking').child(nursename).child('uid').once().then((DataSnapshot dataSnapshot) async{
      if(dataSnapshot.value!=null) {
        ref.child('patient').child(dataSnapshot.value).child('Address').once().then((DataSnapshot Snapshot) {
          if(Snapshot.value!=null) {
            this.address=Snapshot.value;
          }
          else{
            print('hfguvkj');
          }

        });
        ref.child('patient').child(dataSnapshot.value).child('City').once().then((DataSnapshot Snapshot) {
          if(Snapshot.value!=null) {
            this.city=Snapshot.value;
          }

        });
        ref.child('patient').child(dataSnapshot.value).child('Email').once().then((DataSnapshot Snapshot) {
          if(Snapshot.value!=null) {
            this.email=Snapshot.value;
          }

        });
        ref.child('patient').child(dataSnapshot.value).child('Gender').once().then((DataSnapshot Snapshot) {
          if(Snapshot.value!=null) {
            this.gender=Snapshot.value;
          }

        });
        ref.child('patient').child(dataSnapshot.value).child('Phone No').once().then((DataSnapshot Snapshot) {
          if(Snapshot.value!=null) {
            this.phone=Snapshot.value;
          }

        });
        await ref.child('patient').child(dataSnapshot.value).child('Name').once().then((DataSnapshot Snapshot) {
          if(Snapshot.value!=null) {
            this.namep=Snapshot.value;
          }
          else{
            this.namep='Na';
          }

        });
      }
      else{
        print('value is  null');
      }

    });

    await notifyListeners();
  }
  void nameof()async
  {
    await ref.child('available').child(uid).child('name').once().then((DataSnapshot dataSnapshot) {
      if(dataSnapshot.value!=null) {
        this.nursename = dataSnapshot.value;
        print('muoy is'+this.nursename);
      }
      else{
        print('no  nurse');
      }
    });
  }

}