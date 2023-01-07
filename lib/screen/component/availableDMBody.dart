import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/availableDM.dart';
import 'package:flutter_application_1/screen/component/orderinfo.dart';
import 'package:flutter_application_1/screen/getFromDB/getDM.dart';
import 'package:flutter_application_1/screen/getFromDB/getOrderForStation.dart';

// this class for change order index depanding on selected item
class IndexProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => this._selectedIndex;

  set setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class AvailableDMBody extends StatelessWidget {
  AvailableDMBody({Key? key}) : super(key: key);

  // to store id for collection (name of Dleivery man)
  List<String> docIDs = [];

  // to add id to list (docIDs)
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Deliveryman')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  // to determin current user (station)
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Stack(
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

        //body
        Column(
          children: [
            // title
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 65, left: 50),
                  child: Text(
                    'Available Delivery men',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // add green circle and each order info
            Expanded(
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: GetDM(
                            documuntId: docIDs[index],
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(top: 520, left: 300),
          color: Color.fromARGB(190, 31, 37, 43),
          child: TextButton(
            child: Text(
              'Reject Order',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              // to get GasStations collection from database
              CollectionReference station =
                  FirebaseFirestore.instance.collection('GasStations');

              if (user.email == 'jopetrol@gmail.com') {
                // to get joPetrol documant info from GasStatios collection
                DocumentReference<Object?> data = station.doc('joPetrol');

                data.get().then(
                  (DocumentSnapshot doc) {
                    // get info for gas station
                    final info = doc.data() as Map<String, dynamic>;
                    // to store orders information
                    List<dynamic> det = info['orders'];
                    // to get info for selected order
                    Map<String, dynamic> order =
                        det.elementAt(IndexProvider()._selectedIndex)
                            as Map<String, dynamic>;
                    // remove old order info (when order Not Done)
                    data.update({
                      'orders': FieldValue.arrayRemove([order]),
                    });
                    // update order info (make order Reject)
                    order.update('1Done', ((value) => 'Reject'));

                    // update database (make order Reject)
                    data.update({
                      'orders': FieldValue.arrayUnion([order]),
                    });
                  },
                );
              } else if (user.email == 'manaseer@gmail.com') {
                // to get joPetrol documant info from GasStatios collection
                DocumentReference<Object?> data = station.doc('manaseer');

                data.get().then(
                  (DocumentSnapshot doc) {
                    // get info for gas station
                    final info = doc.data() as Map<String, dynamic>;
                    // to store orders information
                    List<dynamic> det = info['orders'];
                    // to get info for selected order
                    Map<String, dynamic> order =
                        det.elementAt(IndexProvider()._selectedIndex)
                            as Map<String, dynamic>;
                    // remove old order info (when order Not Done)
                    data.update({
                      'orders': FieldValue.arrayRemove([order]),
                    });
                    // update order info (make order Reject)
                    order.update('1Done', ((value) => 'Reject'));

                    // update database (make order Reject)
                    data.update({
                      'orders': FieldValue.arrayUnion([order]),
                    });
                  },
                );
              } else if (user.email == 'total1@gmail.com') {
                // to get joPetrol documant info from GasStatios collection
                DocumentReference<Object?> data = station.doc('total');

                data.get().then(
                  (DocumentSnapshot doc) {
                    // get info for gas station
                    final info = doc.data() as Map<String, dynamic>;
                    // to store orders information
                    List<dynamic> det = info['orders'];
                    // to get info for selected order
                    Map<String, dynamic> order =
                        det.elementAt(IndexProvider()._selectedIndex)
                            as Map<String, dynamic>;
                    // remove old order info (when order Not Done)
                    data.update({
                      'orders': FieldValue.arrayRemove([order]),
                    });
                    // update order info (make order Reject)
                    order.update('1Done', ((value) => 'Reject'));

                    // update database (make order Reject)
                    data.update({
                      'orders': FieldValue.arrayUnion([order]),
                    });
                  },
                );
              }
              // movt to next page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => orderInfo(),
                ),
              );
            },
          ),
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
    );
  }
}
