import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Expense.dart';
import 'package:handyfarm/screens/Expenses.dart';
import 'package:image_picker/image_picker.dart';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class AddExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  PickedFile _imageFile;

  TextEditingController _Expensename = TextEditingController();
  TextEditingController _expenseprice = TextEditingController();

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

  String get _ => null;

  @override
  Widget _buildExpenseType() {
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

  Widget _buildExpensePrice() {
    return Center(
        child: TextFormField(
      controller: _expenseprice,
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

  Widget _buildDateofPurchase() {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController,
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
      appBar: AppBar(title: Text("Add Expenses(اخراجات کا اندراج)")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 6.0, // gap between adjacent chips
              runSpacing: 4.0,
              children: <Widget>[
                _buildExpenseType(),
                _buildExpensePrice(),
                _buildDateofPurchase(),
                SizedBox(height: 100),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    final expense = Expense(rng.nextInt(10000), dropdownvalue,
                        _expenseprice.text, dateController.text);
                    int expenceId = await expensedao.insertExpense(expense);

                    setState(() {});
                    clearData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpenseList()),
                    );
                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearData() {
    _expenseprice.clear();
    _Expensename.clear();
  }
}
