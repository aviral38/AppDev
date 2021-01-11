import 'package:flutter/material.dart';
import 'formText.dart';
class shop_reg extends StatefulWidget {
  @override
  _shop_regState createState() => _shop_regState();
}

class _shop_regState extends State<shop_reg> {
  String name='',shop_name='',address='';
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/wallpaper.png'),fit: BoxFit.cover),
          ),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width:20),
                Text('Name:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 30),),
                form(width:250,hinttext: 'Enter Full Name',onchange: (String value){setState(() {
                  name=value;
                }
                );
                },),
              ],
            ),
            Row(
              children: [
                SizedBox(width:20),
                Text('Shop Name:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 25),),
                form(width:250,hinttext: 'Enter Full Name',onchange: (String value){setState(() {
                  shop_name=value;
                }
                );
                },),
              ],
            ),
            Row(
              children: [
                SizedBox(width:20),
                Text('Address:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 30),),
                form(width:250,hinttext: 'Enter Full Name',onchange: (String value){setState(() {
                  address=value;
                }
                );
                },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
