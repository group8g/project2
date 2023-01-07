import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class searchbody extends StatefulWidget {
  const searchbody({Key? key}) : super(key: key);
  @override
  State<searchbody> createState() => _searchbodyState();
}




class _searchbodyState extends State<searchbody> {
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
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      padding: EdgeInsets.only(top: 10, bottom: 35, left: 15),
                      decoration: BoxDecoration(color: Colors.white),
                      height: 75,
                      width: 196,
                      child: TextButton(
                        child: Icon(
                          Icons.grid_view_sharp,
                          color: Colors.black,
                          size: 50,
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      padding: EdgeInsets.only(top: 10, bottom: 35, left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                      height: 75,
                      width: 196,
                      child: TextButton(
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 50,
                          ),
                          onPressed: () => {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
