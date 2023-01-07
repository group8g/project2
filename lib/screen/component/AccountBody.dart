import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({Key? key}) : super(key: key);
  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  var username, phonenumber, email, address, password;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('Client');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': username,
          'phone': phonenumber,
          'email': email,
          'location': address,
          'password': password,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  sigUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The psasword provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that user');
        }
      } catch (e) {
        print(e);
      }
    } else {}
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
            margin: EdgeInsets.only(left: 145, top: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
              radius: 50,
            ),
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 110),
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (val) {
                          username = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "username can't to be larger than 100 letter ";
                          }
                          if (val.length < 1) {
                            return "username must be filled in ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "username",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        onSaved: (val) {
                          phonenumber = val;
                        },
                        validator: (val) {
                          if (val!.length >= 11) {
                            return "phonenumber can't to be larger than 11 number ";
                          }
                          if (val.length < 1) {
                            return "phonenumber must be filled in";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "phonenumber",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onSaved: (val) {
                          email = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "email can't to be larger than 100 letter ";
                          }
                          if (val.length < 2) {
                            return "email must be filled in ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onSaved: (val) {
                          address = val;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "address can't to be larger than 100 letter ";
                          }
                          if (val.length < 1) {
                            return "address must be filled in ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "address",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        maxLength: 8,
                        onSaved: (val) {
                          password = val;
                        },
                        validator: (val) {
                          if (val!.length > 8) {
                            return "password can't to be larger than 8 letter ";
                          }
                          if (val.length < 8) {
                            return "password can't to be less than 8 letter ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 600),
            width: 400,
            color: Color.fromARGB(190, 31, 37, 43),
            child: TextButton(
              child: Text(
                'Create',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                var response = await sigUp();
                addUser();
                

              },
            ),
          ),
          // Add create account link
        ],
      ),
    );
  }
}
