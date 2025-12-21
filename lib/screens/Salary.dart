import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Salary.dart';
import 'package:handyfarm/screens/MachinaryCRUD.dart';

class SalaryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SalaryList();
  }
}

class _SalaryList extends State<SalaryList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salary list"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteSalary();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Salary>>(
            future: getSalary(),
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
                                      .TotalSalary),
                                  subtitle: Text(snapshot.data
                                      .elementAt(position)
                                      .WorkingHours),
                                  trailing: Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  ),
                                  onTap: () {}));
                        }));
              }
            }),
      ),
    );
  }

  ListView getMedicineListView() {
    TextStyle titlestyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: Count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                  leading: CircleAvatar(),
                  title: Text("Name of Animal"),
                  subtitle: Text("dummy date"),
                  trailing: Icon(
                    Icons.auto_delete,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    NavigateToSalary();
                  }));
        });
  }

  void NavigateToSalary() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MachinaryCRUD()),
    );
  }

  Future<List<Salary>> getSalary() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final salarydao = database.salarydao;

    return await salarydao.getAllSalary();
  }

  Future<void> deleteSalary() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final saledao = database.salarydao;

    return await saledao.deleteAllSalary();
  }
}
