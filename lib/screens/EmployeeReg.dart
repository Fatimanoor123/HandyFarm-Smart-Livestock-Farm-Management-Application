import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Salary.dart';
import 'package:handyfarm/entity/employe.dart';
import 'package:handyfarm/screens/employee_list.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmployeeReg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployeeReg();
  }
}

class _EmployeeReg extends State<EmployeeReg> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _basicpay = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _work = TextEditingController();
  TextEditingController _totalSalary = TextEditingController();
  String _url;
  //declare variable for Dropdown menu
  String dropdownvalue = 'Select';
  var items = [
    'Select',
    'Worker',
    'Laborers',
    'Animal breeder',
    'Sorters & Graders'
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

//TODO Build Profile
  Widget _buildprofile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: _imageFile == null
                  ? AssetImage("assets/profile1.png")
                  : FileImage(File(_imageFile.path))),
          Positioned(
              bottom: 5.0,
              right: 12.0,
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => BottomSheet()),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.teal,
                    size: 28.0,
                  ))),
        ],
      ),
    );
  }

  //TODO Pop up message
  Widget BottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ]),
        ]));
  }

//TODO take image...
  void takePhoto(ImageSource source) async {
    PickedFile pickedFile = await _picker.getImage(
      source: source,
    );
    var file = File(pickedFile.path);

    List<int> imageBytes = file.readAsBytesSync();
    _url = base64Encode(imageBytes);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  //Todo NAME WIDGET....
  Widget _buildName() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: ' ملازم کا نام؟',
        labelText: 'Name ',
      ),
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter(RegExp("[a-z.]")),
      ],
      maxLength: 30,
      validator: (String value) {
        if (value.length < 3) {
          return 'Name must be more than 2 charater';
        } else
          return null;
      },
    );
  }

  //Todo Email WIDGET....
  Widget _buildEmail() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'ای میل',
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
    );
  }

  Widget _buildWorkinghours() {
    return TextFormField(
      controller: _work,
      decoration: const InputDecoration(
        icon: Icon(Icons.work),
        hintText: 'کام کے اوقات',
        labelText: 'Working Hours',
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.length >= 2)
          return 'Working hours must be of 2 digits';
        else
          return null;

        return null;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
        controller: _phoneNumber,
        decoration: const InputDecoration(
          icon: Icon(Icons.add_call),
          hintText: ' فون نمبر',
          labelText: 'Phone Number',
        ),
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.length < 11 && value.length > 13)
            return 'Mobile Number must be between 11-13 digits';
          else
            return null;
        });
  }

  Widget _buildDesignation() {
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
            MdiIcons.accountHardHat,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      controller: _address,
      decoration: const InputDecoration(
        icon: Icon(Icons.home),
        hintText: 'گھر کا پتہ',
        labelText: 'Home Address',
      ),
      keyboardType: TextInputType.text,
      validator: (String adress) {
        if (adress == null) {
          return 'Enter valid address';
        }

        return null;
      },
    );
  }

  Widget _buildTotalSalary() {
    return Center(
        child: TextFormField(
      controller: _totalSalary,
      decoration: const InputDecoration(
        icon: Icon(Icons.attach_money_sharp),
        hintText: 'کل تنخواہ',
        labelText: 'Total Salary',
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

  Widget _buildbasicPay() {
    return Center(
        child: TextFormField(
      controller: _basicpay,
      decoration: const InputDecoration(
        icon: Icon(Icons.attach_money_sharp),
        hintText: 'بنیادی تنخواہ',
        labelText: 'Basic Pay',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee  (ملازم کا اندراج)"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 6.0, // gap between adjacent chips
                  runSpacing: 4.0,
                  children: <Widget>[
                    _buildprofile(),
                    Text(
                      'Personal Information  ذاتی معلومات',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    _buildName(),
                    _buildEmail(),
                    _buildDesignation(),
                    _buildPhoneNumber(),
                    _buildAddress(),
                    Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Text(
                      'Salary  (تنخواہ)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    _buildbasicPay(),
                    _buildWorkinghours(),
                    _buildTotalSalary(),
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        final database = await $FloorAppDatabase
                            .databaseBuilder('app_database.db')
                            .build();
                        var rng = new Random();
                        final Salarydao = database.salarydao;
                        int sid = rng.nextInt(1000000);
                        final salaryy = Salary(
                            sid, _basicpay.text, _totalSalary.text, _work.text);
                        int SalaryId = await Salarydao.insertSalary(salaryy);
                        final Employeedao = database.employeeDAO;
                        final employee = Employee(
                            rng.nextInt(10000),
                            _name.text,
                            _address.text,
                            _email.text,
                            _phoneNumber.text,
                            _url,
                            sid);
                        int employeeId =
                            await Employeedao.insertEmployee(employee);
                        setState(() {});
                        clearData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeList()),
                        );
                        //Send to API
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearData() {
    _name.clear();
    _phoneNumber.clear();
    _email.clear();
    _work.clear();
    _totalSalary.clear();
    _basicpay.clear();
    _address.clear();
  }
}
