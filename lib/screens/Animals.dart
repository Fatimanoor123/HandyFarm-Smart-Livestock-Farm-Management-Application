import 'package:flutter/material.dart';
import 'package:handyfarm/database/database.dart';
import 'package:handyfarm/entity/Animal.dart';
import 'package:handyfarm/screens/AnimalUpdateDelete.dart';

class AnimalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimalList();
  }
}

class _AnimalList extends State<AnimalList> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animals          جانور"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              deleteAnimals();
              setState(() {});
            },
          )
        ],
      ),
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
                                      snapshot.data.elementAt(position).Sex),
                                  trailing: IconButton(
                                    icon: Icon(
                                      //delete by id kesy karen gy
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        deleteSingleAnimal(
                                            snapshot.data.elementAt(position));
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    print("object");
                                    print(snapshot.data.elementAt(position).Id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnimalUpdate(
                                              AnimalId: snapshot.data
                                                  .elementAt(position)
                                                  .Id,
                                              name: snapshot.data
                                                  .elementAt(position)
                                                  .name,
                                              statusvalue: snapshot.data
                                                  .elementAt(position)
                                                  .AnimalStatus,
                                              Dob: snapshot.data
                                                  .elementAt(position)
                                                  .DOB,
                                              sex: snapshot.data
                                                  .elementAt(position)
                                                  .Sex,
                                              MotherName: snapshot.data
                                                  .elementAt(position)
                                                  .MotherName,
                                              fatherName: snapshot.data
                                                  .elementAt(position)
                                                  .FatherName,
                                              datePurchase: snapshot.data
                                                  .elementAt(position)
                                                  .DateofPurchase,
                                              dateLost: snapshot.data
                                                  .elementAt(position)
                                                  .DateLost,
                                              reason: snapshot.data
                                                  .elementAt(position)
                                                  .ReaasonLost,
                                              purchasefrom: snapshot.data
                                                  .elementAt(position)
                                                  .puchasefrom,
                                              url: snapshot.data
                                                  .elementAt(position)
                                                  .photo)),
                                    );
                                  }));
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

  Future<void> deleteSingleAnimal(Animal animal) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Employeedao = database.Animaldao;

    Employeedao.deleteAnimal(animal);
  }

  Future<void> deleteAnimals() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final Animaldao = database.Animaldao;

    return await Animaldao.deleteAllAnimal();
  }
}
