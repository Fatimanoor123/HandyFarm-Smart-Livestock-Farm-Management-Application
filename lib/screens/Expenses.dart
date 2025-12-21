import 'package:flutter/material.dart';

import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Expense.dart';

import 'package:handyfarm/screens/EmployeeUpdate.dart';
import 'package:handyfarm/screens/ExpenseCRUD.dart';

class ExpenseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpenseList();
  }
}

class _ExpenseList extends State<ExpenseList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses      ( اخراجات )"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteExpenses();
              setState(() {});
            },
          )
        ],
      ),
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
                                      snapshot.data.elementAt(position).Amount),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleExpense(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ExpenseUpdate(
                                                Id: snapshot.data
                                                    .elementAt(position)
                                                    .Id,
                                                price: snapshot.data
                                                    .elementAt(position)
                                                    .Amount,
                                                date: snapshot.data
                                                    .elementAt(position)
                                                    .date,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpenseUpdate()),
                    );
                  }));
        });
  }

  /*void NavigateToEmployee() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeUpdate()),
    );
  }*/

  Future<List<Expense>> getExpense() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Expenseedao = database.Expensedao;

    return await Expenseedao.getAllExpense();
  }

  Future<void> deleteSingleExpense(Expense expense) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final expensedao = database.Expensedao;

    expensedao.deleteExpense(expense);
  }

  Future<void> deleteExpenses() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Expensedao = database.Expensedao;

    return await Expensedao.deleteAllExpense();
  }
}
