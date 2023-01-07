import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/availableDM.dart';

class GetOrderStation extends StatelessWidget {
  final String stationId;

  GetOrderStation({Key? key, required this.stationId}) : super(key: key);

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
            // to store orders information
            List<dynamic> det = data['orders'];
            // to get email for cuurent station
            String email = data['email'];

            // to show the order info. depunding on email of station
            if (user.email == email) {
              return ListView.builder(
                // number of order
                itemCount: det.length,
                itemBuilder: (context, index) {
                  // to save selected order
                  Map<String, dynamic> order =
                      det.elementAt(index) as Map<String, dynamic>;
                  // to convert map (order) to list to sort it
                  List<MapEntry<String, dynamic>> listData =
                      order.entries.toList();
                  // sort (order) list
                  listData.sort(((a, b) => a.key.compareTo(b.key)));
                  // save sort list in map
                  final Map<String, dynamic> sortOrder =
                      Map.fromEntries(listData);
                  // test state of order
                  if (sortOrder.entries.first.value == 'Not Done') {
                    return ListTile(
                      leading: TextButton(
                        child: Icon(
                          Icons.circle_outlined,
                          color: Colors.green,
                          size: 60,
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AvailableDM(),
                            ),
                          ),
                        },
                      ),
                      title: ListTile(
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order Num ' +
                                        '${sortOrder.entries.elementAt(2).value}' +
                                        ' - '
                                            '${sortOrder.entries.elementAt(6).value}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    Text('Service need: ${sortOrder.entries.elementAt(4).value}' +
                                        '\n' +
                                        'Phone number: ${sortOrder.entries.elementAt(3).value}' +
                                        '\n' +
                                        'Location: ${sortOrder.entries.elementAt(1).value}' +
                                        '\n' +
                                        'Payment method: ${sortOrder.entries.elementAt(5).value}' +
                                        '\n' +
                                        'State: ${sortOrder.entries.first.value}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (sortOrder.entries.first.value == 'Reject') {
                    return ListTile(
                      leading: TextButton(
                        child: Icon(
                          Icons.circle_sharp,
                          color: Colors.red,
                          size: 60,
                        ),
                        onPressed: () => {},
                      ),
                      title: ListTile(
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order Num ' +
                                        '${sortOrder.entries.elementAt(2).value}' +
                                        ' - '
                                            '${sortOrder.entries.elementAt(6).value}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    Text('Service need: ${sortOrder.entries.elementAt(4).value}' +
                                        '\n' +
                                        'Phone number: ${sortOrder.entries.elementAt(3).value}' +
                                        '\n' +
                                        'Location: ${sortOrder.entries.elementAt(1).value}' +
                                        '\n' +
                                        'Payment method: ${sortOrder.entries.elementAt(5).value}' +
                                        '\n' +
                                        'State: ${sortOrder.entries.first.value}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (sortOrder.entries.first.value == 'Send') {
                    return ListTile(
                      leading: TextButton(
                        child: Icon(
                          Icons.send_and_archive_sharp,
                          color: Colors.green,
                          size: 60,
                        ),
                        onPressed: () => {},
                      ),
                      title: ListTile(
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order Num ' +
                                        '${sortOrder.entries.elementAt(2).value}' +
                                        ' - '
                                            '${sortOrder.entries.elementAt(6).value}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    Text('Service need: ${sortOrder.entries.elementAt(4).value}' +
                                        '\n' +
                                        'Phone number: ${sortOrder.entries.elementAt(3).value}' +
                                        '\n' +
                                        'Location: ${sortOrder.entries.elementAt(1).value}' +
                                        '\n' +
                                        'Payment method: ${sortOrder.entries.elementAt(5).value}' +
                                        '\n' +
                                        'State: ${sortOrder.entries.first.value}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (sortOrder.entries.first.value == 'Done') {
                    return ListTile(
                      leading: TextButton(
                        child: Icon(
                          Icons.circle_sharp,
                          color: Colors.green,
                          size: 60,
                        ),
                        onPressed: () => {},
                      ),
                      title: ListTile(
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order Num ' +
                                        '${sortOrder.entries.elementAt(2).value}' +
                                        ' - '
                                            '${sortOrder.entries.elementAt(6).value}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Row(
                                  children: [
                                    Text('Service need: ${sortOrder.entries.elementAt(4).value}' +
                                        '\n' +
                                        'Phone number: ${sortOrder.entries.elementAt(3).value}' +
                                        '\n' +
                                        'Location: ${sortOrder.entries.elementAt(1).value}' +
                                        '\n' +
                                        'Payment method: ${sortOrder.entries.elementAt(5).value}' +
                                        '\n' +
                                        'State: ${sortOrder.entries.first.value}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text('');
                  }
                },
              );
            }
          }
          return Text("No orders");
        }));
  }
}
