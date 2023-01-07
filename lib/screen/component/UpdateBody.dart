import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class updatebody extends StatefulWidget {
  const updatebody({Key? key}) : super(key: key);

  @override
  State<updatebody> createState() => _updatebodyState();
}
final user = FirebaseAuth.instance.currentUser!;
final myController = TextEditingController();
final myController1 = TextEditingController();
final myController2 = TextEditingController();
var phone;
var password;
var location;
class _updatebodyState extends State<updatebody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          // Add background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/gas1.png"),
                fit: BoxFit.fill,
                opacity: 0.55,
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(100, 0, 0, 0), BlendMode.color),
              ),
            ),
          ),
          // Add login avatar
          Container(
            margin: EdgeInsets.only(left: 155, top: 60),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
              radius: 50,
            ),
          ),
          // Add gas station id (textfiled)
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 200),
            width: 350,
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                labelText: ' Phone number',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Add gas station password (textfiled)
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 250),
            width: 350,
            child: TextField(
              controller: myController1,
              decoration: InputDecoration(
                labelText: ' Address',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 310),
            width: 350,
            child: TextField(
              controller: myController2,
              decoration: InputDecoration(
                labelText: ' Password',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 460),
            width: 400,
            color: Color.fromARGB(190, 31, 37, 43),
            child: TextButton(
              child: Text(
                'Update',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
    onPressed: () {
    // update in database
    if (user.email == 'rand@gmail.com') {
    final updateInfo = FirebaseFirestore.instance
        .collection('Client')
        .doc('5zI15WYT18QDOLy2xbWV');
         if (myController.text.isNotEmpty) {
            updateInfo.update({
               'phone':  myController.text,
        });
      }
    if (myController1.text.isNotEmpty) {
      updateInfo.update({
        'location':  myController1.text,
      });
    }
    if (myController2.text.isNotEmpty) {
      updateInfo.update({
        'password':  myController2.text,
      });
    }



    }},
            ),
          ),
          // Add create account link
        ],
      ),
    );
  }
}

