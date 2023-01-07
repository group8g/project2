import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screen/component/GasStationHomepage.dart';
import 'package:flutter_application_1/screen/component/stationInfo.dart';

class UpdateInfoGasStationBody extends StatefulWidget {
  const UpdateInfoGasStationBody({Key? key}) : super(key: key);

  @override
  State<UpdateInfoGasStationBody> createState() =>
      _UpdateInfoGasStationBodyState();
}

enum selectedCityClass { none, amman, zarqa }

class _UpdateInfoGasStationBodyState extends State<UpdateInfoGasStationBody> {
  // determine user (depanding on login)
  final user = FirebaseAuth.instance.currentUser!;
  // services list
  static const List<String> services = <String>[
    "Add service",
    "Gasoline filling for car",
    "Disesel filling for car",
    "Disesel filling for hitting system",
    "Car wash",
    "Car dryclean",
    "Oil change",
    "Flat tires change",
    "Battery charge",
  ];

  // ammans list
  static const List<String> ammans = <String>[
    "Selcet region",
    "Abu Alanda",
    "Abu Nseir",
    "Al-giza",
    "Al-hawwasiyah",
    "Al Muqablain",
    "Al-qweesmeh",
    "Almowaqar",
    "Alnasser",
    "Al-swaifyeh",
    "Al-hasmi",
    "Abdoun",
    "Alrabieh",
    "Badr",
    "Basman",
    "Dahyat Ahyasmin",
    "Dahyat Alameer Hassan",
    "Downtown",
    "Husban",
    "Jabal Amman",
    "Jabal Al-hussein",
    "Jabal Al-nozha",
    "Kho",
    "Kalda",
    "Marka",
    "Marj Ah-hammam",
    "New Badr",
    "Nazal",
    "Ras Al-Ain",
    "South Amman",
    "Shafa Badran",
    "Sweileh",
    "Tla' Al-Ali",
    "Tariq",
    "Taburbor",
    "Um al-Hiran",
    "Uhud",
    "Wadi As-seir",
    "Wadi Saqra",
    "Wadi Abdoun",
    "Zahran",
  ];

  // zarqas list
  static const List<String> zarqas = <String>[
    "Selcet region",
    "Al-zawahrah",
    "Alameer Mohammad",
    "Al-falah",
    "Awajan",
    "Hashimeiyah",
    "Jannaa'ah",
    "Ma'asoum",
    "New Zarqa",
    "Ramzi",
    "Russeifa",
    "Wadi Al-haja",
  ];

  // phone list
  static const List<String> phones = <String>[
    "079",
    "078",
    "077",
  ];

  // get first value for each list
  var service = services.first;
  var amman = ammans.first;
  var zarqa = zarqas.first;
  var phone = phones.first;
  var selecedValue = 0;
  // to can read value from text filed (phone number)
  final myController = TextEditingController();

  // get selected city
  var selectedCity;

  // to save value of radio button depunding on selected value
  selectedCityClass? selectedCit = selectedCityClass.none;

  @override
  Widget build(BuildContext context) {
    // show result depunding on selected radio button
    if (selecedValue == 1) {
      selectedCity = "Amman " + " - " + amman;
    } else if (selecedValue == 2) {
      selectedCity = "Zarqa " + " - " + zarqa;
    } else if (selecedValue == 0 &&
        (amman == ammans[0] || zarqa == zarqas[0])) {
      selectedCity = 'none';
    }
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
          // Add gas station phone number (textfiled)

          // phone number
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 120),
            child: Row(
              children: [
                // list of phone
                DropdownButton<String>(
                  alignment: AlignmentDirectional.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 100),
                  ),
                  // determint view value when no selected item
                  value: phone,
                  // dropdown icon
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                    size: 25,
                  ),
                  // to change to selected value from list
                  onChanged: (String? value) {
                    setState(() {
                      phone = value!;
                    });
                  },
                  // list of item in dropdown
                  items: phones.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
                // text field
                Container(
                  width: 300,
                  child: TextField(
                    /* save phone number in variable */
                    controller: myController,
                    maxLength: 7,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: ' Phone number',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add gas station location
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 220),
            child: Column(
              children: [
                // add title
                Text(
                  "Add Location",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                // add radio button
                Row(
                  children: [
                    // amman radio button
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Radio<selectedCityClass>(
                        value: selectedCityClass.amman,
                        groupValue: selectedCit,
                        onChanged: (value) {
                          setState(() {
                            selectedCit = value!;
                            selecedValue = 1;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Amman",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // zarqa radio button
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: Radio<selectedCityClass>(
                        value: selectedCityClass.zarqa,
                        groupValue: selectedCit,
                        onChanged: (value) {
                          setState(() {
                            selectedCit = value!;
                            selecedValue = 2;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Zarqa",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // add dropdown list
                Row(
                  children: [
                    // for amman region
                    DropdownButton<String>(
                      alignment: AlignmentDirectional.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 100),
                      ),
                      // value of selected elemant from amman list
                      value: amman,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.blue,
                        size: 25,
                      ),
                      // to change value depunding on selected elemant
                      onChanged: (String? value) {
                        setState(() {
                          amman = value!;
                        });
                      },
                      // add amman list item to drop down list
                      items:
                          ammans.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                    // for zarqa region
                    DropdownButton<String>(
                      alignment: AlignmentDirectional.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromRGBO(0, 0, 0, 100),
                      ),
                      // to put value of selected elemant from zarqa list
                      value: zarqa,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.blue,
                        size: 25,
                      ),
                      // to change value depunding on selected elemant
                      onChanged: (String? value) {
                        setState(() {
                          zarqa = value!;
                        });
                      },
                      // add zarqa list item to drop down list
                      items:
                          zarqas.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // show result
                Row(
                  children: [
                    Text(
                      "Added location: " + " " + selectedCity,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Add gas station service
          Container(
            margin: EdgeInsets.only(left: 45, right: 15, top: 380),
            child: Row(
              children: [
                // to add services list
                DropdownButton<String>(
                  alignment: AlignmentDirectional.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  // to put value of selected service
                  value: service,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                  ),
                  // to change value depanding on selected elemant
                  onChanged: (String? value) {
                    setState(() {
                      service = value!;
                    });
                  },
                  // to add services list elemant to drop list
                  items: services.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          // Add update button
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 520),
            width: 400,
            color: Color.fromARGB(190, 31, 37, 43),
            child: TextButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // update in database
                  if (user.email == 'total1@gmail.com') {
                    final updateInfo = FirebaseFirestore.instance
                        .collection('GasStations')
                        .doc('total');
                    if ('locations' != FieldValue.arrayUnion([selectedCity]) ||
                        'services' != FieldValue.arrayUnion([service])) {
                      if (myController.text.isNotEmpty) {
                        updateInfo.update({
                          'phone': phone + myController.text,
                        });
                      }
                      if (selectedCity != 'none') {
                        updateInfo.update({
                          'locations': FieldValue.arrayUnion([selectedCity]),
                        });
                      }
                      if (service != services.first) {
                        updateInfo.update({
                          'services': FieldValue.arrayUnion([service]),
                        });
                      }
                    }
                  } else if (user.email == 'jopetrol@gmail.com') {
                    final updateInfo = FirebaseFirestore.instance
                        .collection('GasStations')
                        .doc('joPetrol');
                    if ('locations' != FieldValue.arrayUnion([selectedCity]) ||
                        'services' != FieldValue.arrayUnion([service])) {
                      if (myController.text.isNotEmpty) {
                        updateInfo.update({
                          'phone': phone + myController.text,
                        });
                      }
                      if (selectedCity != 'none') {
                        updateInfo.update({
                          'locations': FieldValue.arrayUnion([selectedCity]),
                        });
                      }
                      if (service != services.first) {
                        updateInfo.update({
                          'services': FieldValue.arrayUnion([service]),
                        });
                      }
                    }
                  } else if (user.email == 'manaseer@gmail.com') {
                    final updateInfo = FirebaseFirestore.instance
                        .collection('GasStations')
                        .doc('manaseer');
                    if ('locations' != FieldValue.arrayUnion([selectedCity]) ||
                        'services' != FieldValue.arrayUnion([service])) {
                      if (myController.text.isNotEmpty) {
                        updateInfo.update({
                          'phone': phone + myController.text,
                        });
                      }
                      if (selectedCity != 'none') {
                        updateInfo.update({
                          'locations': FieldValue.arrayUnion([selectedCity]),
                        });
                      }
                      if (service != services.first) {
                        updateInfo.update({
                          'services': FieldValue.arrayUnion([service]),
                        });
                      }
                    }
                  }

                  Navigator.push(
                    // Action (go to the next page)
                    context,
                    MaterialPageRoute(
                      // Determinr next page
                      builder: (context) => StationInfo(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
