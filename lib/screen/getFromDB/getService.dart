import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/information.dart';
import 'package:flutter_application_1/screen/component/stationService.dart';
import 'package:flutter_application_1/screen/component/stationServiceBody.dart';
import 'package:flutter_application_1/screen/getFromDB/getOrder.dart';

class GetServices extends StatefulWidget {
  final String stationId, location;

  GetServices({Key? key, required this.stationId, required this.location})
      : super(key: key);

  @override
  State<GetServices> createState() => _GetServicesState();
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

class _GetServicesState extends State<GetServices> {
  @override
  Widget build(BuildContext context) {
    CollectionReference stations =
        FirebaseFirestore.instance.collection('GasStations');

// to determin current user (station)
    final user = FirebaseAuth.instance.currentUser!;
    return FutureBuilder<DocumentSnapshot>(
// control information depanding on selected station
        future: stations.doc(widget.stationId).get(),
        builder: ((context, snapshot) {
// to test connection
          if (snapshot.connectionState == ConnectionState.done) {
// to get data for current station
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
// to store orders information
            List<dynamic> det = data['services'];
// to get email for cuurent station
            String email = data['email'];
// to show the order info. depunding on email of station
            if (widget.stationId == "joPetrol") {
              return Container(
                margin: EdgeInsets.only(top: 250, right: 30),
                child: ListView.builder(
// number of location
                  itemCount: det.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        List<String> docIDs = [];

// to add id to list (docIDs)
                        Future getDocId(int index) async {
                          await FirebaseFirestore.instance
                              .collection('Deliveryman')
                              .get()
                              .then((snapshot) =>
                                  snapshot.docs.forEach((document) {
                                    docIDs.add(document.reference.id);
                                  }));
                          print(docIDs.elementAt(index));
                          final updateInfo = FirebaseFirestore.instance
                              .collection('Deliveryman')
                              .doc(docIDs.elementAt(index));
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            height: 40,
                            margin: EdgeInsets.only(top: 5, right: 30),
                            padding: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(top: 5),
                                  backgroundColor:
                                      Color.fromARGB(76, 226, 204, 37),
                                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                                  elevation: 250,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              child: Text(
                                det[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
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
                                    builder: (context) => info(
                                      location: widget.location,
                                      service: det[index],
                                      docId: widget.stationId,
                                    ),
                                  ),
                                )
                              },
                            ),
                          )
                        ],
                      ),
                    );
// to save selected order
                  },
                ),
              );
            } else if (widget.stationId == "total") {
              return Container(
                margin: EdgeInsets.only(top: 250, right: 30),
                child: ListView.builder(
// number of location
                  itemCount: det.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            height: 40,
                            margin: EdgeInsets.only(right: 30, top: 5),
                            padding: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(top: 5),
                                  backgroundColor:
                                      Color.fromARGB(76, 226, 204, 37),
                                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                                  elevation: 250,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              child: Text(
                                det[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
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
                                    builder: (context) => info(
                                      location: widget.location,
                                      service: det[index],
                                      docId: widget.stationId,
                                    ),
                                  ),
                                )
                              },
                            ),
                          )
                        ],
                      ),
                    );
// to save selected order
                  },
                ),
              );
            } else if (widget.stationId == "manaseer") {
              return Container(
                margin: EdgeInsets.only(top: 250, right: 30),
                child: ListView.builder(
// number of location
                  itemCount: det.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            height: 40,
                            margin: EdgeInsets.only(right: 30, top: 5),
                            padding: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(top: 5),
                                  backgroundColor:
                                      Color.fromARGB(76, 226, 204, 37),
                                  shadowColor: Color.fromARGB(76, 226, 204, 37),
                                  elevation: 250,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              child: Text(
                                det[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
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
                                    builder: (context) => info(
                                      location: widget.location,
                                      service: det[index],
                                      docId: widget.stationId,
                                    ),
                                  ),
                                )
                              },
                            ),
                          )
                        ],
                      ),
                    );
// to save selected order
                  },
                ),
              );
            }
          }
          return Text("No orders");
        }));
  }
}
