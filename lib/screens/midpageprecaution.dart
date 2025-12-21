import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyfarm/screens/Precaution.dart';
import 'package:handyfarm/screens/PrecautionUrdu.dart';

class MidPage extends StatefulWidget {
  @override
  _MidPageState createState() => _MidPageState();
}

class _MidPageState extends State<MidPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Precautionary Measurement'),
      ),
      body: Container(

        child: ListView(

          children: [

            SizedBox(
              height: 40,
            ),
            Row(
              children: [

                FlatButton(
                  child: Text('English', style: TextStyle(fontSize: 20.0),),
                  color: Colors.blue,
                  textColor: Colors.white,

               onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Precaution()),
                    );
                  },

                ),
                SizedBox(
                  width: 60,
                ),
                FlatButton(
                  child: Text('اردو', style: TextStyle(fontSize: 20.0),),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrecautionUrdu()),
                    );
                  },

                ),
              ],
            )
          ],
        ),
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(30.0),


      ),
    ); }
  }
