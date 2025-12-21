import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Precaution extends StatefulWidget {
  @override
  _PrecautionPage createState() => _PrecautionPage();
}

class _PrecautionPage extends State<Precaution> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
                title: Text('Precautionary Measurements'),
                backgroundColor: Theme
                    .of(context)
                    .accentColor,
                elevation: 1,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )),
            body: Container(
                padding: EdgeInsets.only(left: 16, top: 25, right: 16),

                child: Column(children: [
                  Text(
                    "Precautions",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),

                  ),
                  SizedBox(
                    height: 30,
                  ),
                 Text(
                     '1',
                 textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 25.0,
                   ),
                 ),
                        Text(
                          ' If more than 5 days pregnancy don’t travel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            wordSpacing: 0.4,
                          ) ),
                        Text(
                          ' because it will increase the risk of miscarriage. Duration is between',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              wordSpacing: 3.0,
                            )
                        ),
                        Text(
                            ' 5 to 42 days or 60 days.!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                            )
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                      ' If 8-16 days pregnancy then keep them in a',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        wordSpacing: 0.4,
                      ) ),
                  Text(
                      ' normal environment. Because during this',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        wordSpacing: 3.0,
                      )
                  ),
                  Text(
                      'time period the level of progesterone increases ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,

                      )
                  ),
                  Text(
                      'which will affect the development of embryos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                      '42-75 days than not to do ultrasound because',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        wordSpacing: 0.4,
                      ) ),
                  Text(
                      'greater risk for early pregnancy loss and can vary greatly based',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        wordSpacing: 3.0,
                      )
                  ),
                  Text(
                      'on stage of pregnancy and skill of the technician.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,

                      )
                  ),
                  Text(
                      'which will affect the development of embryos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                      )
                  ),
                      ],
                    ),
                  ),

                ));

  }
}
