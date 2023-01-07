import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/Map.dart';
import 'package:flutter_application_1/screen/component/Tab.dart';
import 'package:flutter_application_1/screen/component/Update.dart';
import 'package:flutter_application_1/screen/component/back.dart';

class servicebody extends StatelessWidget {

  const servicebody({Key? key}) : super(key: key);
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
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
                  backgroundColor: Color.fromARGB(76, 226, 204, 37),
                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                  elevation: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                'Update information',
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
                    builder: (context) => update(),
                  ),
                )
              },
            ),
          ),
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 235),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
                  backgroundColor: Color.fromARGB(76, 226, 204, 37),
                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                  elevation: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                'Make order',
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
                    builder: (context) => tab(),
                  ),
                )
              },
            ),
          ),
          // Add client as button to go to client login page
          // Add delivery man as button to go to delivery man login page
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 360),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
                  backgroundColor: Color.fromARGB(76, 226, 204, 37),
                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                  elevation: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                'Map',
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
                    builder: (context) => Map(),
                  ),
                )
              },
            ),
          ),
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 490),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 25, right: 75, left: 75),
                  backgroundColor: Color.fromARGB(76, 226, 204, 37),
                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                  elevation: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                'Rate service',
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
                    builder: (context) => back(

                    ),
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
              margin: EdgeInsets.only(top: 750),
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
              margin: EdgeInsets.only(left: 200, top: 750),
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
