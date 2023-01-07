import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../getFromDB/getOrderForDM.dart';

class OrderInformationbody extends StatefulWidget {
  OrderInformationbody({Key? key}) : super(key: key);
  @override
  State<OrderInformationbody> createState() => _OrderInformationbodyState();
}

class _OrderInformationbodyState extends State<OrderInformationbody> {
// to store id for collection (Deliveryman)
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

  // to determin current user (Deliveryman)
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 65, left: 65),
              child: Text(
                "Orders information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    // to return needed info depanding on deliveryman email (depanding on login)
                    if (user.email == 'ahmed@gmail.com') {
                      return GetDMOrder(DMId: 'Ahmed');
                    } else if (user.email == 'omar@gmail.com') {
                      return GetDMOrder(DMId: 'Yz1KIitz6GSpcYSM8You');
                    } else if (user.email == 'abdallahtahayneh@gmail.com') {
                      return GetDMOrder(DMId: 'gDcjBPDrLc7wQkJiHbyE');
                    } else if (user.email == 'laith@gmail.com') {
                      return GetDMOrder(DMId: 'pO0SWiMucZkKQfFt1Rlt');
                    } else if (user.email == 'wesam@gmail.com') {
                      return GetDMOrder(DMId: 'MqD15W4tbHIGMJT4J4jw');
                    } else if (user.email == 'hamzeh@gmail.com') {
                      return GetDMOrder(DMId: 'dZQediNQ6h4KZjY0OisT');
                    } else {
                      return Text('');
                    }
                  }),
            ),
          ],
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
