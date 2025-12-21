import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyfarm/screens/Console.dart';
import 'package:handyfarm/screens/HomePage.dart';
//import 'package:handyfarm/screens/LoginFormValidation.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.5, 0.7, 1.0],
          ),
        ),
        child: Container(
          child: Align(
              alignment: Alignment(0.20, 0.25),
              child: Text(
                "HandyFarm",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                  fontFamily: 'OpenSans',
                ),
              )),
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 2.0,
              image: AssetImage('assets/logo.png'),
            ),
          ),
        ));
  }
}
