import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Machine.dart';
import 'package:handyfarm/screens/MachineryList.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class AddMachinary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMachinaryState();
  }
}

class _AddMachinaryState extends State<AddMachinary> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _machineryname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _machineryprice = TextEditingController();
  String _url;

  //declare variable for Dropdown menu
  String dropdownvalue = 'Select';
  var items = [
    'Select',
    'Mowers.',
    'Backhoe.',
    'Harrow',
    'Cultivator',
    'Tractor.',
    'Sprayers'
  ];

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    //
  }

  //Todo NAME WIDGET....
  Widget _buildmachineName() {
    return TextFormField(
      controller: _machineryname,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'مشینری کا نام',
        labelText: 'Machinary Name',
      ),
      keyboardType: TextInputType.name,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter(RegExp("[a-z.]")),
      ],
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
    );
  }

  Widget _buildMachineryType() {
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
            Icons.agriculture_rounded,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildMachineryPrice() {
    return Center(
        child: TextFormField(
      controller: _machineryprice,
      decoration: const InputDecoration(
        icon: Icon(Icons.attach_money_sharp),
        hintText: 'مشینری کی قیمت',
        labelText: 'Machinery Price',
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
        labelText: 'Pick Date of Purchase',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Machinery مشینری کا اندراج")),
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
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                ),
                _buildmachineName(),
                _buildMachineryType(),
                _buildMachineryPrice(),
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
                    final machinedao = database.machinedao;
                    var rng = new Random();
                    final machine = Machine(
                        rng.nextInt(10000),
                        _machineryname.text,
                        dropdownvalue,
                        dateController.text,
                        _machineryprice.text);
                    int machineId = await machinedao.insertMachine(machine);
                    //Send to API
                    setState(() {});
                    clearData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MachineryList()),
                    );
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
    _address.clear();
    _machineryprice.clear();
    _machineryname.clear();
  }
}
