import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Machine.dart';
import 'package:handyfarm/screens/MachineryList.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class MachinaryCRUD extends StatefulWidget {
  final int MachineId;
  String name;
  String type;
  String price;
  String date; // receives the value
  MachinaryCRUD(
      {Key key, this.MachineId, this.name, this.type, this.price, this.date})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MachinaryCRUDState();
  }
}

class _MachinaryCRUDState extends State<MachinaryCRUD> {
  bool _Nameenable = false;
  bool _priceenable = false;
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

//TODO Build Profile
  Widget _buildprofile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: _imageFile == null
                  ? AssetImage("assets/add_machinary.png")
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
  Widget _buildmachineName(String name) {
    return TextFormField(
      enabled: _Nameenable,
      controller: _machineryname..text = name,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'مشینری کا نام',
        labelText: 'Machinary Name',
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

  Widget _buildMachineryType(String machineType) {
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

  Widget _buildMachineryPrice(String machinePrice) {
    return Center(
        child: TextFormField(
      enabled: _priceenable,
      controller: _machineryprice..text = machinePrice,
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

  Widget _buildDateofPurchase(String purchaseDate) {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController..text = purchaseDate,
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
        appBar: AppBar(title: Text("Add Machinery")),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              child: Column(children: [
                FutureBuilder<Machine>(
                    future: getMachine(widget.MachineId),
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
                                _buildprofile(),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                                _buildmachineName(snapshot.data.Machinename),
                                _buildMachineryType(snapshot.data.MachineType),
                                _buildMachineryPrice(
                                    snapshot.data.MachinePrice),
                                _buildDateofPurchase(
                                    snapshot.data.PurchaseDate),
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
                                    final machinedao = database.machinedao;
                                    var rng = new Random();
                                    final machine = Machine(
                                        widget.MachineId,
                                        _machineryname.text,
                                        dropdownvalue,
                                        dateController.text,
                                        _machineryprice.text);
                                    machinedao.updateMachine(machine);
                                    //Send to API
                                    setState(() {});
                                    clearData();

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MachineryList()),
                                    );
                                    //Send to API
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              ])),
        ));
  }

  Future<Machine> getMachine(int MachineId) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final machinedao = database.machinedao;

    print(MachineId);

    return await machinedao.getAllMachineById(MachineId);
  }

  void clearData() {
    _address.clear();
    _machineryprice.clear();
    _machineryname.clear();
  }
}
