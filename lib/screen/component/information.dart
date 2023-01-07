import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/information.Body.dart';

class info extends StatelessWidget {
  final String location, service, docId;
  const info(
      {Key? key,
      required this.location,
      required this.service,
      required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage(
            "images/logo.png",
          ),
        ),
        title: Title(
          color: Colors.white,
          child: Text('Make order'),
        ),
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      body: infobody(
        location: location,
        service1: service,
        docId: docId,
      ),
    );
  }
}
