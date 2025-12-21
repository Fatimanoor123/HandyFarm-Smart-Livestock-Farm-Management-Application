import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Animal.dart';
import 'package:handyfarm/screens/AnimalUpdateDelete.dart';

class All_Animals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _All_Animals();
  }
}

class _All_Animals extends State<All_Animals> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Animal>>(
            future: getAnimal(),
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
                                subtitle:
                                    Text(snapshot.data.elementAt(position).Sex),
                              ));
                        }));
              }
            }),
      ),
    );
  }

  Future<List<Animal>> getAnimal() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Animaldao = database.Animaldao;

    return await Animaldao.getAllAnimal();
  }
}
