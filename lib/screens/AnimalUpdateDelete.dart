import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handyfarm/dao/SpecieDAO.dart';
import 'package:handyfarm/entity/Animal.dart';
import 'package:handyfarm/entity/Specie.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/screens/Animals.dart';
import 'package:handyfarm/screens/Contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AnimalUpdate extends StatefulWidget {
  final int AnimalId;
  String name;
  String statusvalue;
  String Dob;
  String sex;
  String MotherName;
  String fatherName;
  String datePurchase;
  String dateLost;
  String reason;
  String url;
  String purchasefrom;
  // receives the value
  AnimalUpdate(
      {Key key,
      this.AnimalId,
      this.statusvalue,
      this.Dob,
      this.sex,
      this.MotherName,
      this.fatherName,
      this.datePurchase,
      this.dateLost,
      this.reason,
      this.url,
      this.name,
      this.purchasefrom})
      : super(key: key);
  @override
  _AnimalUpdate createState() => _AnimalUpdate();
}

class _AnimalUpdate extends State<AnimalUpdate> {
  bool _Nameenable = false;
  bool _fatherenable = false;
  bool _motherenable = false;
  bool _priceenable = false;
  bool _reasonenable = false;
  bool _purchaseenable = false;

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _fathername = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _reason = TextEditingController();
  String _url;

  TextEditingController _purchasefrom = TextEditingController();
  TextEditingController _mothername = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _speciename = TextEditingController();
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

  String statusvalue = 'Select';
  var status = [
    'Select',
    'Nursery',
    'Breeder',
    'Pregnant',
    'Dairy cattles',
    'Lost',
    ' Sold',
    'Dead'
  ];

  //declare variable for Dropdown menu
  String dropdownvalue = 'Select';
  var items = ['Select', 'Male', 'Female'];

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    //
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
            MdiIcons.cow,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

//TODO Build Profile
  Widget _buildprofile(String photo) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: ClipOval(
                  child: new Image.memory(Base64Decoder().convert(photo)))),
          Positioned(
              bottom: 2.0,
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
                    size: 35.0,
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
  Widget _buildName(String name) {
    return TextFormField(
      enabled: _Nameenable,
      controller: _name..text = name,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'جانورکا نام؟',
        labelText: 'Name ',
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

  Widget _builReasonLost(String reaasonLost) {
    return TextFormField(
      enabled: _reasonenable,
      controller: _reason..text = reaasonLost,
      decoration: const InputDecoration(
        icon: Icon(Icons.pets_sharp),
        hintText: 'کھو جانے کی وجہ؟',
        labelText: 'Reason',
      ),
      keyboardType: TextInputType.text,
      maxLength: 30,
    );
  }

  Widget _buildStatus(String animalStatus) {
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
          margin: EdgeInsets.only(top: 1.0, left: 0.3, right: 14.0),
          child: DropdownButton(
            value: statusvalue,
            isExpanded: true,
            items: status.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                statusvalue = newValue;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 4.0),
          child: Icon(
            Icons.analytics,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPurchaseFrom(String puchasefrom) {
    return TextFormField(
      enabled: _purchaseenable,
      controller: _purchasefrom..text = puchasefrom,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'خریدار کا نام؟',
        labelText: 'Name ',
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

  Widget _buildDateLost(String dateLost) {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController..text = dateLost,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Date Lost/ Die',
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

  Widget _buildSex(String sex) {
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
          margin: EdgeInsets.only(top: 2.0, left: 0.0, right: 16.0),
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
            Icons.analytics,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPurchasePrice(String price) {
    return Center(
        child: TextFormField(
      enabled: _priceenable,
      controller: _price..text = price,
      decoration: const InputDecoration(
        icon: Icon(Icons.money),
        hintText: 'قیمت خرید',
        labelText: 'Purchase price ',
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

  Widget _buildmother(String motherName) {
    return TextFormField(
      enabled: _motherenable,
      controller: _mothername..text = motherName,
      decoration: const InputDecoration(
        icon: Icon(
          MdiIcons.cow,
        ),
        hintText: 'ماں کا نام',
        labelText: 'Mother Name ',
      ),
      keyboardType: TextInputType.name,
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mother Name is Required';
        }

        return null;
      },
    );
  }

  Widget _buildfather(String fatherName) {
    return TextFormField(
      enabled: _fatherenable,
      controller: _fathername..text = fatherName,
      decoration: const InputDecoration(
        icon: Icon(MdiIcons.cow),
        hintText: 'والد کا نام',
        labelText: 'Father Name ',
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

  Widget _buildDOB(String dob) {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController..text = dob,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Pick Date Of Birth',
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

  Widget _buildDatePurchase(String dateofPurchase) {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController..text = dateofPurchase,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Date of Purchase',
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
      appBar: AppBar(title: Text("Edit Animal")),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(24),
            child: Column(children: [
              FutureBuilder<Animal>(
                  future: getAnimal(widget.AnimalId),
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
                              _buildprofile(snapshot.data.photo),
                              _buildSpecie(),
                              _buildName(snapshot.data.name),
                              _buildDOB(snapshot.data.DOB),
                              _buildSex(snapshot.data.Sex),
                              Divider(
                                height: 15,
                                thickness: 2,
                              ),
                              Text(
                                'Genetics',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              _buildmother(snapshot.data.MotherName),
                              _buildfather(snapshot.data.FatherName),
                              Divider(
                                height: 15,
                                thickness: 2,
                              ),
                              Text(
                                'Accounts',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              _buildDatePurchase(snapshot.data.DateofPurchase),
                              _buildPurchaseFrom(snapshot.data.puchasefrom),
                              _buildPurchasePrice(snapshot.data.price),
                              _buildDateLost(snapshot.data.DateLost),
                              _builReasonLost(snapshot.data.ReaasonLost),
                              _buildStatus(snapshot.data.AnimalStatus),
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
                                      if (_fatherenable == false) {
                                        _fatherenable = true;
                                      } else {
                                        _fatherenable = false;
                                      }
                                      if (_motherenable == false) {
                                        _motherenable = true;
                                      } else {
                                        _motherenable = false;
                                      }

                                      if (_reasonenable == false) {
                                        _reasonenable = true;
                                      } else {
                                        _reasonenable = false;
                                      }
                                      if (_purchaseenable == false) {
                                        _purchaseenable = true;
                                      } else {
                                        _purchaseenable = false;
                                      }
                                    });
                                  }),
                              SizedBox(width: 90),
                              RaisedButton(
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  ),
                                  onPressed: () async {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    }
                                    final database = await $FloorAppDatabase
                                        .databaseBuilder('app_database.db')
                                        .build();
                                    final speciedao = database.Speciedao;
                                    final specie = Specie(_speciename.text);
                                    int SpecieId =
                                        await speciedao.insertSpecie(specie);
                                    final animaldao = database.Animaldao;
                                    final animal = Animal(
                                        widget.AnimalId,
                                        _name.text,
                                        statusvalue,
                                        dateController.text,
                                        dateController.text,
                                        dateController.text,
                                        _fathername.text,
                                        _mothername.text,
                                        _price.text,
                                        _reason.text,
                                        dropdownvalue,
                                        SpecieId,
                                        _price.text,
                                        _purchasefrom.text);
                                    animaldao.updateAnimal(animal);
                                    setState(() {});
                                    clearData();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnimalList()),
                                    );
                                  })
                            ],
                          ),
                        ),
                      );
                    }
                  })
            ])),
      ),
    );
  }

  Future<Animal> getAnimal(int AnimalId) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final animaldao = database.Animaldao;

    print(AnimalId);

    return await animaldao.getAllAnimalById(AnimalId);
  }

  void clearData() {
    _name.clear();
    _phoneNumber.clear();
    _email.clear();
    _price.clear();
    _reason.clear();
    _mothername.clear();
    _fathername.clear();
    _speciename.clear();
  }
}
