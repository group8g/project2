import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/ClientLogin.dart';
import 'package:flutter_application_1/screen/component/DeliveryManLogin.dart';
import 'package:flutter_application_1/screen/component/GasStationLogin.dart';

class usertypebody extends StatelessWidget {
  const usertypebody({Key? key}) : super(key: key);

  //Design for user type page body
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          // Add background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/gas1.png"), // Call backround image
                fit: BoxFit
                    .fill, // Background image dimensions for the phone dimensions
                opacity: 0.55, // Background opacity
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(100, 0, 0, 0), BlendMode.color),
              ),
            ),
          ),
          // Add title
          Container(
            width: 330,
            height: 98,
            color: Color.fromARGB(76, 226, 204, 37),
            margin: EdgeInsets.only(top: 90, left: 42),
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Select type of user',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 33.0,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Add gas station as button to go to gas station login page
          Container(
            width: 400,
            color: Color.fromARGB(76, 226, 204, 37),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 188),
            padding: EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
            child: TextButton(
              child: Text(
                'Gas station',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              // Action the button
              onPressed: () => {
                Navigator.push(
                  // Action (go to the next page)
                  context,
                  MaterialPageRoute(
                    // Determinr next page
                    builder: (context) => gasstationlogin(),
                  ),
                )
              },
            ),
          ),
          // Add client as button to go to client login page
          Container(
            width: 400,
            color: Color.fromARGB(76, 226, 204, 37),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 286),
            padding:
                EdgeInsets.only(top: 25, bottom: 25, right: 103, left: 103),
            child: TextButton(
              child: Text(
                'Client',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => {
                Navigator.push(
                  // Action (go to the next page)
                  context,
                  MaterialPageRoute(
                    // Determinr next page
                    builder: (context) => clientlogin(),
                  ),
                )
              },
            ),
          ),
          // Add delivery man as button to go to delivery man login page
          Container(
            width: 400,
            color: Color.fromARGB(76, 226, 204, 37),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 384),
            padding: EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
            child: TextButton(
              child: Text(
                'Delivery man',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => {
                Navigator.push(
                  // Action (go to the next page)
                  context,
                  MaterialPageRoute(
                    // Determinr next page
                    builder: (context) => deliverymanlogin(),
                  ),
                )
              },
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
