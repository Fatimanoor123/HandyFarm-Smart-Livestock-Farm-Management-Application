import 'package:flutter/material.dart';

import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Expense.dart';

import 'package:handyfarm/screens/EmployeeUpdate.dart';
import 'package:handyfarm/screens/ExpenseCRUD.dart';

class AllExpenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllExpenses();
  }
}

class _AllExpenses extends State<AllExpenses> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Expense>>(
            future: getExpense(),
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
                                title: Text(
                                    snapshot.data.elementAt(position).name),
                                subtitle: Text(
                                    snapshot.data.elementAt(position).Amount),
                              ));
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpenseUpdate()),
                    );
                  }));
        });
  }

  Future<List<Expense>> getExpense() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Expenseedao = database.Expensedao;

    return await Expenseedao.getAllExpense();
  }
}
