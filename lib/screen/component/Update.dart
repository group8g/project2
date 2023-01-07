import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/component/UpdateBody.dart';

class update extends StatelessWidget {
  const update({Key? key}) : super(key: key);

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
          child: Text('Update information'),
        ),
        backgroundColor: Color.fromARGB(190, 31, 37, 43),
      ),
      body:updatebody(),
    );
  }
}
