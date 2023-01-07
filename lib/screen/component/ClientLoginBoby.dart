import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/Account.dart';
import 'package:flutter_application_1/screen/component/Service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
void main() async {}

class clientloginbody extends StatefulWidget {
  const clientloginbody({Key? key}) : super(key: key);

  @override
  State<clientloginbody> createState() => _clientloginbodyState();
}

class _clientloginbodyState extends State<clientloginbody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        // anble to go to anthor page
        context,
        MaterialPageRoute(
          // to identify next page
          builder: (context) => Service(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _emailController.text = '';
        _passwordController.text = "";
        showDialog(
          context: context,
          builder: (error) => AlertDialog(
            content: const Text(
              "\n Invalid Email or \n Password!!!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(error).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 90),
                  child: const Text(
                    "Retry",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        _emailController.text = '';
        _passwordController.text = "";
        showDialog(
          context: context,
          builder: (error) => AlertDialog(
            content: const Text(
              "\n Invalid Email or \n Password!!!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(error).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 90),
                  child: const Text(
                    "Retry",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

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
            margin: EdgeInsets.only(left: 15, right: 15, top: 210),
            width: 350,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: ' Email',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Add gas station password (textfiled)
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 280),
            width: 350,
            child: TextField(
              controller: _passwordController,
              maxLength: 8,
              obscureText: true,
              decoration: InputDecoration(
                labelText: ' Password',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Add login button
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 370),
            width: 400,
            color: Color.fromARGB(190, 31, 37, 43),
            child: TextButton(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              onPressed: () => {
                login(),
              },
            ),
          ),
          // Add create account link
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 500),
            width: 400,
            child: TextButton(
              child: Text(
                'Creat account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
              onPressed: () => {
                Navigator.push(
                  // Action (go to the next page)
                  context,
                  MaterialPageRoute(
                    // Determinr next page
                    builder: (context) => account(),
                  ),
                )
              },
            ),
          ),
          // Add create accou
        ],
      ),
    );
  }
}
