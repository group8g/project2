import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/GasStationHomepage.dart';
import 'package:flutter_application_1/screen/component/GasStationLoginBody.dart';
import 'package:flutter_application_1/screen/component/stationInfoBody.dart';
import 'package:flutter_application_1/screen/component/updateInfoGasStationBody.dart';

class StationInfo extends StatelessWidget {
  const StationInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Image(
            image: AssetImage(
              "images/logo.png",
            ),
          ),
          onPressed: () => {
            Navigator.push(
              // Action (go to the next page)
              context,
              MaterialPageRoute(
                // Determinr next page
                builder: (context) => gasstationhomepage(),
              ),
            )
          },
        ),
        title: Title(
          color: Colors.white,
          child: Text('Current information'),
        ),
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      body: StationInfoBody(),
    );
  }
}
