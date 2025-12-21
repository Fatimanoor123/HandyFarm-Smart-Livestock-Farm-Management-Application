import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Sale.dart';
import 'package:handyfarm/screens/Contacts.dart';
import 'package:handyfarm/screens/sale_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class SalesCRUD extends StatefulWidget {
  final int SaleId;
  String itemname;
  String saleprice;
  String name;
  String type;
  String date;
  String purchasefrom; // receives the value
  SalesCRUD(
      {Key key,
      this.SaleId,
      this.itemname,
      this.saleprice,
      this.name,
      this.type,
      this.date,
      this.purchasefrom})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SalesCRUDState();
  }
}

class _SalesCRUDState extends State<SalesCRUD> {
  bool _Nameenable = false;
  bool _priceenable = false;
  bool _purchaseenable = false;
  String dropdownvalue = 'Select';
  var items = ['Select', 'Tractors.', 'Cow Purchase.', 'Medicine Purchase'];
  TextEditingController _Itemname = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _purchasefrom = TextEditingController();
  TextEditingController _saleprice = TextEditingController();
  TextEditingController _totalsale = TextEditingController();
  TextEditingController _totalmilk = TextEditingController();

  //declare variable for Dropdown menu
  String purchase = 'Select';
  var purchaseitems = ['Select'];

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override

  //Todo NAME WIDGET....

  Widget _buildSaleDate(String date) {
    return Center(
        child: TextFormField(
      readOnly: true,
      controller: dateController..text = date,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Sale Date',
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

  Widget _buildPurchaseFrom() {
    return TextFormField(
      enabled: _purchaseenable,
      controller: _purchasefrom,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'خریدار کا نام؟',
        labelText: 'Name ',
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

  Widget _buildSalePrice(String itemPrice) {
    return Center(
        child: TextFormField(
      controller: _saleprice..text = itemPrice,
      decoration: const InputDecoration(
        icon: Icon(Icons.attach_money_sharp),
        hintText: 'قیمت فروخت',
        labelText: 'Sale Price',
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

  Widget _buildItemName(String itemName) {
    return TextFormField(
      enabled: _Nameenable,
      controller: _Itemname..text = itemName,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_pin_outlined, color: Colors.indigoAccent),
        hintText: 'شے کا نام؟',
        labelText: 'Item Name ',
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

  Widget _buildItemType(String type) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Sales Details")),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(24),
                child: Column(children: [
                  FutureBuilder<Sale>(
                      future: getSale(widget.SaleId),
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
                                  _buildSaleDate(snapshot.data.date),
                                  Text("Purchase From:"),
                                  _buildPurchaseFrom(),
                                  _buildSalePrice(snapshot.data.ItemPrice),
                                  _buildItemName(snapshot.data.itemName),
                                  Text("Item Type"),
                                  _buildItemType(snapshot.data.Type),
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
                                          if (_purchaseenable == false) {
                                            _purchaseenable = true;
                                          } else {
                                            _purchaseenable = false;
                                          }
                                          if (_priceenable == false) {
                                            _priceenable = true;
                                          } else {
                                            _priceenable = false;
                                          }
                                        });
                                      }),
                                  SizedBox(height: 100),
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
                                      final salesdao = database.saledao;
                                      final saless = Sale(
                                          widget.SaleId,
                                          dateController.text,
                                          _Itemname.text,
                                          _saleprice.text,
                                          _name.text,
                                          dropdownvalue,
                                          _purchasefrom.text);
                                      salesdao.updateSale(saless);
                                      setState(() {});
                                      clearData();
                                      clearData();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SaleList()),
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
                ]))));
  }

  Future<Sale> getSale(int SaleId) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final saledao = database.saledao;

    print(SaleId);

    return await saledao.getAllSaleById(SaleId);
  }

  void clearData() {
    _totalmilk.clear();
    _totalsale.clear();
    _saleprice.clear();
  }
}
