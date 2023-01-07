import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/Service.dart';

// to get index for order array depandig on selected item
class IndexProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => this._selectedIndex;
  set setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

var payment = 'visa';
var count = 0;

class infobody extends StatefulWidget {
  final String location, service1, docId;
  const infobody(
      {Key? key,
      required this.location,
      required this.service1,
      required this.docId})
      : super(key: key);
  @override
  State<infobody> createState() => _infobodyState();
}

class _infobodyState extends State<infobody> {
  static const List<String> services = <String>[
    "Month",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  static const List<String> phones = <String>[
    "Years",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
  ];
  var service = services.first;
  var phone = phones.first;

  int count = 0;

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
            margin: EdgeInsets.only(left: 60, top: 20),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              'Order infromation',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
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
              widget.location,
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
            margin: EdgeInsets.only(left: 25, right: 25, top: 200),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              'Requied service:',
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
            margin: EdgeInsets.only(left: 40, right: 40, top: 240),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              widget.service1,
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
            margin: EdgeInsets.only(left: 25, right: 25, top: 300),
            padding: EdgeInsets.only(top: 15, bottom: 27),
            child: Text(
              'Payment method:',
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
            margin: EdgeInsets.only(right: 50, top: 350),
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: TextButton(
                            child: Icon(
                              Icons.circle_outlined,
                              color: Colors.green,
                              size: 40,
                            ),
                            onPressed: () {
                              setState(() {
                                payment = 'Cash';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 17),
                          child: Text(
                            'Cash',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 450,
            height: 140,
            margin: EdgeInsets.only(right: 50, top: 390),
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: TextButton(
                            child: Icon(
                              Icons.circle_outlined,
                              color: Colors.green,
                              size: 40,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        insetPadding: EdgeInsets.symmetric(
                                            vertical: 130, horizontal: 25),
                                        backgroundColor: Colors.black,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                payment = 'Visa';
                                              });
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog());
                                            },
                                            child: Text(
                                              'Done',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 10),
                                                width: 200,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'First and last name(in card):',
                                                    labelStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 30),
                                                width: 200,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    labelText: 'Card number:',
                                                    labelStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 35),
                                                width: 200,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    labelText: 'CVV code',
                                                    labelStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    margin: EdgeInsets.only(
                                                        left: 15, top: 45),
                                                    child: Row(
                                                      children: [
                                                        DropdownButton<String>(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white),
                                                          value: service,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_downward,
                                                            color: Colors.blue,
                                                            size: 25,
                                                          ),
                                                          items: services.map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged:
                                                              (String? value) {
                                                            setState(() {
                                                              service = value!;
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    margin: EdgeInsets.only(
                                                        left: 15, top: 45),
                                                    child: Row(
                                                      children: [
                                                        DropdownButton<String>(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white),
                                                          value: phone,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_downward,
                                                            color: Colors.blue,
                                                            size: 25,
                                                          ),
                                                          items: phones.map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged:
                                                              (String? value) {
                                                            setState(() {
                                                              phone = value!;
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 17),
                          child: Text(
                            'VISA',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 140, top: 560),
            width: 120,
            color: Color.fromARGB(190, 31, 37, 43),
            child: TextButton(
              child: Text(
                'Submit order',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: (Text(
                            "Order sent to Gas station \n need 20 minute \n to deliver",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          content: TextButton(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ////////////////////////////////////////////////////////////////////////////////////
                              onPressed: () {
                                this.count = count + 1;
                                // to determine collection (Gas station) from database

                                CollectionReference station = FirebaseFirestore
                                    .instance
                                    .collection('GasStations');
                                if (widget.docId == 'total') {
                                  // to get total documant from database
                                  DocumentReference<Object?> data =
                                      station.doc('total');

                                  // to get data fot joPetrol documant
                                  data.get().then(
                                    (DocumentSnapshot doc) {
                                      // to get station data
                                      final info =
                                          doc.data() as Map<String, dynamic>;

                                      // to store orders information
                                      List<dynamic> det = info['orders'];

                                      // get selcted order
                                      Map<String, dynamic> order =
                                          det.elementAt(IndexProvider()
                                                  ._selectedIndex)
                                              as Map<String, dynamic>;

                                      // sort original map (order)
                                      List<MapEntry<String, dynamic>> listData =
                                          order.entries.toList();
                                      listData.sort(
                                          ((a, b) => a.key.compareTo(b.key)));

                                      // save sort map
                                      final Map<String, dynamic> sortOrder =
                                          Map.fromEntries(listData);

                                      // to sava selected order info into Map to use it to update database
                                      Map<dynamic, String> docData =
                                          <dynamic, String>{};
                                      // add data to docData list
                                      docData.addAll({
                                        //"station": data.id,
                                        "1Done": 'Not Done',
                                        "2Location": widget.location,
                                        "3Order num": "${this.count}", ////
                                        "4Phone": info['phone'],
                                        "5Service need": widget.service1,
                                        "6payment": payment,
                                        "7city": "Amman",
                                      });

                                      // update order for gas station in database
                                      data.update({
                                        'orders':
                                            FieldValue.arrayUnion([docData]),
                                      });
                                    },
                                  );
                                } else if (widget.docId == 'joPetrol') {
                                  // to get total documant from database
                                  DocumentReference<Object?> data =
                                      station.doc('joPetrol');

                                  // to get data fot joPetrol documant
                                  data.get().then(
                                    (DocumentSnapshot doc) {
                                      // to get station data
                                      final info =
                                          doc.data() as Map<String, dynamic>;

                                      // to store orders information
                                      List<dynamic> det = info['orders'];

                                      // get selcted order
                                      Map<String, dynamic> order =
                                          det.elementAt(IndexProvider()
                                                  ._selectedIndex)
                                              as Map<String, dynamic>;

                                      // sort original map (order)
                                      List<MapEntry<String, dynamic>> listData =
                                          order.entries.toList();
                                      listData.sort(
                                          ((a, b) => a.key.compareTo(b.key)));

                                      // save sort map
                                      final Map<String, dynamic> sortOrder =
                                          Map.fromEntries(listData);

                                      // to sava selected order info into Map to use it to update database
                                      Map<dynamic, String> docData =
                                          <dynamic, String>{};
                                      // add data to docData list
                                      docData.addAll({
                                        //"station": data.id,
                                        "1Done": 'Not Done',
                                        "2Location": widget.location,
                                        "3Order num": "${this.count}", ////
                                        "4Phone": info['phone'],
                                        "5Service need": widget.service1,
                                        "6payment": payment,
                                        "7city": "Amman",
                                      });

                                      // update order for gas station in database
                                      data.update({
                                        'orders':
                                            FieldValue.arrayUnion([docData]),
                                      });
                                    },
                                  );
                                } else if (widget.docId == 'manaseer') {
                                  // to get total documant from database
                                  DocumentReference<Object?> data =
                                      station.doc('manaseer');

                                  // to get data fot joPetrol documant
                                  data.get().then(
                                    (DocumentSnapshot doc) {
                                      // to get station data
                                      final info =
                                          doc.data() as Map<String, dynamic>;

                                      // to store orders information
                                      List<dynamic> det = info['orders'];

                                      // get selcted order
                                      Map<String, dynamic> order =
                                          det.elementAt(IndexProvider()
                                                  ._selectedIndex)
                                              as Map<String, dynamic>;

                                      // sort original map (order)
                                      List<MapEntry<String, dynamic>> listData =
                                          order.entries.toList();
                                      listData.sort(
                                          ((a, b) => a.key.compareTo(b.key)));

                                      // save sort map
                                      final Map<String, dynamic> sortOrder =
                                          Map.fromEntries(listData);

                                      // to sava selected order info into Map to use it to update database
                                      Map<dynamic, String> docData =
                                          <dynamic, String>{};
                                      // add data to docData list
                                      docData.addAll({
                                        //"station": data.id,
                                        "1Done": 'Not Done',
                                        "2Location": widget.location,
                                        "3Order num": "${this.count}",
                                        "4Phone": info['phone'],
                                        "5Service need": widget.service1,
                                        "6payment": payment,
                                        "7city": "Amman",
                                      });

                                      // update order for gas station in database
                                      data.update({
                                        'orders':
                                            FieldValue.arrayUnion([docData]),
                                      });
                                    },
                                  );
                                }

                                ///////////////////////////////////////////

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Service(),
                                  ),
                                );
                              }),
                        )),
              },
            ),
          ),
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
              margin: EdgeInsets.only(top: 750),
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
              margin: EdgeInsets.only(left: 200, top: 750),
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
