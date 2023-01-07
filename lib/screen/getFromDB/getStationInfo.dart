import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StationInfo extends StatelessWidget {
  final String stationId;

  StationInfo({Key? key, required this.stationId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to determine collection
    CollectionReference stations =
        FirebaseFirestore.instance.collection('GasStations');

    // to determin current user (station)
    final user = FirebaseAuth.instance.currentUser!;

    return FutureBuilder<DocumentSnapshot>(
        // control information depanding on selected station
        future: stations.doc(stationId).get(),
        builder: ((context, snapshot) {
          // to test connection
          if (snapshot.connectionState == ConnectionState.done) {
            // to get data for current station
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // to get ID for cuurent station
            String ID = data['ID'];
            // to name ID for cuurent station
            String name = data['Name'];
            // to get email for cuurent station
            String email = data['email'];
            // to store locations information
            List<dynamic> locations = data['locations'];
            // to get password for cuurent station
            String pass = data['password'];
            // to get password for cuurent station
            String phone = data['phone'];
            // to get password for cuurent station
            String workTime = data['workTime'];
            // to store services information
            List<dynamic> services = data['services'];

            // to show the order info. depunding on email of station
            if (user.email == email) {
              return Container(
                margin:
                    EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 90),
                padding: EdgeInsets.all(20),
                color: Color.fromARGB(48, 226, 204, 37),
                child: Column(
                  children: [
                    // ID for station
                    Row(
                      children: [
                        Text(
                          'ID : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$ID',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // name for station
                    Row(
                      children: [
                        Text(
                          'Name : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$name',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Email for station
                    Row(
                      children: [
                        Text(
                          'Email : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$email',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Password for station
                    Row(
                      children: [
                        Text(
                          'Passwoed : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$pass',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Phone for station
                    Row(
                      children: [
                        Text(
                          'Phone : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$phone',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Work Time for station
                    Row(
                      children: [
                        Text(
                          'Work Time : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$workTime',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Location for station
                    Row(
                      children: [
                        Text(
                          'Location:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        // number of location
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          return Text(
                            ' ${locations[index]} ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ),
                    // Service for station
                    Row(
                      children: [
                        Text(
                          'Services:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        // number of order
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Text(
                            ' ${services[index]} ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return Text("No Information");
        }));
  }
}
