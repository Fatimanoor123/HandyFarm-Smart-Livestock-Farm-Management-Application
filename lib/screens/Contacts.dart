import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Contact.dart';
import 'package:handyfarm/entity/employe.dart';
import 'package:handyfarm/screens/EmployeeUpdate.dart';
import 'package:handyfarm/screens/MachinaryCRUD.dart';
import 'package:handyfarm/screens/MedicineCRUD.dart';

class ContactsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactsList();
  }
}

class _ContactsList extends State<ContactsList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts    رابطہ کی فہرست"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteContact();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Contact>>(
            future: getContact(),
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
                                      .Contactname),
                                  subtitle: Text(
                                      snapshot.data.elementAt(position).Phone),
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
                    NavigateToMechine();
                  }));
        });
  }

  void NavigateToMechine() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MachinaryCRUD()),
    );
  }

  Future<List<Contact>> getContact() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final contactdao = database.contactdao;

    return await contactdao.getAllContact();
  }

  Future<void> deleteContact() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final contactdao = database.contactdao;

    return await contactdao.deleteAllContact();
  }
}
