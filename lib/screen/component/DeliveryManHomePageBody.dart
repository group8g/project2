import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/DeliveryManOrderInformation.dart';
import 'package:flutter_application_1/screen/component/DeliveryManUpdateInformation.dart';

class deliverymanhomepagebody extends StatelessWidget {
  const deliverymanhomepagebody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gas1.png"),
            fit: BoxFit.fill,
            opacity: 0.55,
            colorFilter:
                ColorFilter.mode(Color.fromARGB(100, 0, 0, 0), BlendMode.color),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 100, right: 50, left: 50, bottom: 100),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 50, right: 30, left: 30, bottom: 50),
                      backgroundColor: Color.fromARGB(76, 226, 204, 37),
                      elevation: 250,
                      shadowColor: Color.fromARGB(76, 226, 204, 37),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderInformation(),
                    ));
                  },
                  child: Text(
                    "Orders information",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  )),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 50, right: 30, left: 30, bottom: 50),
                      backgroundColor: Color.fromARGB(76, 226, 204, 37),
                      elevation: 250,
                      shadowColor: Color.fromARGB(76, 226, 204, 37),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateInformation()));
                  },
                  child: Text(
                    "Update information",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  )),
            ],
          ),
        ),
      ),
      Container(
          alignment: Alignment.center,
          width: 220,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          margin: EdgeInsets.only(top: 580),
          child: Text(
            'Phone \n 079xxxxxxx',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )),
      Container(
          alignment: Alignment.center,
          width: 220,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          margin: EdgeInsets.only(left: 200, top: 580),
          child: Text(
            'Email \n Admin@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    ]));
  }
}
