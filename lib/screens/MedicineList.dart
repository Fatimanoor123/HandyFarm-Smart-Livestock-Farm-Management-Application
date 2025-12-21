import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/AnimalMedicine.dart';
import 'package:handyfarm/entity/Medicine.dart';
import 'package:handyfarm/screens/MedicineCRUD.dart';

class MedicineList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MedicineList();
  }
}

class _MedicineList extends State<MedicineList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicines ( ادویات )"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteMedicine();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<AnimalMedicine>>(
            future: getMedicine(),
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
                                      snapshot.data.elementAt(position).Name),
                                  subtitle: Text(snapshot.data
                                      .elementAt(position)
                                      .Symptoms),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleMedicine(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MedicineCRUD(
                                              MedicineId: snapshot.data
                                                  .elementAt(position)
                                                  .Id,
                                              name: snapshot.data
                                                  .elementAt(position)
                                                  .Name,
                                              type: snapshot.data
                                                  .elementAt(position)
                                                  .Type,
                                              reason: snapshot.data
                                                  .elementAt(position)
                                                  .Reasons,
                                              symptoms: snapshot.data
                                                  .elementAt(position)
                                                  .Symptoms)),
                                    );
                                  }));
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
                    NavigateToEmployee();
                  }));
        });
  }

  void NavigateToEmployee() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MedicineCRUD()),
    );
  }

  Future<List<AnimalMedicine>> getMedicine() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final AniMeddao = database.AniMeddao;

    return await AniMeddao.getAllAnimalMedicine();
  }

  Future<void> deleteSingleMedicine(AnimalMedicine medicine) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final medicinedao = database.AniMeddao;

    medicinedao.deleteAnimalMedicine(medicine);
  }

  Future<void> deleteMedicine() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final AniMeddao = database.AniMeddao;

    return await AniMeddao.deleteAllAnimalMedicine();
  }
}
