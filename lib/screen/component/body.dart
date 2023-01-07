import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/UserType.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  //Design for home page
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // Center,Stack to enable add items above background
        children: <Widget>[
          //Add background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/gas1.png"), // Call backround image
                fit: BoxFit
                    .fill, // Background image dimensions for the phone dimensions
                opacity: 0.75, // Background opacity
                colorFilter: ColorFilter.mode(
                    //to control background color degree
                    Color.fromARGB(100, 0, 0, 0),
                    BlendMode.color),
              ),
            ),
          ),
          //Write text over background
          //title of body
          Container(
              alignment:
                  Alignment.topCenter, // Location of title text container
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Gas Station Delivery Service',
                textAlign:
                    TextAlign.center, // Location of title text inside container
                style: TextStyle(
                  color: Color.fromARGB(236, 226, 204, 37),
                  fontWeight: FontWeight.bold,
                  fontSize: 33.0,
                ),
              )),

          //middle pargraph
          Container(
            color: Color.fromARGB(
                76, 226, 204, 37), // Color background for container
            margin: EdgeInsets.only(left: 25, right: 25, top: 170),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              'Our applecation provide gas station sarvices to you at your home and at any time you want.\n'
              'This applecation include 3 gas station (Manaseer Station, JoPetrol, Total)in 2 city (Amman, Zarqa)',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // link to user type page
          Container(
            height: 100,
            color: Color.fromARGB(76, 226, 204, 37),
            margin: EdgeInsets.only(left: 25, right: 25, top: 408),
            padding: EdgeInsets.only(bottom: 17),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  // anble to go to anthor page
                  context,
                  MaterialPageRoute(
                    // to identify next page
                    builder: (context) => usertype(),
                  ),
                );
              },
              child: Text(
                'You should have account to take advantage of the service',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // bottom box1
          Container(
              alignment: Alignment.center,
              width: 220,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              margin: EdgeInsets.only(top: 590),
              child: Text(
                'Phone \n 079xxxxxxx',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              )),

          // bottom box2
          Container(
              alignment: Alignment.center,
              width: 220,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              margin: EdgeInsets.only(left: 200, top: 590),
              child: Text(
                'Email \n Admin@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
