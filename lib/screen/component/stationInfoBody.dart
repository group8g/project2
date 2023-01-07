import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/component/availableDM.dart';
import 'package:flutter_application_1/screen/getFromDB/getOrderForStation.dart';
import 'package:flutter_application_1/screen/getFromDB/getStationInfo.dart';

class StationInfoBody extends StatefulWidget {
  const StationInfoBody({Key? key}) : super(key: key);

  @override
  State<StationInfoBody> createState() => _StationInfoBodyState();
}

class _StationInfoBodyState extends State<StationInfoBody> {
  // to stor id for collection (name of station)
  List<String> docIDs = [];

  // to add id to list (docIDs)
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('GasStations')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  // to determin current user (station)
  final user = FirebaseAuth.instance.currentUser!;
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
          // body
          Column(
            children: [
              // add green circle and each order info
              Expanded(
                child: FutureBuilder(
                    future: getDocId(),
                    builder: (context, snapshot) {
                      // to return needed info depanding on station email (depanding on login)
                      if (user.email == 'total1@gmail.com') {
                        return StationInfo(stationId: 'total');
                      } else if (user.email == 'jopetrol@gmail.com') {
                        return StationInfo(stationId: 'joPetrol');
                      } else if (user.email == 'manaseer@gmail.com') {
                        return StationInfo(stationId: 'manaseer');
                      } else {
                        return Text('');
                      }
                    }),
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
