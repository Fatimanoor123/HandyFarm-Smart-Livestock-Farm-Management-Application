import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/employe.dart';
import 'package:handyfarm/entity/farm.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Registration();
  }
}

class _Registration extends State<RegistrationForm> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String _url;
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _farmname = TextEditingController();
  TextEditingController _Farmaddress = TextEditingController();

  //declare variable for Dropdown menu
  String dropdownvalue = 'Owner';
  var items = ['Owner', 'employee'];

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
              bottom: 4.0,
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
                    size: 30.0,
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
        hintText: ' نام؟',
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

  Widget _buildFarmName() {
    return TextFormField(
      controller: _farmname,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'فارم کا نام',
        labelText: 'Farm Name ',
      ),
      keyboardType: TextInputType.name,
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Farm Name is Required';
        }

        return null;
      },
    );
  }

  Widget _buildFarmAddress() {
    return TextFormField(
      controller: _Farmaddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.agriculture_outlined),
        labelText: 'Farm Address',
        hintText: 'فارم کا پتہ',
      ),
      keyboardType: TextInputType.text,
      validator: (String adress) {
        if (adress == null) {
          return 'Enter ress';
        }

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

  //Todo Password WIDGET....
  Widget _buildPassword() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        labelText: 'Password',
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
    );
  }

  Widget _buildFarmDate() {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Pick Farm Date',
      ),
      onTap: () async {
        var date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //here is the restriction...
            firstDate: DateTime(DateTime.now().year - 5),
            lastDate: DateTime(DateTime.now().year + 5));
        dateController.text = date.toString().substring(0, 10);
      },
    ));
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: _phoneNumber,
      decoration: const InputDecoration(
        icon: Icon(Icons.add_call),
        labelText: 'Phone number',
        hintText: ' فون نمبر',
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      controller: _address,
      decoration: const InputDecoration(
        icon: Icon(Icons.home),
        labelText: 'Address',
        hintText: 'آپ کا پتہ',
      ),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value == null) {
          return 'Enter valid address';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 2.0, // gap between adjacent chips
                  runSpacing: 4.0,
                  children: <Widget>[
                    _buildprofile(),
                    Text(
                      'Farm',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    _buildFarmName(),
                    _buildFarmAddress(),
                    _buildFarmDate(),
                    Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    Text(
                      'Personal Information',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    _buildName(),
                    _buildEmail(),
                    _buildPassword(),
                    _buildPhoneNumber(),
                    _buildAddress(),
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
                        /*final database = await $FloorAppDatabase
                            .databaseBuilder('app_database.db')
                            .build();
                        final farmdao = database.farmDAO;
                        final farm = Farm(dateController.text, _farmname.text,
                            _Farmaddress.text);
                        int formId = await farmdao.insertFarm(farm);
                        final Employeedao = database.employeeDAO;
                        final employee = Employee(_name.text, _address.text,
                            _email.text, _phoneNumber.text, _url);
                        int employeeId =
                            await Employeedao.insertEmployee(employee);
                        setState(() {}); */
                        //Send to API
                      },
                    )
                  ],
                ),
              ),
            ),
            //for showing employee list
          ],
        ),
      ),
    );
  }
}
