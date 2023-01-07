import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/component/Make.dart';

class GetOrder extends StatelessWidget {
  final String locationName;
  const GetOrder({Key? key, required this.locationName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 60, top: 20),
          padding: EdgeInsets.only(top: 15, bottom: 27),
          child: Text(
            'Order infromation',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 450,
          height: 140,
          margin: EdgeInsets.only(left: 25, right: 25, top: 100),
          padding: EdgeInsets.only(top: 15, bottom: 27),
          child: Text(
            'Location of station:\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: 450,
          height: 140,
          margin: EdgeInsets.only(left: 40, right: 40, top: 145),
          padding: EdgeInsets.only(top: 15, bottom: 27),
          child: Text(
            locationName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
