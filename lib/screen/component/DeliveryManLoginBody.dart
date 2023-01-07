import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen/component/DeliveryManHomePage.dart';

class deliverymanloginBody extends StatefulWidget {
  const deliverymanloginBody({Key? key}) : super(key: key);

  @override
  State<deliverymanloginBody> createState() => _deliverymanloginBodyState();
}

class _deliverymanloginBodyState extends State<deliverymanloginBody> {
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
        context,
        MaterialPageRoute(
          builder: (context) => deliverymanhomepage(),
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
          Container(
            margin: EdgeInsets.only(left: 125, top: 90),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
              radius: 50,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 210),
            width: 350,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 290),
            width: 350,
            child: TextField(
              controller: _passwordController,
              maxLength: 10,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 410),
            width: 400,
            color: Color.fromARGB(190, 31, 37, 43),
            child: TextButton(
              child: Text(
                'LOG IN',
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
        ],
      ),
    );
  }
}
