import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/Make.dart';
import 'package:flutter_application_1/screen/component/Search.dart';

class tabbody extends StatefulWidget {
  const tabbody({Key? key}) : super(key: key);

  @override
  State<tabbody> createState() => _tabbodyState();
}

class _tabbodyState extends State<tabbody> {
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
                        onPressed: () => {
                          Navigator.push(
                            // Action (go to the next page)
                            context,
                            MaterialPageRoute(
                              // Determinr next page
                              builder: (context) => make(),
                            ),
                          )
                        },
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
                        onPressed: () => {
                          Navigator.push(
                            // Action (go to the next page)
                            context,
                            MaterialPageRoute(
                              // Determinr next page
                              builder: (context) => search(),
                            ),
                          )
                        },
                      ),
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
