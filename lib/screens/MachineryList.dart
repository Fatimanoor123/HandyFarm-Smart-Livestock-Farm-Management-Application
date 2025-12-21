import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Machine.dart';
import 'package:handyfarm/screens/EmployeeUpdate.dart';
import 'package:handyfarm/screens/MachinaryCRUD.dart';

class MachineryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MachineryList();
  }
}

class _MachineryList extends State<MachineryList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Machine ( مشینری )"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteMachinery();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Machine>>(
            future: getMachine(),
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
                                  title: Text(snapshot.data
                                      .elementAt(position)
                                      .Machinename),
                                  subtitle: Text(snapshot.data
                                      .elementAt(position)
                                      .MachineType),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleMachinery(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MachinaryCRUD(
                                                MachineId: snapshot.data
                                                    .elementAt(position)
                                                    .Id,
                                                name: snapshot.data
                                                    .elementAt(position)
                                                    .Machinename,
                                                type: snapshot.data
                                                    .elementAt(position)
                                                    .MachineType,
                                                price: snapshot.data
                                                    .elementAt(position)
                                                    .MachinePrice,
                                                date: snapshot.data
                                                    .elementAt(position)
                                                    .PurchaseDate,
                                              )),
                                    );
                                  }));
                        }));
              }
            }),
      ),
    );
  }

  ListView getEmployeeListView() {
    TextStyle titlestyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: Count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                  leading: CircleAvatar(),
                  title: Text("Name of employee"),
                  subtitle: Text("dummy date"),
                  trailing: Icon(
                    Icons.auto_delete,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    //NavigateToEmployee();
                  }));
        });
  }

  /* void NavigateToEmployee() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeUpdate()),
    );
  }*/

  Future<List<Machine>> getMachine() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final machinedao = database.machinedao;

    return await machinedao.getAllMachine();
  }

  Future<void> deleteSingleMachinery(Machine machine) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final machinedao = database.machinedao;

    machinedao.deleteMachine(machine);
  }

  Future<void> deleteMachinery() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final machinedao = database.machinedao;

    return await machinedao.deleteAllMachine();
  }
}
