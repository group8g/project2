import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/stationService.dart';

class GetId extends StatefulWidget {
  final String stationId;

  GetId({Key? key, required this.stationId}) : super(key: key);

  @override
  State<GetId> createState() => _GetIdState();
}

class _GetIdState extends State<GetId> {
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
            List<dynamic> det = data['locations'];
            // to get email for cuurent station
            String email = data['email'];
            // to show the order info. depunding on email of station
            if (widget.stationId == "joPetrol") {
              return Container(
                margin: EdgeInsets.only(top: 100),
                child: ListView.builder(
                  // number of location
                  itemCount: det.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 120),
                      backgroundColor: Color.fromARGB(76, 226, 204, 37),
                            shadowColor: Color.fromARGB(76, 226, 204, 37),
                        elevation: 250,
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(25))
                    ),
                      onPressed: () {
                        Navigator.push(
// Action (go to the next page)
                          context,
                          MaterialPageRoute(
// Determinr next page
                            builder: (context) => stationService(
                              docId: 'joPetrol',
                              locationName: det[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              widget.stationId + " " + det[index],
                              style: TextStyle(
                                color: Colors.black,
                              ),
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
                margin: EdgeInsets.only(top: 200),
                child: ListView.builder(
                  // number of location
                  itemCount: det.length,
                  itemBuilder: (context, index) {
                    return  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 120),
                          backgroundColor: Color.fromARGB(76, 226, 204, 37),
                          shadowColor: Color.fromARGB(76, 226, 204, 37),
                          elevation: 250,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))
                      ),
                      onPressed: () {
                        Navigator.push(
// Action (go to the next page)
                          context,
                          MaterialPageRoute(
// Determinr next page
                            builder: (context) => stationService(
                              docId: 'total',
                              locationName: det[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              widget.stationId + " " + det[index],
                              style: TextStyle(
                                color: Colors.black,
                              ),
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
                margin: EdgeInsets.only(top: 300),
                child: ListView.builder(
                  // number of location
                  itemCount: det.length,
                  itemBuilder: (context, index) {
                    return  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 120),
                          backgroundColor: Color.fromARGB(76, 226, 204, 37),
                          shadowColor: Color.fromARGB(76, 226, 204, 37),
                          elevation: 250,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))
                      ),
                      onPressed: () {
                        Navigator.push(
// Action (go to the next page)
                          context,
                          MaterialPageRoute(
// Determinr next page
                            builder: (context) => stationService(
                              docId: 'manaseer',
                              locationName: det[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(

                            child: Text(
                              widget.stationId + " " + det[index],
                              style: TextStyle(
                                color: Colors.black,
                              ),
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
