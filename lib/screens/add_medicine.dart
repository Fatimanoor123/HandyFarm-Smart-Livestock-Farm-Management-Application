import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyfarm/entity/AnimalMedicine.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/screens/MedicineList.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddMedicine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMedicineState();
  }
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController _name = TextEditingController();
  int group = 1;
  TextEditingController _reasons = TextEditingController();
  TextEditingController _symptoms = TextEditingController();

  //declare variable for Dropdown menu
  String dropdownvalue = 'Select';
  var items = ['Select', 'Antibiotic.', 'Vitamin.', 'Homeopathic', 'Normal'];

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override

  //Todo NAME WIDGET....
  Widget _buildmedicineName() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        icon: Icon(
          MdiIcons.pill,
        ),
        hintText: 'میڈیسن کا نام',
        labelText: 'Medicine Name',
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

  Widget _buildMedicineType() {
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
            MdiIcons.needle,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildSymptoms() {
    return TextFormField(
      controller: _symptoms,
      decoration: const InputDecoration(
        icon: Icon(Icons.medical_services_outlined),
        hintText: 'علامات',
        labelText: 'Symptoms',
      ),
      keyboardType: TextInputType.name,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter(RegExp("[a-z.]")),
      ],
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'symptoms are Required';
        }

        return null;
      },
    );
  }

  Widget _buildReasons() {
    return TextFormField(
      controller: _reasons,
      decoration: const InputDecoration(
        icon: Icon(Icons.medical_services_outlined),
        hintText: 'وجوہات',
        labelText: 'Reasons',
      ),
      keyboardType: TextInputType.name,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter(RegExp("[a-z.]")),
      ],
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'symptoms are Required';
        }

        return null;
      },
    );
  }

  Widget _buildRadio() {
    return Row(
      children: <Widget>[
        Radio(
            value: 1,
            groupValue: group,
            onChanged: (T) {
              print(T);
              setState(() {
                group = T;
              });
            }),
        Text('Disease'),
        Radio(
            value: 2,
            groupValue: group,
            onChanged: (T) {
              print(T);
              setState(() {
                group = T;
              });
            }),
        Text('Precautions'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Medicines (ادویات کا اندراج)")),
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
                _buildmedicineName(),
                _buildMedicineType(),
                _buildRadio(),
                _buildSymptoms(),
                _buildReasons(),
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
                    final medicaldao = database.AniMeddao;
                    var rng = new Random();
                    final Medicine = AnimalMedicine(
                        rng.nextInt(10000),
                        _symptoms.text,
                        _reasons.text,
                        _name.text,
                        dropdownvalue);
                    int MedicineId =
                        await medicaldao.insertAnimalMedicine(Medicine);
                    setState(() {});
                    clearData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicineList()),
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
    _name.clear();
    _reasons.clear();
    _symptoms.clear();
  }
}
