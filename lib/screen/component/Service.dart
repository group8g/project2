import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/Service.Body.dart';

class Service extends StatelessWidget {

  const Service({Key? key}) : super(key: key);

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
          child: Text('Gas Station service delivery'),
        ),
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      body: servicebody(

      ),
    );
  }
}
