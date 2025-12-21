import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE1F5FE),
              Color(0xFFE1F5FE),
              Color(0xFFB3E5FC),
              Color(0xFFB3E5FC),
            ],
            stops: [0.0, 0.5, 0.9, 0.1],
          ),
        ),
        child: Container(
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Dairy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  color: Colors.grey,
                  height: 50,
                  width: 100,
                ),
              ),
            ]),
            SizedBox(
              height: 6,
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(children: <Widget>[
                    Container(
                      child: Text(
                        'Farm Name ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'XYZ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                  color: Colors.black26,
                  height: 40,
                ),
              ),
            ]),
            SizedBox(
              height: 3,
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(children: <Widget>[
                    Container(
                      child: Text(
                        'Total Animals ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                  color: Colors.black26,
                  height: 40,
                ),
              ),
            ]),
            SizedBox(
              height: 3,
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(children: <Widget>[
                    Container(
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'abc',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                  color: Colors.black26,
                  height: 40,
                ),
              ),
            ]),
            SizedBox(
              height: 8,
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Condition Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  color: Colors.grey,
                  height: 50,
                  width: 100,
                ),
              ),
            ]),
            SizedBox(
              height: 6,
            ),
            Row(children: <Widget>[
              SizedBox(
                width: 6,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/milking.png',
                              scale: 6.0, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Milking',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 120.0,
                  width: 85.0,
                  decoration: BoxDecoration(color: Colors.white)),
              SizedBox(
                width: 3,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/sick.png',
                              scale: 6.0, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sick',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 120.0,
                  width: 85.0,
                  decoration: BoxDecoration(color: Colors.white)),
              SizedBox(
                width: 3,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/DRy.png',
                              scale: 6.0, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Dry',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 120.0,
                  width: 85.0,
                  decoration: BoxDecoration(color: Colors.white)),
              SizedBox(
                width: 3,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/Pcow.jpeg',
                              scale: 7.5, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Pragnent',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 120.0,
                  width: 85.0,
                  decoration: BoxDecoration(color: Colors.white)),
            ]),
            SizedBox(
              height: 6,
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Details of Employees',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  color: Colors.grey,
                  height: 50,
                  width: 100,
                ),
              ),
            ]),
            SizedBox(
              height: 6,
            ),
            Row(children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/total.png',
                              scale: 6.0, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Total',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 140.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/presents.png',
                              scale: 6.0, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Present',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 140.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/absent.png',
                              scale: 6.0, alignment: Alignment.topCenter),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Absent',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 140.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white)),
            ]),
          ]),
        ),
      ),
    );
  }
}
