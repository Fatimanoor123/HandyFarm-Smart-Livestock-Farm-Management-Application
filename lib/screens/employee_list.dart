import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/employe.dart';
import 'package:handyfarm/screens/EmployeeUpdate.dart';

class EmployeeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployeeList();
  }
}

class _EmployeeList extends State<EmployeeList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees ( ملازمین )"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteEmployee();
              setState(() {});
            },
          )
        ],
      ),
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
                                      snapshot.data.elementAt(position).name),
                                  subtitle: Text(
                                      snapshot.data.elementAt(position).Email),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleEmployee(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    print("object");
                                    print(snapshot.data
                                        .elementAt(position)
                                        .SalaryId);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EmployeeUpdate(
                                                userId: snapshot.data
                                                    .elementAt(position)
                                                    .Id,
                                                salaryId: snapshot.data
                                                    .elementAt(position)
                                                    .SalaryId,
                                                name: snapshot.data
                                                    .elementAt(position)
                                                    .name,
                                                address: snapshot.data
                                                    .elementAt(position)
                                                    .Address,
                                                email: snapshot.data
                                                    .elementAt(position)
                                                    .Email,
                                                phone: snapshot.data
                                                    .elementAt(position)
                                                    .phonenumber,
                                                url: snapshot.data
                                                    .elementAt(position)
                                                    .photo,
                                              )),
                                    );
                                  }));
                        }));
              }
            }),
      ),
    );
  }

  Future<List<Employee>> getEmployee() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Employeedao = database.employeeDAO;

    return await Employeedao.getAllEmployee();
  }

  Future<void> deleteSingleEmployee(Employee employee) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Employeedao = database.employeeDAO;

    Employeedao.deleteEmployee(employee);
  }

  Future<void> deleteEmployee() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final employeeDAO = database.employeeDAO;

    return await employeeDAO.deleteAllEmployee();
  }
}
