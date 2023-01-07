import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/Search.Body.dart';

import '../getFromDB/getService.dart';
class search extends StatelessWidget {
  search({Key? key}) : super(key: key);

  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('GasStations')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
      docIDs.add(document.reference.id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            showSearch(context: context, delegate:DataSearch());

          }, icon: Icon(Icons.search))
        ],
        // Add logo to appbar
        leading: Image(
          // Call image form project folder
          image: AssetImage(
            "images/logo.png",
          ),
        ),
        // Add title to appbar

        // Add background to appbar
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      // Go to Body() class to create body for main page
      body: searchbody(),
    );
  }
}
class DataSearch extends SearchDelegate {
  final cities=["joPetrol Amman-Abdon",
    "joPetrol Zarqa-Awajan",
    "total Amman-Abdon",
    "total Zarqa-new zarqa",
    "manaseer Amman-Tariq",
    "manseer Zarqa-new zarqa",
    "manseer Zarqa-new zarqa"

  ];

  @override
  buildActions(BuildContext context) {
    return [
      IconButton( icon: Icon(Icons.close),
        onPressed: () {
        query = "";
        },
      ),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon( icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
        },
    );
  } @override
Widget buildResults(BuildContext context) {
    return Container(

    );

  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ?
    cities :cities .where((element) => element.toLowerCase().contains(query) && element.startsWith(query)) .toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
      onTap: () {
        close(context, suggestions[index]
        );
      },
      leading: Icon(Icons.location_city),
      title: RichText( text: TextSpan( text: suggestions[index].substring(0, query.length),
          style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          children: [ TextSpan( text: suggestions[index].substring(query.length),
              style: TextStyle(color: Colors.grey)) ]
      ),
      ),
    ),
      itemCount: suggestions.length );
  }
}
