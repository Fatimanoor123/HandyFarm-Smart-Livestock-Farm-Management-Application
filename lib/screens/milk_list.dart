import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/MilkProduction.dart';
import 'package:handyfarm/screens/MilkCRUD.dart';
import 'package:handyfarm/screens/Milk_Production.dart';

class MilkList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MilkListState();
  }
}

class _MilkListState extends State<MilkList> {
  int count = 0;

  //date and time declaration
  final dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Milk Production"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteMilkList();
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<MilkProduction>>(
            future: getMilk(),
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
                                      .MilkType),
                                  subtitle: Text(snapshot.data
                                      .elementAt(position)
                                      .TotalMilkProduce),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleMilk(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MilkCRUD(
                                                MilkId: snapshot.data
                                                    .elementAt(position)
                                                    .Id,
                                                name: snapshot.data
                                                    .elementAt(position)
                                                    .MilkType,
                                                totalMilk: snapshot.data
                                                    .elementAt(position)
                                                    .TotalMilkProduce,
                                                totalmilksale: snapshot.data
                                                    .elementAt(position)
                                                    .TotalMilkSale,
                                                cattle: snapshot.data
                                                    .elementAt(position)
                                                    .cattle)));
                                  }));
                        }));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMilk()),
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

  Future<List<MilkProduction>> getMilk() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final saledao = database.milkdao;

    return await saledao.getAllMilkProduction();
  }

  Future<void> deleteSingleMilk(MilkProduction milk) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final milkdao = database.milkdao;

    milkdao.deleteMilkProduction(milk);
  }

  Future<void> deleteMilkList() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final milkdao = database.milkdao;

    return await milkdao.deleteAllMilkProduction();
  }
}
