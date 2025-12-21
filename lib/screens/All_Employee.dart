import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/employe.dart';
import 'package:handyfarm/screens/EmployeeUpdate.dart';

class AllEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllEmployee();
  }
}

class _AllEmployee extends State<AllEmployee> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List<Employee>>(
                future: getEmployee(),
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
                              title:
                                  Text(snapshot.data.elementAt(position).name),
                              subtitle:
                                  Text(snapshot.data.elementAt(position).Email),
                            ));
                      },
                    ));
                  }
                })));
  }

  Future<List<Employee>> getEmployee() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Employeedao = database.employeeDAO;

    return await Employeedao.getAllEmployee();
  }
}
