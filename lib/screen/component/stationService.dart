import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/AccountBody.dart';
import 'package:flutter_application_1/screen/component/stationServiceBody.dart';

class stationService extends StatelessWidget {
  final String docId, locationName;
  const stationService(
      {Key? key, required this.docId, required this.locationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage(
            "images/logo.png",
          ),
        ),
        title: Title(
          color: Colors.white,
          child: Text('Creat account'),
        ),
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      body: stationServiceBody(
        docId: docId,
        locationName: locationName,
      ),
    );
  }
}
