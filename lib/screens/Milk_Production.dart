import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handyfarm/dao/MilkProductionDAO.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/MilkProduction.dart';
import 'package:handyfarm/screens/milk_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddMilk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMilkState();
  }
}

class _AddMilkState extends State<AddMilk> {
  TextEditingController _name = TextEditingController();
  int group = 1;
  TextEditingController _address = TextEditingController();
  TextEditingController _totalsale = TextEditingController();
  TextEditingController _totalmilk = TextEditingController();
  TextEditingController _cattle = TextEditingController();
  //declare variable for Dropdown menu
  String dropdownvalue = 'Select';
  var items = ['Select', 'Bulk', 'Individual'];

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override

  //Todo NAME WIDGET....

  Widget _buildMilkDate() {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Milking Date',
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

  Widget _buildMilkType() {
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
            MdiIcons.cow,
            color: Colors.black,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalMilk() {
    return TextFormField(
      controller: _totalmilk,
      decoration: const InputDecoration(
        icon: Icon(Icons.add),
        hintText: 'کل دودھ',
        labelText: 'Total Milk',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Total Milk is Required';
        }

        return null;
      },
    );
  }

  Widget _buildTotalMilkSale() {
    return TextFormField(
      controller: _totalsale,
      decoration: const InputDecoration(
        icon: Icon(
          MdiIcons.sale,
        ),
        hintText: 'دودھ کی کل فروخت',
        labelText: 'Total Milk Sale',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Working hours is Required';
        }
        return null;
      },
    );
  }

  Widget __buildNoOfCattleMilked() {
    return TextFormField(
      controller: _cattle,
      decoration: const InputDecoration(
        icon: Icon(
          MdiIcons.cow,
        ),
        hintText: 'دودھ دینے والے مویشیوں کی تعداد',
        labelText: 'Number of Cattles Milked',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Working hours is Required';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Milk دودھ کی تفصیلات")),
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
                _buildMilkDate(),
                _buildMilkType(),
                _buildTotalMilk(),
                _buildTotalMilkSale(),
                __buildNoOfCattleMilked(),
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
                    final milkdao = database.milkdao;
                    var rng = new Random();
                    final milk = MilkProduction(
                        rng.nextInt(10000),
                        _name.text,
                        _totalmilk.text,
                        _totalsale.text,
                        _cattle.text,
                        dateController.text);
                    int milkId = await milkdao.insertMilkProduction(milk);
                    setState(() {});
                    clearData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MilkList()),
                    ); //Send to API
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
    _address.clear();
    _totalsale.clear();
    _cattle.clear();
    _totalmilk.clear();
  }
}
