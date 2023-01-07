import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/DeliveryManOrderInformationBody.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({Key? key}) : super(key: key);

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
          child: Text('Login'),
        ),
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      body: OrderInformationbody(),
    );
  }
}
