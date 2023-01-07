import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/DeliveryManHomePage.dart';

class UpdateInformationbody extends StatefulWidget {
  const UpdateInformationbody({Key? key}) : super(key: key);
  @override
  State<UpdateInformationbody> createState() => _UpdateInformationbodyState();
}

enum selectedCityClass { none, amman, zarqa }

class _UpdateInformationbodyState extends State<UpdateInformationbody> {
  final user = FirebaseAuth.instance.currentUser!;

  static const List<String> Amman = <String>[
    "Select region",
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
    "Um al-Hiran",
    "Uhud",
    "Wadi As-seir",
    "Wadi Saqra",
    "Wadi Abdoun",
    "Zahran",
  ];

  static const List<String> Zarqa = <String>[
    "Select region",
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

  static const List<String> phones = <String>[
    "079",
    "078",
    "077",
  ];

  var amman = Amman.first;
  var zarqa = Zarqa.first;
  var phone = phones.first;
  var selectedValue = 0;
  var selectedCity;

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  selectedCityClass? selectedCit = selectedCityClass.none;

  @override
  Widget build(BuildContext context) {
    if (selectedValue == 1) {
      selectedCity = "Amman " + " - " + amman;
    } else if (selectedValue == 2) {
      selectedCity = "Zarqa " + " - " + zarqa;
    } else if (selectedValue == 0 || amman == Amman[0] || zarqa == Zarqa[0]) {
      selectedCity = 'none';
    }

    return Center(
        child: Stack(children: <Widget>[
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
      Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 100),
        child: Row(
          children: [
            DropdownButton<String>(
              alignment: AlignmentDirectional.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromRGBO(0, 0, 0, 100),
              ),
              value: phone,
              icon: Icon(
                Icons.arrow_downward,
                color: Colors.blue,
                size: 25,
              ),
              onChanged: (String? value) {
                setState(() {
                  phone = value!;
                });
              },
              items: phones.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: myController,
                maxLength: 7,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 180),
        child: TextField(
          controller: myController2,
          decoration: InputDecoration(
            labelText: 'Gas station',
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 280),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Radio<selectedCityClass>(
                    value: selectedCityClass.amman,
                    groupValue: selectedCit,
                    onChanged: (value) {
                      setState(() {
                        selectedCit = value!;
                        selectedValue = 1;
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
                Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Radio<selectedCityClass>(
                    value: selectedCityClass.zarqa,
                    groupValue: selectedCit,
                    onChanged: (value) {
                      setState(() {
                        selectedCit = value!;
                        selectedValue = 2;
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
            Row(
              children: [
                DropdownButton<String>(
                  alignment: AlignmentDirectional.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 100),
                  ),
                  value: amman,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                    size: 25,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      amman = value!;
                    });
                  },
                  items: Amman.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  alignment: AlignmentDirectional.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 100),
                  ),
                  value: zarqa,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                    size: 25,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      zarqa = value!;
                    });
                  },
                  items: Zarqa.map<DropdownMenuItem<String>>((String value) {
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
      Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 550),
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
                if (user.email == 'ahmed@gmail.com') {
                  final updateInfo = FirebaseFirestore.instance
                      .collection('Deliveryman')
                      .doc('Ahmed');
                  if (myController.text.isNotEmpty) {
                    updateInfo.update({
                      'phonenumber': phone + myController.text,
                    });
                  }

                  if (selectedCity != 'none') {
                    updateInfo.update({
                      'Location': selectedCity,
                    });
                  }

                  if (myController2.text.isNotEmpty) {
                    updateInfo.update({
                      'station': myController2.text,
                    });
                  }
                } else if (user.email == 'omar@gmail.com') {
                  final updateInfo = FirebaseFirestore.instance
                      .collection('Deliveryman')
                      .doc('Yz1KIitz6GSpcYSM8You');
                  if (myController.text.isNotEmpty) {
                    updateInfo.update({
                      'phonenumber': phone + myController.text,
                    });
                  }

                  if (selectedCity != 'none') {
                    updateInfo.update({
                      'Location': selectedCity,
                    });
                  }

                  if (myController2.text.isNotEmpty) {
                    updateInfo.update({
                      'station': myController2.text,
                    });
                  }
                } else if (user.email == 'abdallahtahayneh@gmail.com') {
                  final updateInfo = FirebaseFirestore.instance
                      .collection('Deliveryman')
                      .doc('gDcjBPDrLc7wQkJiHbyE');
                  if (myController.text.isNotEmpty) {
                    updateInfo.update({
                      'phonenumber': phone + myController.text,
                    });
                  }

                  if (selectedCity != 'none') {
                    updateInfo.update({
                      'Location': selectedCity,
                    });
                  }

                  if (myController2.text.isNotEmpty) {
                    updateInfo.update({
                      'station': myController2.text,
                    });
                  }
                } else if (user.email == 'laith@gmail.com') {
                  final updateInfo = FirebaseFirestore.instance
                      .collection('Deliveryman')
                      .doc('pO0SWiMucZkKQfFt1Rlt');
                  if (myController.text.isNotEmpty) {
                    updateInfo.update({
                      'phonenumber': phone + myController.text,
                    });
                  }

                  if (selectedCity != 'none') {
                    updateInfo.update({
                      'Location': selectedCity,
                    });
                  }

                  if (myController2.text.isNotEmpty) {
                    updateInfo.update({
                      'station': myController2.text,
                    });
                  }
                } else if (user.email == 'wesam@gmail.com') {
                  final updateInfo = FirebaseFirestore.instance
                      .collection('Deliveryman')
                      .doc('MqD15W4tbHIGMJT4J4jw');
                  if (myController.text.isNotEmpty) {
                    updateInfo.update({
                      'phonenumber': phone + myController.text,
                    });
                  }

                  if (selectedCity != 'none') {
                    updateInfo.update({
                      'Location': selectedCity,
                    });
                  }

                  if (myController2.text.isNotEmpty) {
                    updateInfo.update({
                      'station': myController2.text,
                    });
                  }
                } else if (user.email == 'hamzeh@gmail.com') {
                  final updateInfo = FirebaseFirestore.instance
                      .collection('Deliveryman')
                      .doc('dZQediNQ6h4KZjY0OisT');
                  if (myController.text.isNotEmpty) {
                    updateInfo.update({
                      'phonenumber': phone + myController.text,
                    });
                  }

                  if (selectedCity != 'none') {
                    updateInfo.update({
                      'Location': selectedCity,
                    });
                  }

                  if (myController2.text.isNotEmpty) {
                    updateInfo.update({
                      'station': myController2.text,
                    });
                  }
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => deliverymanhomepage(),
                  ),
                );
              }))
    ]));
  }
}
