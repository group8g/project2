import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/UserTypeBody.dart';

class usertype extends StatelessWidget {
  const usertype({Key? key}) : super(key: key);

  //Design for main page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add logo to appbar
        leading: Image(
          // Call image form project folder
          image: AssetImage(
            "images/logo.png",
          ),
        ),
        // Add title to appbar
        title: Title(
          color: Colors.white, // font color
          child: Text(
            'Gas Station',
          ),
        ),
        // Add background to appbar
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      // Go to Body() class to create body for main page
      body: usertypebody(),
    );
  }
}
