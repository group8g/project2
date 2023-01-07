import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/information.dart';
import 'package:flutter_application_1/screen/getFromDB/getOrder.dart';
import 'package:flutter_application_1/screen/getFromDB/getService.dart';

class stationServiceBody extends StatefulWidget {
  final String docId, locationName;
  const stationServiceBody(
      {Key? key, required this.docId, required this.locationName})
      : super(key: key);

  @override
  State<stationServiceBody> createState() => _stationServiceBodyState();
}

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

final user = FirebaseAuth.instance.currentUser!;

class _stationServiceBodyState extends State<stationServiceBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/gas1.png"),
                fit: BoxFit.fill,
                opacity: 0.55,
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(100, 0, 0, 0), BlendMode.color),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, top: 30),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              widget.docId + "\t gas station",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
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
              widget.locationName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 450,
            height: 140,
            margin: EdgeInsets.only(left: 25, right: 25, top: 180),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              'Station Services:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return GetServices(
                    stationId: widget.docId,
                    location: widget.locationName,
                  );
                }),
          ),
          Expanded(
            child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return GetServices(
                    stationId: widget.docId,
                    location: widget.locationName,
                  );
                }),
          ),
          Expanded(
            child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return GetServices(
                    stationId: widget.docId,
                    location: widget.locationName,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
