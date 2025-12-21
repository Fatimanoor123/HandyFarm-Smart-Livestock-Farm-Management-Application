import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Sale.dart';
import 'package:handyfarm/screens/EmployeeUpdate.dart';
import 'package:handyfarm/screens/Milk_Production.dart';
import 'package:handyfarm/screens/SaleCRUD.dart';
import 'package:handyfarm/screens/Sales.dart';

class SaleList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SaleListState();
  }
}

class _SaleListState extends State<SaleList> {
  int count = 0;

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales    فروخت"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteSale();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Sale>>(
            future: getSale(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int position) {
                          return Card(
                              color: Colors.white,
                              elevation: 2.0,
                              child: ListTile(
                                  // leading: CircleAvatar(
                                  //   backgroundImage: NetworkImage(
                                  //     snapshot.data[position].photo,
                                  //   ),
                                  // ),
                                  // leading: new Image.memory(
                                  //     dataFromBase64String(snapshot.data
                                  //         .elementAt(position)
                                  //         .photo)),
                                  title: Text(
                                      snapshot.data.elementAt(position).Type),
                                  subtitle: Text(snapshot.data
                                      .elementAt(position)
                                      .ItemPrice),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleSale(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SalesCRUD(
                                              SaleId: snapshot.data
                                                  .elementAt(position)
                                                  .Id,
                                              date: snapshot.data
                                                  .elementAt(position)
                                                  .date,
                                              itemname: snapshot.data
                                                  .elementAt(position)
                                                  .itemName,
                                              saleprice: snapshot.data
                                                  .elementAt(position)
                                                  .ItemPrice,
                                              name: snapshot.data
                                                  .elementAt(position)
                                                  .name,
                                              type: snapshot.data
                                                  .elementAt(position)
                                                  .Type,
                                              purchasefrom: snapshot.data
                                                  .elementAt(position)
                                                  .purchasefrom)),
                                    );
                                  }));
                        }));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Sales()),
          );
        },
        child: Icon(Icons.add_circle),
      ),
    );
  }

  ListView getMilkList() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('Dummy'),
              subtitle: Text('dummmmmmmmmmmy'),
              trailing: Icon(Icons.delete),
            ),
          );
        });
  }

  /* void NavigateToEmployee() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeUpdate()),
    );
  }*/

  Future<List<Sale>> getSale() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final saledao = database.saledao;

    return await saledao.getAllSale();
  }

  Future<void> deleteSingleSale(Sale sale) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final saledao = database.saledao;

    saledao.deleteSale(sale);
  }

  Future<void> deleteSale() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final milkdao = database.saledao;

    return await milkdao.deleteAllSale();
  }
}
