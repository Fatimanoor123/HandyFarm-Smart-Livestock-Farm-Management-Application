import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handyfarm/entity/AnimalMedicine.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Medicine.dart';
import 'package:handyfarm/screens/MedicineList.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MedicineCRUD extends StatefulWidget {
  final int MedicineId;
  String name;
  final String type;
  String symptoms;
  String reason; // receives the value
  MedicineCRUD(
      {Key key,
      this.MedicineId,
      this.name,
      this.type,
      this.symptoms,
      this.reason})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MedicineCRUDState();
  }
}

class _MedicineCRUDState extends State<MedicineCRUD> {
  bool _Nameenable = false;
  bool _symptomsenable = false;
  bool _reasonsenable = false;
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
  Widget _buildmedicineName(String name) {
    return TextFormField(
      controller: _name..text = name,
      decoration: const InputDecoration(
        icon: Icon(
          MdiIcons.pill,
        ),
        hintText: 'میڈیسن کا نام',
        labelText: 'Medicine Name',
      ),
      keyboardType: TextInputType.name,
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
    );
  }

  Widget _buildMedicineType(String type) {
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

  Widget _buildSymptoms(String symptoms) {
    return TextFormField(
      enabled: _symptomsenable,
      controller: _symptoms..text = symptoms,
      decoration: const InputDecoration(
        icon: Icon(Icons.medical_services_outlined),
        hintText: 'علامات',
        labelText: 'Symptoms',
      ),
      keyboardType: TextInputType.name,
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'symptoms are Required';
        }

        return null;
      },
    );
  }

  Widget _buildReasons(String reasons) {
    return TextFormField(
      enabled: _reasonsenable,
      controller: _reasons..text = reasons,
      decoration: const InputDecoration(
        icon: Icon(Icons.medical_services_outlined),
        hintText: 'وجوہات',
        labelText: 'Reasons',
      ),
      keyboardType: TextInputType.name,
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
        appBar: AppBar(title: Text("Add Medicines")),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(children: [
              FutureBuilder<AnimalMedicine>(
                  future: getAnimalMedicine(widget.MedicineId),
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
                              _buildmedicineName(snapshot.data.Name),
                              _buildMedicineType(snapshot.data.Type),
                              _buildRadio(),
                              _buildSymptoms(snapshot.data.Symptoms),
                              _buildReasons(snapshot.data.Reasons),
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
                                      if (_reasonsenable == false) {
                                        _reasonsenable = true;
                                      } else {
                                        _reasonsenable = false;
                                      }
                                      if (_symptomsenable == false) {
                                        _symptomsenable = true;
                                      } else {
                                        _symptomsenable = false;
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
                                  final medicinedao = database.AniMeddao;
                                  var rng = new Random();
                                  final medicine = AnimalMedicine(
                                      widget.MedicineId,
                                      _symptoms.text,
                                      _reasons.text,
                                      _name.text,
                                      dropdownvalue);

                                  medicinedao.updateAnimalMedicine(medicine);
                                  setState(() {});
                                  clearData();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MedicineList()),
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
          ),
        ));
  }

  Future<AnimalMedicine> getAnimalMedicine(int MedicineId) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final animaldao = database.AniMeddao;

    print(MedicineId);

    return await animaldao.getAllAnimalMedicineById(MedicineId);
  }

  void clearData() {
    _name.clear();
    _reasons.clear();
    _symptoms.clear();
  }
}
