import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/DeliveryManOrderInformationBody.dart';
import 'package:flutter_application_1/screen/component/orderinfo.dart';

class IndexProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => this._selectedIndex;

  set setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class GetDMOrder extends StatelessWidget {
  final String DMId;

  GetDMOrder({
    Key? key,
    required this.DMId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to determine collection
    CollectionReference DM =
        FirebaseFirestore.instance.collection('Deliveryman');

    // to determin current user (Deliveryman)
    final user = FirebaseAuth.instance.currentUser!;

    return FutureBuilder<DocumentSnapshot>(
        // control information depanding on selected Deliveryman
        future: DM.doc(DMId).get(),
        builder: ((context, snapshot) {
          // to test connection
          if (snapshot.connectionState == ConnectionState.done) {
            // to get data for current Deliveryman
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            // to store orders information
            List<dynamic> det = data['orders'];

            // to get email for cuurent station
            String email = data['Email'];

            // to show the order info. depunding on email of Deliveryman
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
                  return ListTile(
                    leading: TextButton(
                      child: Icon(
                        Icons.circle_outlined,
                        color: Colors.green,
                        size: 60,
                      ),
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 60,
                            ),
                            actions: <Widget>[
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context,
                                        Builder(
                                          builder: (context) =>
                                              OrderInformationbody(),
                                        ));

                                    final collection = FirebaseFirestore
                                        .instance
                                        .collection('Deliveryman')
                                        .doc(DMId)
                                        .update({
                                      'orders': FieldValue.arrayRemove(det)
                                    });

                                    final selectedDM = FirebaseFirestore
                                        .instance
                                        .collection('Deliveryman')
                                        .doc(DMId);
                                    selectedDM.update({'Available': 'Yes'});

                                    CollectionReference station =
                                        FirebaseFirestore.instance
                                            .collection('GasStations');

                                    if (data['station'] == 'total1@gmail.com') {
                                      // to get manaseer documant from database
                                      DocumentReference<Object?> data =
                                          station.doc('total');

                                      // to get data fot joPetrol documant
                                      data.get().then(
                                        (DocumentSnapshot doc) {
                                          // to get station data
                                          final info = doc.data()
                                              as Map<String, dynamic>;

                                          // to store orders information
                                          List<dynamic> det = info['orders'];

                                          // get selcted order
                                          Map<String, dynamic> order =
                                              det.elementAt(IndexProvider()
                                                      ._selectedIndex)
                                                  as Map<String, dynamic>;

                                          // remove old order info from gas sation
                                          data.update({
                                            'orders':
                                                FieldValue.arrayRemove([order]),
                                          });
                                          // update 1Done flied to Send
                                          order.update(
                                              '1Done', ((value) => 'Done'));

                                          // update order for gas station in database
                                          data.update({
                                            'orders':
                                                FieldValue.arrayUnion([order]),
                                          });
                                        },
                                      );
                                    } else if (data['station'] ==
                                        'jopetrol@gmail.com') {
                                      // to get manaseer documant from database
                                      DocumentReference<Object?> data =
                                          station.doc('jopetrol');

                                      // to get data fot joPetrol documant
                                      data.get().then(
                                        (DocumentSnapshot doc) {
                                          // to get station data
                                          final info = doc.data()
                                              as Map<String, dynamic>;

                                          // to store orders information
                                          List<dynamic> det = info['orders'];

                                          // get selcted order
                                          Map<String, dynamic> order =
                                              det.elementAt(IndexProvider()
                                                      ._selectedIndex)
                                                  as Map<String, dynamic>;

                                          // remove old order info from gas sation
                                          data.update({
                                            'orders':
                                                FieldValue.arrayRemove([order]),
                                          });
                                          // update 1Done flied to Send
                                          order.update(
                                              '1Done', ((value) => 'Done'));

                                          // update order for gas station in database
                                          data.update({
                                            'orders':
                                                FieldValue.arrayUnion([order]),
                                          });
                                        },
                                      );
                                    } else if (data['station'] ==
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
                                          List<dynamic> det = info['orders'];

                                          // get selcted order
                                          Map<String, dynamic> order =
                                              det.elementAt(IndexProvider()
                                                      ._selectedIndex)
                                                  as Map<String, dynamic>;

                                          // remove old order info from gas sation
                                          data.update({
                                            'orders':
                                                FieldValue.arrayRemove([order]),
                                          });
                                          // update 1Done flied to Send
                                          order.update(
                                              '1Done', ((value) => 'Done'));

                                          // update order for gas station in database
                                          data.update({
                                            'orders':
                                                FieldValue.arrayUnion([order]),
                                          });
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    child: const Text(
                                      "Order completed",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                      '${sortOrder.entries.elementAt(1).value}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text('Service need: ${sortOrder.entries.elementAt(3).value}' +
                                        '\n' +
                                        'Phone number: ${sortOrder.entries.elementAt(2).value}' +
                                        '\n' +
                                        'Location: ${sortOrder.entries.elementAt(0).value}'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else
              return Text("No orders");
          }
          return Text("No orders");
        }));
  }
}
