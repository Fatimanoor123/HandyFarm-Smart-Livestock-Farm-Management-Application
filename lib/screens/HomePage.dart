import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyfarm/screens/AllExpenses.dart';
import 'package:handyfarm/screens/All_Animal.dart';
import 'package:handyfarm/screens/All_Employee.dart';
import 'package:handyfarm/screens/Console.dart';
import 'package:handyfarm/screens/Expenses.dart';
import 'package:handyfarm/screens/Animals.dart';
import 'package:handyfarm/screens/employee_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
                title: Text('HandyFarm'),
                leading: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.dashboard)),
                    Tab(icon: Icon(Icons.pets_outlined)),
                    Tab(icon: Icon(Icons.monetization_on_outlined)),
                    Tab(icon: Icon(Icons.group)),
                  ],
                )),
            body: TabBarView(
              children: [
                Console(),
                All_Animals(),
                AllExpenses(),
                AllEmployee(),
              ],
            ),
            /*drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
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
                    child: Text('HandyFarm'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: Text("Contact Us"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),

                  /* ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Share with Friends"),
                    onTap: () {},
                  ),*/

                  /*  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginFormValidation()),
                      );                   },
                  ),*/
                ],
              ),
            ), */
          ),
        ));
  }
}
