import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:handyfarm/screens/ForgotPassword.dart';
import 'package:handyfarm/screens/RegistrationForm.dart';
import 'HomePage.dart';
import 'RegistrationForm.dart';
import 'package:handyfarm/screens/Home.dart';

class LoginFormValidation extends StatefulWidget {
  @override
  _LoginFormValidationState createState() => _LoginFormValidationState();
}

class _LoginFormValidationState extends State<LoginFormValidation> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("HandFarm"),
        leading: IconButton(icon: Image.asset('assets/logo.png')),
      ),
      body: SingleChildScrollView(
        child: Form(
            autovalidate: true, //check for validation while typing
            key: formkey,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Center(
                      child: Container(
                          width: 200,
                          height: 100,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.blue, fontSize: 35),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email (ای میل)',
                            hintText: 'Enter valid email id as abc@gmail.com'),
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          EmailValidator(errorText: "Enter valid email id"),
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          MinLengthValidator(6,
                              errorText:
                                  "Password should be atleast 6 characters"),
                          MaxLengthValidator(15,
                              errorText:
                                  "Password should not be greater than 15 characters")
                        ])
                        //validatePassword,        //Function to check validation
                        ),
                  ),
                  FlatButton(
                    onPressed: () {
                      /*  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );*/
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                          print("Validated");
                        } else {
                          print("Not Validated");
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationForm()),
                      );
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: Text(
                      'Dont have an account? Sign Up',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
