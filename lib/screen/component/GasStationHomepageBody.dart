import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/GasStationHomepage.dart';
import 'package:flutter_application_1/screen/component/orderinfo.dart';
import 'package:flutter_application_1/screen/component/orderinfobody.dart';
import 'package:flutter_application_1/screen/component/updateInfoGasStation.dart';

class gasstationhomepageBody extends StatelessWidget {
  const gasstationhomepageBody({Key? key}) : super(key: key);

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
                    Color.fromARGB(99, 60, 53, 53), BlendMode.color),
              ),
            ),
          ),
          // Add buttons
          Column(
            children: [
              // order information
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(76, 226, 204, 37),
                        borderRadius: BorderRadius.circular(50)),
                    width: 340,
                    height: 130,
                    margin: EdgeInsets.only(left: 29, bottom: 40, top: 158),
                    child: TextButton(
                      child: Text(
                        'Orders information',
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
                            context,
                            MaterialPageRoute(
                                builder: (context) => orderInfo()))
                      },
                    ),
                  ),
                ],
              ),
              // update information
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(76, 226, 204, 37),
                        borderRadius: BorderRadius.circular(50)),
                    width: 340,
                    height: 130,
                    margin: EdgeInsets.only(left: 29, bottom: 40),
                    child: TextButton(
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
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateInfoGasStation()))
                      },
                    ),
                  ),
                ],
              ),
            ],
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
