import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/DeliveryManHomePageBody.dart';

class deliverymanhomepage extends StatelessWidget {
  const deliverymanhomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.white,
            child: Text('Home Page'),
          ),
          backgroundColor: Color.fromARGB(190, 31, 37, 43),
        ),
        body: deliverymanhomepagebody());
  }
}
