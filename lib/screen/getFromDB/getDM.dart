import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/GasStationHomepage.dart';
import 'package:flutter_application_1/screen/component/orderinfo.dart';
import 'package:flutter_application_1/screen/getFromDB/getOrderForStation.dart';

// to get index for order array depandig on selected item
class IndexProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => this._selectedIndex;

  set setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class GetDM extends StatelessWidget {
  final String documuntId;

  GetDM({Key? key, required this.documuntId}) : super(key: key);

  // to determin current user (station)
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    // to determine collection
    CollectionReference DM =
        FirebaseFirestore.instance.collection('Deliveryman');
    return FutureBuilder<DocumentSnapshot>(
        // control information depanding on selected DM
        future: DM.doc(documuntId).get(),
        builder: ((context, snapshot) {
          // to test connection
          if (snapshot.connectionState == ConnectionState.done) {
            // to get data for current DM
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // to connect current station (user) to its delivery men (depanding on email)
            if (user.email == data['station']) {
              // test if DM available
              // when delivery man available
              if (data['Available'] == 'Yes') {
                return Row(
                  children: [
                    // add green circle button
                    TextButton(
                        child: Icon(
                          Icons.circle_outlined,
                          color: Colors.green,
                          size: 60,
                        ),
                        onPressed: () => {
                              // action on pressed on green circle button
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  insetPadding: EdgeInsets.symmetric(
                                      vertical: 240, horizontal: 25),
                                  title: Text(
                                    "The order has been \n succsefully sent to",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    children: [
                                      Text(
                                        '${data['Name']} \n ${data['Location']} ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      TextButton(
                                        child: Text(
                                          "\n Done",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // action when press done button in alert dialog
                                        onPressed: () {
                                          // to determine collection (Dleiveryman) from database
                                          final selectedDM = FirebaseFirestore
                                              .instance
                                              .collection('Deliveryman')
                                              .doc(documuntId);
                                          // update availbile filed in database (make it No)
                                          selectedDM
                                              .update({'Available': 'No'});

                                          // to determine collection (Gas station) from database
                                          CollectionReference station =
                                              FirebaseFirestore.instance
                                                  .collection('GasStations');
                                          // to get result depunding on station email
                                          if (user.email ==
                                              'jopetrol@gmail.com') {
                                            // to get joPetrol documant from database
                                            DocumentReference<Object?> data =
                                                station.doc('joPetrol');
                                            // to get data fot joPetrol documant
                                            data.get().then(
                                              (DocumentSnapshot doc) {
                                                // to get station data
                                                final info = doc.data()
                                                    as Map<String, dynamic>;

                                                // to store orders information
                                                List<dynamic> det =
                                                    info['orders'];

                                                // get selcted order
                                                Map<String, dynamic> order =
                                                    det.elementAt(
                                                            IndexProvider()
                                                                ._selectedIndex)
                                                        as Map<String, dynamic>;

                                                // sort original map (order)
                                                List<MapEntry<String, dynamic>>
                                                    listData =
                                                    order.entries.toList();
                                                listData.sort(((a, b) =>
                                                    a.key.compareTo(b.key)));

                                                // save sort map
                                                final Map<String, dynamic>
                                                    sortOrder =
                                                    Map.fromEntries(listData);

                                                // to sava selected order info into Map to use it to update database
                                                Map<dynamic, String> docData =
                                                    <dynamic, String>{};
                                                // add data to docData list
                                                docData.addAll({
                                                  //"station": data.id,
                                                  "location": sortOrder.entries
                                                      .elementAt(1)
                                                      .value,
                                                  "service": sortOrder.entries
                                                      .elementAt(4)
                                                      .value,
                                                  "order num": sortOrder.entries
                                                      .elementAt(2)
                                                      .value,
                                                  "phone": sortOrder.entries
                                                      .elementAt(3)
                                                      .value,
                                                });
                                                // update database for delivery man
                                                selectedDM.update({
                                                  'orders':
                                                      FieldValue.arrayUnion(
                                                          [docData]),
                                                });

                                                // remove old order info from gas sation
                                                data.update({
                                                  'orders':
                                                      FieldValue.arrayRemove(
                                                          [order]),
                                                });
                                                // update 1Done flied to Send
                                                order.update('1Done',
                                                    ((value) => 'Send'));

                                                // update order for gas station in database
                                                data.update({
                                                  'orders':
                                                      FieldValue.arrayUnion(
                                                          [order]),
                                                });
                                              },
                                            );
                                          } else if (user.email ==
                                              'manaseer@gmail.com') {
                                            // to get manaseer documant from database
                                            DocumentReference<Object?> data =
                                                station.doc('manaseer');

                                            // to get data fot joPetrol documant
                                            data.get().then(
                                              (DocumentSnapshot doc) {
                                                // to get station data
                                                final info = doc.data()
                                                    as Map<String, dynamic>;

                                                // to store orders information
                                                List<dynamic> det =
                                                    info['orders'];

                                                // get selcted order
                                                Map<String, dynamic> order =
                                                    det.elementAt(
                                                            IndexProvider()
                                                                ._selectedIndex)
                                                        as Map<String, dynamic>;

                                                // sort original map (order)
                                                List<MapEntry<String, dynamic>>
                                                    listData =
                                                    order.entries.toList();
                                                listData.sort(((a, b) =>
                                                    a.key.compareTo(b.key)));

                                                // save sort map
                                                final Map<String, dynamic>
                                                    sortOrder =
                                                    Map.fromEntries(listData);

                                                // to sava selected order info into Map to use it to update database
                                                Map<dynamic, String> docData =
                                                    <dynamic, String>{};
                                                // add data to docData list
                                                docData.addAll({
                                                  //"station": data.id,
                                                  "location": sortOrder.entries
                                                      .elementAt(1)
                                                      .value,
                                                  "service": sortOrder.entries
                                                      .elementAt(4)
                                                      .value,
                                                  "order num": sortOrder.entries
                                                      .elementAt(2)
                                                      .value,
                                                  "phone": sortOrder.entries
                                                      .elementAt(3)
                                                      .value,
                                                });
                                                // update database for delivery man
                                                selectedDM.update({
                                                  'orders':
                                                      FieldValue.arrayUnion(
                                                          [docData]),
                                                });

                                                // remove old order info from gas sation
                                                data.update({
                                                  'orders':
                                                      FieldValue.arrayRemove(
                                                          [order]),
                                                });
                                                // update 1Done flied to Send
                                                order.update('1Done',
                                                    ((value) => 'Send'));

                                                // update order for gas station in database
                                                data.update({
                                                  'orders':
                                                      FieldValue.arrayUnion(
                                                          [order]),
                                                });
                                              },
                                            );
                                          } else if (user.email ==
                                              'total1@gmail.com') {
                                            // to get total documant from database
                                            DocumentReference<Object?> data =
                                                station.doc('total');

                                            // to get data fot joPetrol documant
                                            data.get().then(
                                              (DocumentSnapshot doc) {
                                                // to get station data
                                                final info = doc.data()
                                                    as Map<String, dynamic>;

                                                // to store orders information
                                                List<dynamic> det =
                                                    info['orders'];

                                                // get selcted order
                                                Map<String, dynamic> order =
                                                    det.elementAt(
                                                            IndexProvider()
                                                                ._selectedIndex)
                                                        as Map<String, dynamic>;

                                                // sort original map (order)
                                                List<MapEntry<String, dynamic>>
                                                    listData =
                                                    order.entries.toList();
                                                listData.sort(((a, b) =>
                                                    a.key.compareTo(b.key)));

                                                // save sort map
                                                final Map<String, dynamic>
                                                    sortOrder =
                                                    Map.fromEntries(listData);

                                                // to sava selected order info into Map to use it to update database
                                                Map<dynamic, String> docData =
                                                    <dynamic, String>{};
                                                // add data to docData list
                                                docData.addAll({
                                                  //"station": data.id,
                                                  "location": sortOrder.entries
                                                      .elementAt(1)
                                                      .value,
                                                  "service": sortOrder.entries
                                                      .elementAt(4)
                                                      .value,
                                                  "order num": sortOrder.entries
                                                      .elementAt(2)
                                                      .value,
                                                  "phone": sortOrder.entries
                                                      .elementAt(3)
                                                      .value,
                                                });
                                                // update database for delivery man
                                                selectedDM.update({
                                                  'orders':
                                                      FieldValue.arrayUnion(
                                                          [docData]),
                                                });

                                                // remove old order info from gas sation
                                                data.update({
                                                  'orders':
                                                      FieldValue.arrayRemove(
                                                          [order]),
                                                });
                                                // update 1Done flied to Send
                                                order.update('1Done',
                                                    ((value) => 'Send'));

                                                // update order for gas station in database
                                                data.update({
                                                  'orders':
                                                      FieldValue.arrayUnion(
                                                          [order]),
                                                });
                                              },
                                            );
                                          }

                                          ///////////////////////////////////////////

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => orderInfo(),
                                            ),
                                          );
                                        },
                                        ///////////////////////////////////////////////
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            }),
                    // text apper in dialog box when select delivery man
                    Text(
                      ' ${data['Name']} \n ( ${data['Location']} )',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
                // if dilevery man not available
              } else if (data['Available'] == 'No') {
                return Row(
                  children: [
                    TextButton(
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 60,
                        ),
                        onPressed: () => {}),
                    Text(
                      '${data['Name']} \n Not available now',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                );
              }
            }
          }
          return Text('');
        }));
  }
}
