import 'package:flutter/material.dart';
import 'package:handyfarm/entity/AnimalMedicine.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Contact.dart';
import 'package:handyfarm/screens/Contacts.dart';
import 'package:handyfarm/screens/MedicineList.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddContactState();
  }
}

class _AddContactState extends State<AddContact> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _url = TextEditingController();

  //declare variable for Dropdown menu

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override

  //Todo NAME WIDGET....
  Widget _buildContactName() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        icon: Icon(
          MdiIcons.human,
        ),
        hintText: ' نام',
        labelText: 'Contact Name',
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

  Widget _buildAddress() {
    return TextFormField(
      controller: _address,
      decoration: const InputDecoration(
        icon: Icon(Icons.home),
        hintText: 'پتہ',
        labelText: 'Address',
      ),
      keyboardType: TextInputType.streetAddress,
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address are Required';
        }

        return null;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'ای میل',
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

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
          if (value.isEmpty) {
            return 'Phone number is Required';
          }

          return null;
        });
  }

  Widget _buildurl() {
    return TextFormField(
      controller: _url,
      decoration: const InputDecoration(
        icon: Icon(Icons.add_link),
        labelText: 'URL',
      ),
      keyboardType: TextInputType.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact")),
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
                _buildContactName(),
                _buildAddress(),
                _buildEmail(),
                _buildPhoneNumber(),
                _buildurl(),
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
                    final contactdao = database.contactdao;
                    final contact = Contact(_name.text, _address.text,
                        _phoneNumber.text, _email.text, _url.text);
                    int MedicineId = await contactdao.insertContact(contact);
                    setState(() {});
                    clearData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactsList()),
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
    _email.clear();
    _address.clear();
    _phoneNumber.clear();
  }
}
