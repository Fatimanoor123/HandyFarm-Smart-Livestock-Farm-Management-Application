import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrecautionUrdu extends StatefulWidget {
  @override
  _PrecautionUrduState createState() => _PrecautionUrduState();
}

class _PrecautionUrduState extends State<PrecautionUrdu> {
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
                "احتیاطی تدابیر",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),

              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '	۱',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text(
                  ' اگر حمل 5 دن سے زیادہ ہے پھر سفر نہ کریں ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 0.4,
                  ) ),
              Text(
                  ' کیونکہ اس سے اسقاط حمل ہونے کا خطرہ بڑھ جائے گا۔ دورانیہ درمیان ہے',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 3.0,
                  )
              ),
              Text(
                  ' 5 سے 42 دن یا 60 دن!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                  )
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '۲',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text(
                  'اگر 8-16 دن حمل ہے تو پھر انہیں ایکایک عام ماحول ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 0.4,
                  ) ),
              Text(
                  'میں رکھیں۔',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 3.0,
                  )
              ),
              Text(
                  'اس وقت کے دوران پروجیسٹرون کی سطح بڑھ جاتی ہے ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,

                  )
              ),
              Text(
                  'جس سے جنین کی نشوونما متاثر ہوتی ہے',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                  )
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '۳',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text(
                  'اگر حمل کا دورانیہ 75 42-75 days دن ہے',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 0.4,
                  ) ),
              Text(
                  'تو پھر الٹراساؤنڈ نہ کریں کیونکہ حمل کے ابتدائی نقصان کا زیادہ خطرہ ہے',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    wordSpacing: 3.0,
                  )
              ),
              Text(
                  'اور حمل کے مرحلے اور ٹیکنیشن کی مہارت کی بنا پر بہت مختلف ہوسکتا ہے',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,

                  )
              ),
              Text(
                  ' جو برانوں کی ترقی کو متاثر کرے گا',
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
