import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handyfarm/dao/ExpenseTypeDAO.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Expense.dart';
import 'package:handyfarm/entity/ExpenseType.dart';
import 'package:handyfarm/screens/Expenses.dart';
import 'package:image_picker/image_picker.dart';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class ExpenseUpdate extends StatefulWidget {
  final int Id;
  String price;
  String date;
  // receives the value
  ExpenseUpdate({Key key, this.Id, this.price, this.date}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpenseUpdateState();
  }
}

class _ExpenseUpdateState extends State<ExpenseUpdate> {
  bool _Nameenable = false;
  bool _priceenable = false;
  bool _emailenable = false;
  PickedFile _imageFile;

  TextEditingController _Expensename = TextEditingController();
  TextEditingController _Expenseprice = TextEditingController();

  String _address;

  //declare variable for Dropdown menu
  String dropdownvalue = 'Select';
  var items = ['Select', 'Tractors.', 'Cow Purchase.', 'Medicine Purchase'];

  String specievalue = 'Select';
  var element = [
    'Select',
    'Gujarati',
    'Red Sindhi',
    'Hallikar',
    'Sahiwal',
    'Cholistani',
    'Dhanni',
    'Tharparker',
    'Bhagnari',
    'Djal',
    'Rojhan',
    'Kankrej.',
    'Lohani'
  ];

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget _buildExpenseType(String name) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 20.0,
                spreadRadius: 0.5,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 44.0),
          margin: EdgeInsets.only(top: 5.0, left: 0.0, right: 16.0),
          child: DropdownButton(
            value: dropdownvalue,
            isExpanded: true,
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownvalue = newValue;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 4.0),
          child: Icon(
            Icons.money,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildExpensePrice(String amount) {
    return Center(
        child: TextFormField(
      enabled: _priceenable,
      controller: _Expenseprice..text = amount,
      decoration: const InputDecoration(
        icon: Icon(Icons.attach_money_sharp),
        hintText: 'اخراجات کی قیمت',
        labelText: 'Expense Price',
      ),
      inputFormatters: [
        CurrencyTextInputFormatter(
          locale: 'en_PK',
          decimalDigits: 0,
          symbol: 'RS',
        ),
      ],
      keyboardType: TextInputType.number,
    ));
  }

  Widget _buildDateofPurchase(String date) {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController..text = date,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Pick Date of Expenses',
      ),
      onTap: () async {
        var date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 5),
            lastDate: DateTime(DateTime.now().year + 5));
        dateController.text = date.toString().substring(0, 10);
      },
    ));
  }

  Widget _buildSpecie() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 20.0,
                spreadRadius: 0.5,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 44.0),
          margin: EdgeInsets.only(top: 2.0, left: 16.0, right: 16.0),
          child: DropdownButton(
            value: specievalue,
            isExpanded: true,
            items: element.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                specievalue = newValue;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 4.0),
          child: Icon(
            Icons.attractions,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edit Expenses")),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(24),
          child: Column(children: [
            FutureBuilder<Expense>(
                future: getExpense(widget.Id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      child: Form(
                        key: _formKey,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 6.0, // gap between adjacent chips
                          runSpacing: 4.0,
                          children: <Widget>[
                            _buildExpenseType(snapshot.data.name),
                            _buildExpensePrice(snapshot.data.Amount),
                            _buildDateofPurchase(snapshot.data.date),
                            SizedBox(height: 100),
                            RaisedButton(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_Nameenable == false) {
                                      _Nameenable = true;
                                    } else {
                                      _Nameenable = false;
                                    }
                                    if (_priceenable == false) {
                                      _priceenable = true;
                                    } else {
                                      _priceenable = false;
                                    }
                                  });
                                }),
                            SizedBox(width: 90),
                            RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                final database = await $FloorAppDatabase
                                    .databaseBuilder('app_database.db')
                                    .build();
                                final expensedao = database.Expensedao;
                                var rng = new Random();
                                final expense = Expense(
                                    widget.Id,
                                    dropdownvalue,
                                    _Expenseprice.text,
                                    dateController.text);

                                expensedao.updateExpense(expense);
                                setState(() {});
                                clearData();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExpenseList()),
                                );
                                //Send to API
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }
                })
          ]),
        )));
  }

  Future<Expense> getExpense(int ExpenseId) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final expensedao = database.Expensedao;

    print(ExpenseId);

    return await expensedao.getAllExpenseById(ExpenseId);
  }

  void clearData() {
    _Expenseprice.clear();
    _Expensename.clear();
  }
}
