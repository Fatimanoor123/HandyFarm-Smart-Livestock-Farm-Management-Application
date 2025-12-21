import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Contact();
  }
}

class _Contact extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contact Us")),
        body: Container(
            child: RichText(
          text: TextSpan(
              text: 'Contact Us on',
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text: ' handyfarm@gmail.com',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )
              ]),
        )));
  }
}
